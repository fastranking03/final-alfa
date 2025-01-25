import express from "express";
import { disByCategory, viewProduct ,viewProductDetail ,dispTypeWiseProduct} from "../controllers/prodController.js";
import connect from "../db/connect.js";
 
const router = express.Router();

router.get('/collection/:cat_slug',disByCategory)
router.get('/product', viewProduct);
router.get('/product-detail/:p_seo/:product_id', viewProductDetail);
router.get('/products/:type_url' ,dispTypeWiseProduct);

router.get('/search-products', async (req, res) => {
    const query = req.query.query;

    if (!query) {
        return res.status(400).json({ error: 'Query parameter is required' });
    }

    try {
        const searchQuery = `
      SELECT 
        p.id, 
        p.p_name AS name, 
        p.p_url AS p_url, 
        p.p_desc AS description,
        p.p_image AS image,
        c.cat_name AS category
      FROM products p
      JOIN category c ON p.cat_id = c.id
      WHERE 
        p.p_name LIKE ? 
        OR p.p_desc LIKE ?
    `;
        const searchValue = `%${query}%`;
        const [rows] = await connect.execute(searchQuery, [searchValue, searchValue]);

        res.json(rows);
    } catch (error) {
        console.error('Error fetching search results:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});
 

export default router 