import connect from "../../db/connect.js";
// export const getAllProduct = async (req,res) =>{
//     try{
//       const [productData] = await connect.execute("SELECT * FROM products");
//       return productData;
//     }catch(e){
//         console.log(e)
//     }
// }


export const getAllProduct = async () => {
  const query = `
      SELECT 
          p.*, 
          GROUP_CONCAT(s.size) AS sizes
      FROM products p
      LEFT JOIN p_size s ON p.id = s.product_id
      GROUP BY p.id;
  `;
  const [products] = await connect.execute(query);
  return products.map(product => ({
      ...product,
      sizes: product.sizes ? product.sizes.split(',') : [], // Convert sizes to an array
  }));
};
