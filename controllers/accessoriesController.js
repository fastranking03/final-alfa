import connect from "../db/connect.js"
import { getAllCategory } from "../services/admin/catService.js";
import { getAllProduct } from "../services/admin/prouctService.js"
import { getCartData } from "../services/cartService.js";

export const disByCategory = async (req, res) => {
    try {
        const { cat_slug } = req.params;
        const [allCategories] = await connect.execute(`
            SELECT c.*, 
                   COUNT(p.id) AS product_count
            FROM category c
            LEFT JOIN products p ON c.id = p.cat_id
            WHERE c.is_accessories === 0
            GROUP BY c.id
            HAVING product_count > 0
        `);

        // Fetch the selected category details
        const [selectedCategory] = await connect.execute(
            "SELECT * FROM category WHERE cat_slug = ?",
            [cat_slug]
        );

        if (selectedCategory.length === 0) {
            return res.status(404).send("Category not found");
        }

        const cat_id = selectedCategory[0].id;

        // Fetch products for the selected category
        const [prodData] = await connect.execute(
            "SELECT * FROM products WHERE cat_id = ?",
            [cat_id]
        );

        const { cartData, cartCount } = await getCartData(req);

        res.render("collection", {
            prodData,
            cartData,
            cartCount,
            catData: allCategories, // Filtered categories with non-zero product counts
            selectedCategory: selectedCategory[0],
        });
    } catch (e) {
        console.error("Error fetching product details:", e);
        return res.status(500).send("Internal Server Error");
    }
};

export const displayAccesssories = async (req,res) =>{
    try{
      const prodData = await getAllProduct();
      const catData = await getAllCategory();
      const {cartData,cartCount } = await getCartData(req)
      res.render('accessories',{prodData,catData,cartData,cartCount})
    }catch(e){
        console.log(e)
    }
}

export const viewProductDetail = async (req,res) =>{
    try{

    }catch(e){
        console.log(e)
    }
}