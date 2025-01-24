import connect from "../db/connect.js";
import { getAllCategory } from "../services/admin/catService.js";
import { getCartData } from "../services/cartService.js";

export const addToCart = async (req, res) => {
    const productData = req.body;

    if (req.session.user) {
        try {
            const userId = req.session.user.id;
            const { product_id, product_name, product_size, product_price, quantity, product_image } = productData;

            const [existingProduct] = await connect.execute(
                'SELECT quantity FROM alfa_cart WHERE user_id = ? AND product_id = ? AND product_size = ?',
                [userId, product_id, product_size]
            );

            if (existingProduct.length > 0) {

                await connect.execute(
                    'UPDATE alfa_cart SET quantity = quantity + ? WHERE user_id = ? AND product_id = ? AND product_size = ?',
                    [quantity, userId, product_id ,product_size]
                );
            } else {

                await connect.execute(
                    'INSERT INTO alfa_cart (user_id, product_id, product_name, product_size, product_price, quantity, product_image, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())',
                    [userId, product_id, product_name, product_size, product_price, quantity, product_image]
                );
            }

            res.json({ success: true, message: 'Product added to cart.' });
        } catch (err) {
            console.error(err);
            res.json({ success: false, message: 'Failed to add product to cart.' });
        }
    } else {

        if (!req.session.cart) {
            req.session.cart = [];
        }

        const existingProductIndex = req.session.cart.findIndex(item => item.product_id === productData.product_id && item.product_size === productData.product_size);

        if (existingProductIndex !== -1) {

            req.session.cart[existingProductIndex].quantity = parseInt(req.session.cart[existingProductIndex].quantity) + parseInt(productData.quantity);
        } else {

            req.session.cart.push(productData);
        }

        res.json({ success: true, message: 'Product added to cart in session.' });
    }
};

// Update Cart Value
export const updateCartQuantity = async (req, res) => {
    const { product_id, action } = req.body;

    if (req.session.user) {
        const userId = req.session.user.id;

        try {
            const [product] = await connect.execute(
                'SELECT quantity, product_price FROM alfa_cart WHERE user_id = ? AND product_id = ?',
                [userId, product_id]
            );

            if (product.length > 0) {
                let newQuantity = product[0].quantity;
                const productPrice = product[0].product_price;

                if (action === 'increase') {
                    newQuantity += 1;
                } else if (action === 'decrease' && newQuantity > 1) {
                    newQuantity -= 1;
                }

                await connect.execute(
                    'UPDATE alfa_cart SET quantity = ? WHERE user_id = ? AND product_id = ?',
                    [newQuantity, userId, product_id]
                );

                // Calculate subtotal for the updated product
                const newSubtotal = newQuantity * productPrice;

                // Get the total cost for all products in the cart
                const [cart] = await connect.execute(
                    'SELECT SUM(product_price * quantity) AS total FROM alfa_cart WHERE user_id = ?',
                    [userId]
                );
                const totalCost = cart[0].total;

                res.json({
                    success: true,
                    newQuantity: newQuantity,
                    newSubtotal: newSubtotal,
                    totalCost: totalCost
                });
            } else {
                res.json({ success: false, message: 'Product not found in cart.' });
            }
        } catch (err) {
            console.error(err);
            res.json({ success: false, message: 'Failed to update cart quantity.' });
        }
    } else {
        // Handle session-based cart for guest users
        if (req.session.cart) {
            const productIndex = req.session.cart.findIndex(item => item.product_id === product_id);
            if (productIndex !== -1) {
                let newQuantity = parseInt(req.session.cart[productIndex].quantity, 10);
                const productPrice = req.session.cart[productIndex].product_price;

                if (action === 'increase') {
                    newQuantity += 1;
                } else if (action === 'decrease' && newQuantity > 1) {
                    newQuantity -= 1;
                }

                req.session.cart[productIndex].quantity = parseInt(newQuantity);

                const newSubtotal = newQuantity * productPrice;
                const totalCost = req.session.cart.reduce((total, item) => total + (parseInt(item.product_price) * parseInt(item.quantity)), 0);

                res.json({
                    success: true,
                    newQuantity: newQuantity,
                    newSubtotal: newSubtotal,
                    totalCost: totalCost
                });
            } else {
                res.json({ success: false, message: 'Product not found in session cart.' });
            }
        } else {
            res.json({ success: false, message: 'No cart found in session.' });
        }
    }
};

