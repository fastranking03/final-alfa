import connect from "../db/connect.js";
import { getAllCategory } from "../services/admin/catService.js";
import { disAllType } from "../services/admin/typeService.js";
import { getCartData } from "../services/cartService.js";
import { getWishlistData } from "../services/wishlistService.js";

export const addToWishList = async (req, res) => {
    const productData = req.body;

    if (req.session.user) {
        try {
            const userId = req.session.user.id;
            const { product_id, product_name, product_price, quantity, product_image } = productData;

            // Check if the product already exists in the wishlist
            const [existingProduct] = await connect.execute(
                'SELECT * FROM alfa_whislist WHERE user_id = ? AND product_id = ?',
                [userId, product_id]
            );

            if (existingProduct.length > 0) {
                return res.json({ success: false, message: 'Product is already in your wishlist.' });
            } 

            // Insert the product into the wishlist
            await connect.execute(
                'INSERT INTO alfa_whislist (user_id, product_id, product_name, product_price, quantity, product_image, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())',
                [userId, product_id, product_name, product_price, quantity, product_image]
            );

            // Remove the product from the cart after adding to wishlist
            await connect.execute(
                'DELETE FROM alfa_cart WHERE user_id = ? AND product_id = ?',
                [userId, product_id]
            );

            res.json({ success: true, message: 'Product added to wishlist.' });
        } catch (err) {
            console.error(err);
            res.json({ success: false, message: 'Failed to add product to wishlist.' });
        }
    } else {
        res.json({ success: false, message: 'User not logged in.' });
    }
};

export const checkWishlist = async (req, res) => {
    if (req.session.user) {
        try {
            const userId = req.session.user.id;
            const { product_id } = req.query;

            const [existingProduct] = await connect.execute(
                'SELECT * FROM alfa_whislist WHERE user_id = ? AND product_id = ?',
                [userId, product_id]
            );

            if (existingProduct.length > 0) {
                return res.json({ exists: true });
            } else {
                return res.json({ exists: false });
            }
        } catch (err) {
            console.error(err);
            res.json({ success: false, message: 'Error checking wishlist status.' });
        }
    } else {
        res.json({ success: false, message: 'User not logged in.' });
    }
};


export const disWishList = async (req ,res) =>{
    try {
        const {  whislistData, wishlistCount } = await getWishlistData(req);
        const {cartData,cartCount } = await getCartData(req);
        const catData = await getAllCategory();
        const typeData =  await disAllType();
        const sizePromises = whislistData.map(async (item) => {
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
        const total = whislistData.reduce((sum, item) => {
            return sum + item.product_price * item.quantity;
        }, 0);

        const deliveryFee = total > 70 ? 10 : 0;

        res.render("my-wishlist", {
            whislistData,
            wishlistCount,
            sizesMap,
            total,
            deliveryFee,
            catData,
            cartData,
            cartCount,
            typeData
        });
    } catch (err) {
        console.error(err);
        res.render("my-wishlist", { whislistData: [], whislistData: 0, sizesMap: {}, total: 0, deliveryFee: 0 });
    }
}

 