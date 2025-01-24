import connect from "../../db/connect.js";

export const getAllCategory = async (req,res) =>{
    try{
        const [catData] = await connect.execute("SELECT * FROM category");
        return catData 
    }catch(e){
        console.log(e)
    }
}
 

export const getAllTypeCategory = async (req,res) =>{
    try{
        const [catData] = await connect.execute("SELECT * FROM category");
        return catData 
    }catch(e){
        console.log(e)
    }
}