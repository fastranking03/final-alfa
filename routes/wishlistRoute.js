import express from "express";
import { addToWishList ,disWishList} from "../controllers/whislistController.js";
import { ensureAuthenticated ,authencateUser} from "../middleware/authMiddleware.js";
 

const router = express.Router();

router.get('/my-wishlist', ensureAuthenticated, disWishList);

router.post('/add-to-wishlist', authencateUser, addToWishList);


export default router