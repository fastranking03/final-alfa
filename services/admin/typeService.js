import connect from "../../db/connect.js"

export const disAllType = async (req,res) =>{
    try{
       const [typeData] = await connect.execute("SELECT * FROM inventory_type")
       return typeData
    }catch(e){
        console.log(e)
    }
}