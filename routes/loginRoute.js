import express from "express";
import { signUp ,loginUser, requesOtp, logOut,verifyOtp ,updatePassword ,verifyOtpAndRegister, disProfile, updateProfile } from "../controllers/loginController.js";
import { getAllCategory } from "../services/admin/catService.js";
import { ensureAuthenticated } from "../middleware/authMiddleware.js";
import { disAllType } from "../services/admin/typeService.js";
const router = express.Router();

router.get('/signup', async(req,res) =>{
    const catData = await getAllCategory();
    const typeData = await disAllType();
    res.render('signup',{catData,typeData})
})
router.post('/signup', signUp)
router.get('/ac-verification',(req,res) =>{
    res.render('ac-verification')
})
router.post('/ac-verification',verifyOtpAndRegister)

router.get('/login', async(req,res) =>{
    // const previousUrl = req.headers.referer || '/'; 
    // req.session.redirectTo = previousUrl; 
    const typeData = await disAllType();
    const catData = await getAllCategory();
    res.render('login',{catData,typeData})
})
router.get('/forget-password',(req,res)=>{
    res.render('forget-password')
})
 
router.post('/request-otp', requesOtp)

router.get('/verify-otp',(req,res)=>{
    res.render('verify-otp')
})

router.post('/verify-otp',verifyOtp)

router.get('/update-password',(req,res) =>{
    res.render('update-password')
})
router.post('/update-password',updatePassword)

router.post('/login', loginUser)
router.get('/logout',logOut)

router.get('/my-profile',ensureAuthenticated ,disProfile);
router.post('/save-profile', updateProfile)
export default router