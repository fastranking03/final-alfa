import connect from "../../db/connect.js"

export const disAllSizes = async (req,res) =>{
    try{
       const [sizeData] = await connect.execute("SELECT * FROM size")
       return sizeData
    }catch(e){
        console.log(e)
    }
}