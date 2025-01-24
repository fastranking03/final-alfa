import express from "express";
import { displayAccesssories ,disByCategory ,viewProductDetail} from "../controllers/accessoriesController.js";

 
const router = express.Router();

router.get('/accessoriess/:cat_slug',disByCategory)
router.get('/accessoriess', displayAccesssories);
router.get('/product-detail/:p_seo/:product_id', viewProductDetail);
 

export default router