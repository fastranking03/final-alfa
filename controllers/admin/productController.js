import connect from "../../db/connect.js";
import { getAllCategory } from "../../services/admin/catService.js"
import { disAllType } from "../../services/admin/typeService.js";
import cloudinary from "cloudinary";
import fs from 'fs';

export const disProduct = async (req, res) => {
    try {
        const catData = await getAllCategory();
        const [proData] = await connect.execute(`
            SELECT 
        p.*,
        c.cat_name,
        GROUP_CONCAT(s.size SEPARATOR ', ') AS p_sizes
      FROM 
        products p
      LEFT JOIN 
        category c ON p.cat_id = c.id
      LEFT JOIN 
        p_size s ON p.id = s.product_id
      GROUP BY 
        p.id`)
        res.render('admin/product-list', { catData, proData })
    } catch (e) {
        console.log(e);
    }
}

// Add Product
export const addProduct = async (req, res) => {
    try {
        const { wear_type_id, cat_id, p_name, p_price, discount, p_main_price, p_url, p_title, p_desc, p_key_features, tags, brand, sku, barcode, colour, new_arrival, best_seller, similar_product, size, quantity } = req.body;
        
        const mainImage = req.files['p_image'][0]; // Single file
        const additionalImages = req.files['p_images']; // Array of files

        const mainImageResult = await cloudinary.v2.uploader.upload(mainImage.path, {
            folder: 'test-product-images',
        });
        const main_image_path = mainImageResult.secure_url;

        // Insert engine data into `engines` table
        const [engineResult] = await connect.execute(
            "INSERT INTO products (wear_type_id, cat_id, p_name, p_price, discount, p_main_price, p_url, p_title, p_desc, p_key_features, tags, brand, sku, barcode, colour, new_arrival, best_seller, similar_product, p_image,position, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, 1, NOW())",
            [wear_type_id, cat_id, p_name, p_price, discount, p_main_price, p_url, p_title, p_desc, p_key_features, tags, brand, sku, barcode, colour, new_arrival, best_seller, similar_product ,main_image_path]
        );

        const product_id = engineResult.insertId;

        const imageInsertData = [];

        for (const file of additionalImages) {
            const result = await cloudinary.v2.uploader.upload(file.path, {
                folder: 'test-product-images',
            });
            imageInsertData.push([product_id, result.secure_url]);
            fs.unlink(file.path, (err) => {
                if (err) console.error(err);
            });
        }

        if (imageInsertData.length > 0) {
            await connect.query(
                "INSERT INTO pro_images (product_id, p_images) VALUES ?",
                [imageInsertData]
            );
        }

        // Insert sizes and quantities
        if (Array.isArray(size) && Array.isArray(quantity)) {
            const sizeData = size.map((sizeValue, index) => [
                product_id,
                sizeValue,
                quantity[index],
            ]);

            await connect.query(
                "INSERT INTO p_size (product_id, size, quantity) VALUES ?",
                [sizeData]
            );
        } else if (size && quantity) {
            await connect.execute(
                "INSERT INTO p_size (product_id, size, quantity) VALUES (?, ?, ?)",
                [product_id, size, quantity]
            );
        }

        res.redirect('/admin/product-list');
    } catch (e) {
        console.error(e);
        res.status(500).send("An error occurred.");
    }
}

// Edit Product
export const editProduct = async (req, res) => {
    try {
        const { id } = req.params;
        const [editProduct] = await connect.execute("SELECT * FROM products WHERE id = ?", [id])
        const catData = await getAllCategory();
        const typeData = await disAllType();
        const [proSize] = await connect.execute("select * from p_size where product_id = ?", [id]);
        const [proImage] = await connect.execute("select * from pro_images where product_id = ?", [id]);
        
        res.render('admin/edit-product', { catData, proSize, proImage, editProduct: editProduct[0] ,typeData })
    } catch (e) {
        console.log(e)
    }
}

// Delete Product Image
export const deleteImage = async (req, res) => {
    try {
        const { id } = req.params;
        const [imageData] = await connect.execute("SELECT p_images FROM pro_images WHERE id = ?", [id]);
        if (imageData.length === 0) {
            return res.status(404).send("Image not found.");
        }
        const imageUrl = imageData[0].p_images;

        const publicId = imageUrl.split('/').slice(-2).join('/').split('.')[0];

        // Delete image from Cloudinary
        const result = await cloudinary.uploader.destroy(publicId);
        if (result.result !== "ok") {
            console.error(`Failed to delete image from Cloudinary: ${result}`);
            return res.status(500).send("Failed to delete image from Cloudinary.");
        }

        await connect.execute("DELETE FROM pro_images WHERE id = ?", [id]);
        res.status(200).send("Image deleted successfully.");
    } catch (error) {
        console.error(error);
        res.status(500).send("Error deleting image.");
    }
}

