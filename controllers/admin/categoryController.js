import connect from "../../db/connect.js";
import { getAllCategory } from "../../services/admin/catService.js";

export const disCategory = async (req,res) =>{
    try{
        const catData = await getAllCategory()
       res.render('admin/category-list',{catData})
    }catch(e){
        console.log(e)
    }
}

export const addCategory = async (req,res) =>{
    const {wear_type_id,cat_name,cat_slug, is_accessories,status} = req.body;
    try {
        const [existingCategory] = await connect.execute(
            "SELECT COUNT(*) AS count FROM category WHERE cat_slug = ?",
            [cat_slug]
        );
    
        if (existingCategory[0].count > 0) {
            return res.status(400).send("Category slug already exists.");
        }
    
        await connect.execute(
            "INSERT INTO category (wear_type_id, cat_name, cat_slug, is_accessories, status, created_at) VALUES (?, ?, ?, ?, ?, NOW())",
            [wear_type_id, cat_name, cat_slug, is_accessories, status]
        );
        res.redirect('/admin/category-list');
    } catch (e) {
        console.error("Error while adding category:", e.message);
        res.status(500).send("An error occurred while adding the category.");
    }
    
}