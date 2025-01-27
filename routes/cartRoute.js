import express from "express";
import { addToCart ,disCart ,addAddress ,disAddress ,updateCartQuantity, removeCart ,updateCartSize ,updateAddress} from "../controllers/cartController.js";
import { ensureAuthenticated } from "../middleware/authMiddleware.js";
import { buyNow } from "../controllers/buynowController.js";
import { getCartData } from "../services/cartService.js";
import { getAllCategory } from "../services/admin/catService.js";
import { disAllType } from "../services/admin/typeService.js";
import connect from "../db/connect.js";

const router = express.Router();

router.get('/my-cart', disCart);

router.post('/add-to-cart', addToCart);

router.get('/delivery-info', ensureAuthenticated, disAddress);

router.post('/add-address', addAddress);

router.get('/add-address',ensureAuthenticated, async (req,res) =>{
   const {cartData,cartCount } = await getCartData(req);
    const catData = await getAllCategory();
    const typeData = await disAllType()
    res.render('add-address',{cartData,cartCount,catData,typeData})
});

router.get('/edit-address/:id',ensureAuthenticated, async (req,res) =>{
    const {cartData,cartCount } = await getCartData(req);
     const catData = await getAllCategory();
     const typeData = await disAllType();
     const {id} = req.params;
     const [addressData] = await connect.execute("Select * from customer_address where id = ? ",[id])
     res.render('edit-address',{cartData,cartCount,catData,typeData,addressData:addressData[0]})
 });

router.post('/edit-address', updateAddress)
  
router.post('/buy-now',buyNow)
router.post('/update-cart-quantity' ,updateCartQuantity);
router.post('/update-cart-size' ,updateCartSize);
router.delete('/remove-item/:id/:size' ,removeCart);


router.post("/api/delete-product", async (req, res) => {
    const user = req.session.user;
    const cartId = req.body.cart_id;
    console.log("Cart ID:", cartId);

    try {
        if (!user) {
            // Handle session-based cart deletion
            const cartItems = req.session.cart || [];
            console.log("Session Cart Items:", req.session.cart);
            const itemIndex = cartItems.findIndex(item => item.cart_id == cartId);
    
            if (itemIndex !== -1) {
                cartItems.splice(itemIndex, 1); // Remove the item
            }

            req.session.cart = cartItems;
            req.session.cartCount = cartItems.length;

            return res.status(200).json({
                success: true,
                message: "Item removed from cart"
            });
        } else {
            // Handle database-based cart deletion
            const userId = req.session.user.id;
            const deleteProductQuery = `
                DELETE FROM alfa_cart 
                WHERE user_id = ? AND id = ?
            `;

            await connect.query(deleteProductQuery, [userId, cartId]);

            return res.status(200).json({
                success: true,
                message: "Item removed from cart"
            });
        }
    } catch (error) {
        console.error("Error deleting product:", error);
        return res.status(500).json({
            success: false,
            message: "An error occurred while deleting the product."
        });
    }
});

// Delete Address
router.post("/api/delete-address", async (req, res) => {
 
    const address_id = req.body.address_id;
    try {
        
            // Handle database-based cart deletion
            const userId = req.session.user.id;
            const deleteProductQuery = `
                DELETE FROM customer_address 
                WHERE user_id = ? AND id = ?
            `;

            await connect.query(deleteProductQuery, [userId, address_id]);

            return res.status(200).json({
                success: true,
                message: "Address Deleted"
            });
        
    } catch (error) {
        console.error("Error deleting Address:", error);
        return res.status(500).json({
            success: false,
            message: "An error occurred while deleting the Address."
        });
    }
});

export default router