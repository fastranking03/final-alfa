import express from 'express';
import { displayOrderSuccess, displayUserOrders ,returnOrder } from '../controllers/orderController.js';
import { ensureAuthenticated } from '../middleware/authMiddleware.js';
 
 

const router = express.Router();

router.get('/user-orders', ensureAuthenticated, displayOrderSuccess);
router.get('/user-order-detail/:order_id', ensureAuthenticated, displayUserOrders);

router.post('/return-submit', returnOrder);

export default router;
