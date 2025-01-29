import express from "express"
import { disProduct,addProduct, editProduct, deleteImage, deleteSize,updateProduct,deteteProduct} from "../../controllers/admin/productController.js";
import { getAllCategory } from "../../services/admin/catService.js";
import { upload } from "../../multer-config.js";
import { disAllType } from "../../services/admin/typeService.js";
import { disAllSizes } from "../../services/admin/sizeServices.js";

const router = express.Router();

router.get('/product-list',disProduct);
router.get('/add-product', async (req,res) =>{
    const catData = await getAllCategory();
    const typeData = await disAllType();
    const sizeData = await disAllSizes();
    res.render('admin/add-product',{catData,typeData,sizeData});
})
router.post('/add-product',upload.fields([
    { name: 'p_image', maxCount: 1 },
    { name: 'p_images', maxCount: 10 }
]), addProduct);

router.get('/edit-product/:id', editProduct);
router.delete('/delete-image/:id',deleteImage);
router.delete('/delete-size/:id', deleteSize)
router.post('/api/deleteproduct',deteteProduct)

router.post('/edit-product',upload.fields([
    { name: 'p_image', maxCount: 1 },
    { name: 'p_images', maxCount: 10 }
]),updateProduct)

export default router