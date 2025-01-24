import express from "express";
const router = express.Router();
import connect from "../db/connect.js";
import nodemailer from "nodemailer";
import ejs from "ejs";
import path from "path";
import { fileURLToPath } from 'url';
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Account Email
const subscriptionEmail = async (email) => {
    const substransporter = nodemailer.createTransport({
        host: "smtp.gmail.com",
        port: 587,
        auth: {
            user: "jaydenmitchell0282@gmail.com",
            pass: "rtcslwgbcgxkoibh",
        }
    });

    // Define the email template content
    const SubsTemplate = await ejs.renderFile(path.join(__dirname, '..', 'views', 'email-template', 'subscription-template.ejs'), {
        email
    });

    await substransporter.sendMail({
        from: process.env.EMAIL_USER,
        to: email,
        subject: "Subscription",
        html: SubsTemplate
    });
};


// Account Admin
const subscriptionAdminEmail = async (email) => {
    const subsAdmintransporter = nodemailer.createTransport({
        host: "smtp.gmail.com",
        port: 587,
        auth: {
            user: "jaydenmitchell0282@gmail.com",
            pass: "rtcslwgbcgxkoibh",
        }
    });

    // Define the email template content
    const SubsAdminTemplate = await ejs.renderFile(path.join(__dirname, '..', 'views', 'email-template', 'new-subs-template.ejs'), {
        email
    });

    await subsAdmintransporter.sendMail({
        from: email,
        to: "fastranking03@gmail.com" ,
        subject: "Subscription",
        html: SubsAdminTemplate
    });
};

router.post('/newsletter-submittion', async (req, res) => {
    try {
        const { email } = req.body;

        const insertQuery = "INSERT INTO newsletter (email, created_at) VALUES (?, NOW())";
        await connect.query(insertQuery, [email]);

        // Send subscription email
        await subscriptionEmail(email);
        await subscriptionAdminEmail(email);

        return res.json({ success: true, message: 'Subscribed successfully!'});
    } catch (e) {
        console.error("Error during newsletter submission:", e);
        return res.json({ success: false, message: 'Something went wrong. Please try again later.' });
    }
});



export default router