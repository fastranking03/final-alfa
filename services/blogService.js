import connect from "../db/connect.js"

export const getAllBlogs = async () =>{
    try{
      const [blogData] = await connect.execute("SELECT * FROM blogs")
      return blogData
    }catch(e){
        console.log(e);
    }
}