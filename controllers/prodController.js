import connect from "../db/connect.js"
import { getAllCategory, getAllTypeCategory } from "../services/admin/catService.js";
import { getAllProduct } from "../services/admin/prouctService.js"
import { disAllType } from "../services/admin/typeService.js";
import { getCartData } from "../services/cartService.js";
import { disAllColour } from "../services/ColourService.js";
import { getWishlistData } from "../services/wishlistService.js";

export const disByCategory = async (req, res) => {
    try {
        const { cat_slug } = req.params;

        // Fetch all categories with their associated wear types
        const [allCategories] = await connect.execute(`
            SELECT c.*, 
                   COUNT(p.id) AS product_count,
                   t.i_type AS i_type,
                   t.id AS wear_type_id
            FROM category c
            LEFT JOIN products p ON c.id = p.cat_id
            LEFT JOIN inventory_type t ON c.wear_type_id = t.id
            GROUP BY c.id
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

        // Fetch cart and type data
        const { cartData, cartCount } = await getCartData(req);
        const typeData = await disAllType();
        const {whislistData, wishlistCount} = await getWishlistData(req);
        const colourData = await disAllColour();

        // Render the template with all data
        res.render("collection", {
            prodData,
            cartData,
            cartCount,
            typeData,
            catData: allCategories,
            selectedCategory: selectedCategory[0],
            whislistData, wishlistCount,
            colourData
        });
    } catch (e) {
        console.error("Error fetching product details:", e);
        return res.status(500).send("Internal Server Error");
    }
};


export const viewProduct = async (req,res) =>{
    try{
       const prodData = await getAllProduct();
       const catData = await getAllCategory();
       const typeData = await disAllType();
       const {cartData,cartCount } = await getCartData(req);
       const {whislistData, wishlistCount} = await getWishlistData(req);
       const colourData = await disAllColour()
       res.render('product', {prodData,cartData,cartCount,typeData,catData,whislistData, wishlistCount,colourData});
    }catch(e){
        console.log(e)
    }
}

export const viewProductDetail = async (req, res) => {
    try {
        const { product_id, p_seo } = req.params;
        if (!product_id || !p_seo) {
            return res.status(400).send("Invalid product ID or URL.");
        }
        const [proDetailData] = await connect.execute(
            "SELECT * FROM products WHERE id = ? AND p_url = ?", 
            [product_id, p_seo]
        );
      console.log(proDetailData)
      // Fetch best seller products
        const [bestSellerData] = await connect.execute('SELECT * FROM products WHERE best_seller = "yes"');

        const [sizeData] = await connect.execute("Select * from p_size Where product_id = ?",[proDetailData[0].id]);
        const [proImages] = await connect.execute("Select * from pro_images Where product_id = ?",[proDetailData[0].id])
        if (!proDetailData.length) {
            return res.status(404).send("Product not found.");
        }
        // Cart & WishList Count
        const {cartData,cartCount } = await getCartData(req);
        const {whislistData, wishlistCount} = await getWishlistData(req)
        const catData = await getAllCategory();
        const typeData = await disAllType();
        res.render('product-detail', { 
            proDetailData: proDetailData[0],
            sizes:sizeData,
            proImages:proImages,
            cartData,cartCount,
            catData,
            typeData,
            bestSellerData,
            whislistData, 
            wishlistCount
        });
    } catch (e) {
        console.error("Error fetching product details:", e);
        return res.status(500).send("Internal Server Error");
    }
};

// New Arrival
export const newArrival = async (req,res) =>{
    const {cartData,cartCount } = await getCartData(req);
    const catData = await getAllCategory();
    const typeData = await disAllType();
    const {whislistData, wishlistCount} = await getWishlistData(req)
    const [newArrivalData] = await connect.execute('Select * from products Where new_arrival = "yes"');
    res.render('index',{newArrivalData,cartData,cartCount,catData,typeData ,whislistData, wishlistCount})
}
 
export const dispTypeWiseProduct = async (req, res) => {
    try {
      const { type_url } = req.params;
  
      // Fetch the type_id based on the provided type_url
      const [typeD] = await connect.execute(
        'SELECT id FROM inventory_type WHERE type_url = ?',
        [type_url]
      );
   
      const typeId = typeD[0].id;
      const [prodData] = await connect.execute(
        'SELECT * FROM products WHERE wear_type_id = ?',
        [typeId]
      );
     const catData = await getAllCategory();
     const typeData = await disAllType();
     const {cartData,cartCount } = await getCartData(req);
     const {whislistData, wishlistCount} = await getWishlistData(req);
     const colourData = await disAllColour();
      // Render the view with the fetched products
      res.render('product-type-list', { prodData ,catData,typeData,cartData,cartCount ,whislistData, wishlistCount,colourData});
    } catch (e) {
      console.error(e);
      res.status(500).send('An error occurred while fetching products.');
    }
  };
  