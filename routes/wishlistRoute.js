import express from "express";
import { addToWishList ,disWishList} from "../controllers/whislistController.js";
import { ensureAuthenticated ,authencateUser} from "../middleware/authMiddleware.js";
import connect from "../db/connect.js";
 

const router = express.Router();

router.get('/my-wishlist', ensureAuthenticated, disWishList);

router.post('/add-to-wishlist', authencateUser, addToWishList);

router.post("/api/delete-wishlist", async (req, res) => {
    const user = req.session.user;
    const cartId = req.body.cart_id;
     
    try {
         
            // Handle database-based cart deletion
            const userId = req.session.user.id;
            const deleteProductQuery = `
                DELETE FROM alfa_whislist 
                WHERE user_id = ? AND id = ?
            `;

            await connect.execute(deleteProductQuery, [userId, cartId]);

            return res.status(200).json({
                success: true,
                message: "Item removed from cart"
            });
        
    } catch (error) {
        console.error("Error deleting Item:", error);
        return res.status(500).json({
            success: false,
            message: "An error occurred while deleting the whislist item."
        });
    }
});


export default router