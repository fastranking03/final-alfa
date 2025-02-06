import connect from "../../db/connect.js";

export const displayOrder = async (req, res) => {
  try {
    const query = `
      SELECT 
        o.*,
        u.name AS name, 
        a.address AS address,
        a.address_2 AS address_two 
      FROM new_order o
      LEFT JOIN alfa_users u ON o.user_id = u.id 
      LEFT JOIN customer_address a ON o.address_id = a.id
      ORDER BY o.created_at DESC
    `;

    const [orderList] = await connect.execute(query);
    res.render('admin/orders', { orderData: orderList });
  } catch (e) {
    console.log(e);
    res.status(500).send('Internal Server Error');
  }
};


export const displayOrderDetail = async (req, res) => {
  try {
    const { order_id } = req.params;
    const orderID = order_id;
 
    // SQL query to fetch all fields from relevant tables
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

    // Execute the query
    const [orderDetails] = await connect.execute(query, [order_id]);
    const order = orderDetails[0];
 
    const [orderItems] = await connect.execute(
      `SELECT 
          oi.*, 
          p.p_name AS product_name,
          p.p_image AS product_main_image,
          p.p_price AS product_price,
          r.r_status AS return_status,
          r.id as return_id
       FROM new_order_itemsss oi
       JOIN products p ON oi.product_id = p.id
       LEFT JOIN return_order r ON oi.id = r.order_item_id
       WHERE oi.orders_id = ?`,
      [order_id]
    );
  

    let subtotal = orderItems.reduce((acc, item) => acc + item.product_price * item.quantity, 0);
    let deliveryFee = subtotal < 100 ? 10 : 0;
    let vat = subtotal * 0.2;
    let totalCost = subtotal + vat + deliveryFee;
  

    res.render("admin/order-details", {orderID, order,orderItems ,subtotal ,totalCost , deliveryFee ,vat});
  } catch (e) {
    console.error("Error fetching order details:", e);
    res.status(500).send("Internal Server Error");
  }
};


export const updateStatus = async (req, res) => {
  const { status ,delivery_date } = req.body;
  const { order_id } = req.params;
  try {
    await connect.execute('UPDATE new_order SET status = ?, delivery_date = ? WHERE id = ?', [status, delivery_date, order_id]);
    res.redirect(`/admin/order-details/${order_id}`);
  } catch (e) {
    console.error("Error updating order status:", e);
    res.status(500).send("Internal Server Error");
  }
};

export const updateReturnStatus = async (req, res) => {
  const { order_id, return_id, status } = req.body;

  // Ensure all values are present
  if (!order_id || !return_id || !status) {
    console.error("Missing required fields:", { order_id, return_id, status });
    return res.status(400).send("Missing required fields");
  }

  try {
    const sql = 'UPDATE return_order SET r_status = ? WHERE id = ?';
    await connect.execute(sql, [status, return_id]);

    res.redirect(`/admin/order-details/${order_id}`);
  } catch (e) {
    console.error("Error updating order status:", e);
    res.status(500).send("Internal Server Error");
  }
};
