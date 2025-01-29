import express from "express";
import path from "path";
import cors from "cors";
import dotenv from "dotenv";
import session from "express-session";
import commonRoute from "./routes/commonRoute.js"
import loginRoute from "./routes/loginRoute.js"
import cartRoute from "./routes/cartRoute.js";
import wishlistRoute from "./routes/wishlistRoute.js";
import paypalRoute from "./routes/paypalRoute.js";
import adminLoginRoute from "./routes/admin/adminLoginRoute.js";
import categoryRoute from "./routes/admin/categoryRoute.js";
import productRoute from "./routes/admin/productRoute.js";
import typeRoute from "./routes/admin/typeRoute.js";
import sizeRoute from "./routes/admin/sizeRoute.js";
import prodRoute from "./routes/prodRoute.js";
import frontOrderRoute from "./routes/frontOrderRoute.js";
import orderRoute from "./routes/admin/orderRoute.js";
import accessoriesRoute from "./routes/accessoriesRoute.js";
import newsRoute from "./routes/newsRoute.js";
import flash from 'connect-flash';
import { authenticateAdmin } from "./middleware/authMiddleware.js";
import blogRoute from "./routes/blogRoute.js"

const app = express();
app.use(cors())
dotenv.config()
app.locals.baseURL = "http://localhost:9090/"

app.use(session({
    secret: process.env.SESSION_KEY,
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false }
}));

// Middleware to make user session data available in all views
app.use((req, res, next) => {
    res.locals.user = req.session.user || null;
    next();
  });
  
// Set View Engine
app.set("view engine", "ejs")
app.set("views", path.resolve("./views"))
app.use(express.static("public"))
app.use(express.json()); //
app.use(express.urlencoded({ extended: true }))

// Json Api Routes
app.use('/m-t',(req,res) =>{
    res.render('m-t')
})
app.use(flash());

app.use((req, res, next) => {
  res.locals.messages = req.flash();
  next();
});

// Routes
app.use('/', prodRoute);
app.use('/', accessoriesRoute);
app.use('/', commonRoute);
app.use('/',loginRoute) ;
app.use('/', cartRoute);
app.use('/', wishlistRoute);
app.use('/', paypalRoute);
app.use("/" , frontOrderRoute);
app.use("/",newsRoute);
app.use('/',blogRoute)

// Admin Routes
app.use('/admin/', adminLoginRoute);
app.use('/admin/',categoryRoute);
app.use('/admin/', productRoute);
app.use('/admin/', typeRoute);
app.use('/admin/', sizeRoute);
app.use('/admin/', orderRoute);

app.use('/admin', authenticateAdmin,(req,res) =>{
    res.render('admin/index')
})
 
const PORT = 9090

app.listen(PORT,() =>{
    console.log(`Server is running on port ${PORT}`)
}) 