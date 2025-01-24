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
      `SELECT oi.*, p.*
       FROM new_order_itemsss oi 
       JOIN products p ON oi.product_id = p.id 
       WHERE oi.orders_id = ?`,
      [order_id]
    );
    console.log("Order Items:", orderItems);

    let subtotal = orderItems.reduce((acc, item) => {
      const productPrice = parseFloat(item.p_price) || 0;
      const quantity = parseInt(item.quantity, 10) || 0; 
      return acc + productPrice * quantity;
    }, 0)
    console.log(subtotal)
    let deliveryFee = subtotal < 75 ? 10 : 0;
    let vat = subtotal * 0.2;
    let totalCost = subtotal +  vat + deliveryFee;
    console.log(totalCost)

    res.render("admin/order-details", {orderID, order,orderItems ,subtotal ,totalCost , deliveryFee ,vat});
  } catch (e) {
    console.error("Error fetching order details:", e);
    res.status(500).send("Internal Server Error");
  }
};


export const updateStatus = async (req, res) => {
  const { status } = req.body;
  const { order_id } = req.params;
  try {
    await connect.execute('UPDATE new_order SET status = ? WHERE id = ?', [status, order_id]);
    res.redirect(`/admin/order-details/${order_id}`);
  } catch (e) {
    console.error("Error updating order status:", e);
    res.status(500).send("Internal Server Error");
  }
};
