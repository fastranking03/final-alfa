import { getAllCategory } from "../services/admin/catService.js";
import { disAllType } from "../services/admin/typeService.js";
import { getAllBlogs } from "../services/blogService.js"
import { getCartData } from "../services/cartService.js";
import { getWishlistData } from "../services/wishlistService.js";
 

export const disBlog = async(req,res) =>{
    try{
        const blogData = await getAllBlogs();
        const {cartData,cartCount } = await getCartData(req);
        const catData = await getAllCategory();
        const typeData = await disAllType();
        const {whislistData, wishlistCount} = await getWishlistData(req)
        res.render('blogs',{blogData,cartCount,cartData,catData,typeData,whislistData,wishlistCount})
    }catch(e){
        console.log(e)
    }
}

export const disBlogById = async (req,res) =>{
    try{
      res.render('blog-details')
    }catch(e){
        console.log(e)
    }
}