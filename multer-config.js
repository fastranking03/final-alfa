import cloudinary from 'cloudinary';
import multer from 'multer';
import path from 'path';

// Configure Cloudinary
cloudinary.v2.config({
    cloud_name: "dj7wogsju",
    api_key: "157822411894388",
    api_secret: "75JsAOlaDyXR3etyxJLHhStG4f8",
});

// Multer configuration
const storage = multer.diskStorage({
    filename: (req, file, cb) => {
        const uniqueName = `${Date.now()}-${file.originalname}`;
        cb(null, uniqueName);
    },
});

export const upload = multer({
    storage,
    fileFilter: (req, file, cb) => {
        const fileTypes = /jpeg|jpg|webp|png/;
        const extname = fileTypes.test(path.extname(file.originalname).toLowerCase());
        const mimeType = fileTypes.test(file.mimetype);

        if (extname && mimeType) {
            return cb(null, true);
        }
        cb(new Error('Only images (jpeg, webp, jpg, png) are allowed!'));
    },
})
