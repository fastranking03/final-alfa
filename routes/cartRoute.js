import express from "express";
import { addToCart ,disCart ,addAddress ,disAddress ,updateCartQuantity, removeCart ,updateCartSize} from "../controllers/cartController.js";
import { ensureAuthenticated } from "../middleware/authMiddleware.js";
import { buyNow } from "../controllers/buynowController.js";
import { getCartData } from "../services/cartService.js";
import { getAllCategory } from "../services/admin/catService.js";
import { disAllType } from "../services/admin/typeService.js";

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
})
  
router.post('/buy-now',buyNow)
router.post('/update-cart-quantity' ,updateCartQuantity);
router.post('/update-cart-size' ,updateCartSize);
router.delete('/remove-item/:id/:size' ,removeCart);

export default router