// Delete Sizes
export const deleteSize = async (req, res) => {
    try {
        const { id } = req.params;

        // Delete the size entry from the database
        const [result] = await connect.execute("DELETE FROM p_size WHERE id = ?", [id]);

        if (result.affectedRows === 0) {
            return res.status(404).send("Size not found.");
        }

        res.status(200).send("Size deleted successfully.");
    } catch (error) {
        console.error(error);
        res.status(500).send("Error deleting size.");
    }
};

//  Update Product 
export const updateProduct = async (req, res) => {
    try {
        const {
            id, wear_type_id, cat_id, p_name, p_price, discount, p_main_price, p_url, p_title, p_desc,
            p_key_features, tags, brand, sku, barcode, colour, new_arrival, best_seller, similar_product,
            size, quantity
        } = req.body;

        const mainImage = req.files['p_image'] ? req.files['p_image'][0] : null; // Single file
        const additionalImages = req.files['p_images'] || []; // Array of files

        // Check if the product exists
        const [existingProduct] = await connect.execute("SELECT * FROM products WHERE id = ?", [id]);

        if (existingProduct.length === 0) {
            return res.status(404).send("Product not found.");
        }

        let main_image_path = existingProduct[0].p_image;
        if (mainImage) {
            // Delete the old image from Cloudinary
            const oldPublicId = main_image_path.split('/').pop().split('.')[0];
            if (main_image_path) {
                await cloudinary.v2.uploader.destroy(`product-images/${oldPublicId}`);
            }
            // Upload image to Cloudinary
            const mainImageResult = await cloudinary.v2.uploader.upload(mainImage.path, {
                folder: 'product-images',
            });
            main_image_path = mainImageResult.secure_url;

            // Delete the uploaded file from local server
            fs.unlink(mainImage.path, (err) => {
                if (err) console.error(err);
            });
        }

        await connect.execute(
            "UPDATE products SET wear_type_id = ?, cat_id = ?, p_name = ?, p_price = ?, discount = ?, p_main_price = ?, p_url = ?, p_title = ?, p_desc = ?, p_key_features = ?, tags = ?, brand = ?, sku = ?, barcode = ?, colour = ?, new_arrival = ?, best_seller = ?, similar_product = ?,  p_image = ? WHERE id = ?",
            [
                wear_type_id, cat_id, p_name, p_price, discount, p_main_price, p_url, p_title, p_desc,
                p_key_features, tags, brand, sku, barcode, colour,  new_arrival, best_seller,similar_product,
                main_image_path, id
            ]
        );

        if (additionalImages.length > 0) {
            const imageInsertData = [];
            for (const file of additionalImages) {
                const result = await cloudinary.v2.uploader.upload(file.path, {
                    folder: 'product-images',
                });
                imageInsertData.push([id, result.secure_url]);

                fs.unlink(file.path, (err) => {
                    if (err) console.error(err);
                });
            }

            // Insert new images into the database
            if (imageInsertData.length > 0) {
                await connect.query(
                    "INSERT INTO pro_images (product_id, p_images) VALUES ?",
                    [imageInsertData]
                );
            }
        }
 
        if (Array.isArray(size) && Array.isArray(quantity)) {
            for (let i = 0; i < size.length; i++) {
                const sizeValue = size[i]?.trim();
                const quantityValue = quantity[i]?.trim();
        
                // Skip empty inputs
                if (!sizeValue || !quantityValue) continue;
        
                // Check if size already exists
                const [existingSize] = await connect.execute(
                    "SELECT * FROM p_size WHERE product_id = ? AND size = ?",
                    [id, sizeValue]
                );
        
                if (existingSize.length > 0) {
                    // Update existing size and quantity
                    await connect.execute(
                        "UPDATE p_size SET quantity = ? WHERE product_id = ? AND size = ?",
                        [quantityValue, id, sizeValue]
                    );
                } else {
                    // Insert new size and quantity if it does not exist
                    await connect.execute(
                        "INSERT INTO p_size (product_id, size, quantity) VALUES (?, ?, ?)",
                        [id, sizeValue, quantityValue]
                    );
                }
            }
        } else if (size && quantity) {
            const sizeValue = size.trim();
            const quantityValue = quantity.trim();
        
            if (sizeValue && quantityValue) {
                const [existingSize] = await connect.execute(
                    "SELECT * FROM p_size WHERE product_id = ? AND size = ?",
                    [id, sizeValue]
                );
        
                if (existingSize.length > 0) {
                    // Update existing size and quantity
                    await connect.execute(
                        "UPDATE p_size SET quantity = ? WHERE product_id = ? AND size = ?",
                        [quantityValue, id, sizeValue]
                    );
                } else {
                    // Insert new size and quantity if it does not exist
                    await connect.execute(
                        "INSERT INTO p_size (product_id, size, quantity) VALUES (?, ?, ?)",
                        [id, sizeValue, quantityValue]
                    );
                }
            }
        }
    
        res.redirect('/admin/product-list');
    } catch (e) {
        console.error(e);
        res.status(500).send("An error occurred.");
    }
};
