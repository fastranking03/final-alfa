import connect from "../db/connect.js";
import { getAllCategory } from "../services/admin/catService.js";

export const generateReturnOrderId = async () => {
  const prefix = 'ALFARETURN';
  const query = 'SELECT MAX(return_order_id) AS lastOrderId FROM return_order WHERE return_order_id LIKE ?';
  const [rows] = await connect.execute(query, [`${prefix}%`]);

  const lastOrderId = rows[0]?.lastOrderId;

  if (lastOrderId) {
      const numericPart = parseInt(lastOrderId.replace(prefix, ''), 10);
      const newNumericPart = numericPart + 1;
      return `${prefix}${newNumericPart.toString().padStart(6, '0')}`;
  }

  return `${prefix}0001`;
}

export const displayOrderSuccess = async (req, res) => {
    try {
        const user = req.session.user;
        const query = `
          SELECT 
            o.*,
            u.name AS name, 
            a.address AS address,
             a.address_2 AS address_two
          FROM new_order o
          LEFT JOIN alfa_users u ON o.user_id = u.id 
          LEFT JOIN customer_address a ON o.address_id = a.id
          WHERE u.id = ?
        `;
        const [orderList] = await connect.execute(query,[user.id]);
        const catData = await getAllCategory();
        res.render('user-orders', { orderData: orderList ,catData});
    } catch (e) {
        console.log(e);
        res.status(500).send('Internal Server Error');
    }
};

export const displayUserOrders = async (req, res) => {
  try {
      const { order_id } = req.params;

      // Query to fetch order details
      const query = `
          SELECT 
              o.*, 
              u.name AS name, 
              a.full_name AS a_name,
              a.mobile AS phone,
              a.email AS email,
              a.postcode AS pincode,
              a.address AS full_address,
              a.address_2 AS address_two,
              a.city AS city
          FROM new_order o
          LEFT JOIN alfa_users u ON o.user_id = u.id 
          LEFT JOIN customer_address a ON o.address_id = a.id 
          WHERE o.id = ?
          ORDER BY o.created_at DESC
      `;

      const [orderDetails] = await connect.execute(query, [order_id]);
      const order = orderDetails[0];

      // Query to fetch order items and their return statuses
      const orderItemsQuery = `
          SELECT 
              oi.*, 
              p.p_name AS product_name,
              p.p_image AS product_main_image,
              p.p_price AS product_price,
              r.r_status AS return_status
          FROM new_order_itemsss oi
          JOIN products p ON oi.product_id = p.id
          LEFT JOIN return_order r ON oi.id = r.order_item_id
          WHERE oi.orders_id = ?
      `;

      const [orderItems] = await connect.execute(orderItemsQuery, [order_id]);

      // Calculate costs
      let subtotal = orderItems.reduce((acc, item) => acc + item.product_price * item.quantity, 0);
      let deliveryFee = subtotal < 75 ? 10 : 0;
      let vat = subtotal * 0.2;
      let totalCost = subtotal + vat + deliveryFee;
      const catData = await getAllCategory();
      res.render("user-order-detail", {
          orderID: order_id,
          order,
          orderItems,
          subtotal,
          totalCost,
          deliveryFee,
          vat,
          catData
      });
  } catch (e) {
      console.error(e);
      res.status(500).send("Internal Server Error");
  }
};


  export const returnOrder = async (req,res) =>{
    try {
         const {order_id,order_item_id,reason,by_cs, comment} = req.body;
          
         const return_order_id = await generateReturnOrderId();
         
         await connect.execute(
            'INSERT INTO return_order (order_id,order_item_id, return_order_id, reason, by_cs, comment, r_status) VALUES (?, ?, ?, ?, ?, ?, ?)',
            [order_id,order_item_id, return_order_id, reason, by_cs, comment,'PENDING']
        );
        // req.flash('success', 'Request send Successfully!');
        res.redirect(`/user-order-detail/${order_id}`);
      } catch (error) {
         res.status(500).render({ message: "An error occurred while cancelling the order." });
      }  
}
