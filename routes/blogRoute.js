import express from "express";
import { disBlog ,disBlogById } from "../controllers/BlogController.js";
 

const router = express.Router();

router.get('/blogs', disBlog);
router.get('/blogs-details', disBlogById);
 

export default router