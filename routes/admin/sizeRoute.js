import express from "express";
import { addSize, displaySize,editSize,updateSize } from "../../controllers/admin/sizeController.js";

const router = express.Router();

 router.get('/size-list', displaySize);
 router.get('/add-size', (req,res) =>[
    res.render('admin/add-size')
 ])

 router.post('/add-size', addSize);

 router.get('/edit-size/:id', editSize)
 router.post('edit-size',updateSize)

export default router