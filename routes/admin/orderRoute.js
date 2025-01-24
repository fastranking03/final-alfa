import express from "express";
import { displayOrder ,displayOrderDetail, updateStatus } from "../../controllers/admin/userOdersController.js";
 
 
const router = express.Router()

// Static Routes
router.get('/orders', displayOrder);
router.get('/order-details/:order_id', displayOrderDetail );
router.post('/update-order-status/:order_id', updateStatus);

export default router