import express from "express";
import { addType, displayType } from "../../controllers/admin/typeControlller.js";

const router = express.Router();

 router.get('/type-list', displayType);
 router.get('/add-type', (req,res) =>[
    res.render('admin/add-type')
 ])

 router.post('/add-type', addType);

export default router