// Update Size
export const updateCartSize = async (req,res) =>{
    const { product_id, size } = req.body;
    if (req.session.user) {
        // Logged-in user
        const userId = req.session.user.id;

        try {
            // Update the size in the database
            await connect.execute(
                'UPDATE alfa_cart SET product_size = ? WHERE user_id = ? AND product_id = ?',
                [size, userId, product_id]
            );
            res.json({ success: true, message: 'Size updated successfully.' });
        } catch (err) {
            console.error('Error updating size:', err);
            res.json({ success: false, message: 'Failed to update size.' });
        }
    } else {
        // Guest user (session-based cart)
        if (req.session.cart) {
            const productIndex = req.session.cart.findIndex(item => item.product_id === product_id);

            if (productIndex !== -1) {
                req.session.cart[productIndex].product_size = size;

                res.json({ success: true, message: 'Size updated successfully.' });
            } else {
                res.json({ success: false, message: 'Product not found in cart.' });
            }
        } else {
            res.json({ success: false, message: 'No cart found in session.' });
        }
    }
}

// Cart Delete Controller
export const removeCart = async (req, res) => {
    const { id: productId, size: productSize } = req.params;

    if (req.session.user) {
       
        try {
            const userId = req.session.user.id
            const [cart_query] = await connect.execute("DELETE FROM alfa_cart WHERE user_id =? AND product_id = ? AND product_size = ?", [userId, productId ,productSize])
            if (cart_query.affectedRows  > 0) {
                return res.json({ success: true, message: 'Item removed from cart successfully' });
            } else {
                return res.json({ success: false, message: 'Item not found in cart' });
            }

        } catch (e) {
            console.log(e)
            return res.status(500).json({ success: false, message: 'Error occurred while removing item from cart' });
        }
    }
    else {

        let cart = req.session.cart || [];
        const itemIndex = cart.findIndex(item => item.product_id === productId && item.product_size === productSize);
        
        if (itemIndex > -1) {
            cart.splice(itemIndex, 1);
            req.session.cart = cart;

            return res.json({ success: true, message: 'Item removed successfully' });
        } else {
            return res.json({ success: false, message: 'Item not found' });
        }
    }

}

// Display Cart Items
export const disCart = async (req, res, next) => {
    try {
        const { cartData, cartCount } = await getCartData(req);
        const catData = await getAllCategory();
        const sizePromises = cartData.map(async (item) => {
            const [sizesData] = await connect.execute(
                "SELECT size, quantity FROM p_size WHERE product_id = ?",
                [item.product_id]
            );
            return { product_id: item.product_id, sizes: sizesData };
        });
        const sizesDataArray = await Promise.all(sizePromises);

        const sizesMap = sizesDataArray.reduce((map, data) => {
            map[data.product_id] = data.sizes;
            return map;
        }, {});

        // Calculate total price and delivery fee
        const total = cartData.reduce((sum, item) => {
            return sum + item.product_price * item.quantity;
        }, 0);

        const deliveryFee = total < 70 ? 10 : 0;

        res.render("my-cart", {
            cartData,
            cartCount,
            sizesMap,
            total,
            deliveryFee,
            catData
        });
    } catch (err) {
        console.error(err);
        res.render("my-cart", { cartData: [], cartCount: 0, sizesMap: {}, total: 0, deliveryFee: 0 });
    }
};

export const addAddress = async (req, res) => {
    try {
        const userId = req.session.user.id
        const { full_name, mobile, email, address, address_2, city, postcode, address_type } = req.body
        await connect.execute("INSERT INTO customer_address (user_id, full_name, mobile ,email, address,address_2, city, postcode,address_type,created_at) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())", [userId, full_name, mobile, email, address, address_2, city, postcode, address_type])
        res.redirect('/delivery-info')
    } catch (e) {
        console.log(e)
        res.render('delivery-info', { message: "Something wrong in query" })
    }
}

export const disAddress = async (req, res) => {
    try {
        const userId = req.session.user.id;
        const { cartData, cartCount } = await getCartData(req);
        const catData = await getAllCategory();
        const [cu_address] = await connect.execute("SELECT * FROM customer_address WHERE user_id = ?", [userId]);

        // Calculate total price and delivery fee
        const total = cartData.reduce((sum, item) => {
            return sum + item.product_price * item.quantity;
        }, 0);

        const deliveryFee = total < 70 ? 10 : 0;
        const vat = total * 0.2;

        res.render('delivery-info', { cu_address, cartData, cartCount,catData ,total ,deliveryFee,vat})

    } catch (e) {
        console.log(e)
        res.render('delivery-info', { cartData: [], cartCount: 0 });
    }
}