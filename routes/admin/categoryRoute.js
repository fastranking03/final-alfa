import express from "express";
import { disCategory ,addCategory} from "../../controllers/admin/categoryController.js";
import { disAllType } from "../../services/admin/typeService.js";
const router = express.Router();

router.get('/category-list', disCategory);

router.get('/add-category', async(req,res) =>{
    const typeData =  await disAllType();
    res.render('admin/add-category',{typeData})
})
router.post('/add-category',addCategory)

export default router