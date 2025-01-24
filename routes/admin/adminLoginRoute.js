import express from "express"
import bcrypt from "bcrypt"
const router = express.Router();
import JWT from "jsonwebtoken";
import connect from "../../db/connect.js";
router.get('/login', async (req,res) =>{
    res.render('admin/login')
})

router.post('/admin-login', async(req,res) =>{
    try{
        const {email,password } = req.body;
        const [userData] = await connect.execute("SELECT * FROM alfa_users WHERE email = ?",[email]);
        if(userData.length === 0){
            return res.render('login',{error:"User not found"})
    
        }
            const user = userData[0]
              const match = await bcrypt.compare(password,user.password);
              if(!match){
                return res.render("login",{error:"Incorrect password"})
              }
              const token = await JWT.sign({email:user.email}, process.env.TOKEN_KEY,{ expiresIn: "1h" })
              
                req.session.user={
                    id:user.id,
                    name:user.name,
                    email:user.email,
                    type:user.type,
                    token:token
                }
                const redirectTo = req.session.redirectTo || '/admin/index';
                delete req.session.redirectTo; 
                res.redirect(redirectTo);
                
              
    }catch(e){
        console.log(e)
    }
})

router.get('/admin-logout', async (req, res) => {
    try {
        req.session.destroy((err) => {
            if (err) {
                console.error('Error destroying session:', err);
                return res.status(500).send('Error logging out.');
            }
            console.log('Session destroyed successfully.');
            res.redirect('/admin/login');
        });
    } catch (e) {
        console.error('Error during logout:', e);
        res.status(500).send('Internal Server Error');
    }
});



export default router