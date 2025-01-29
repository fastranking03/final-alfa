import connect from "../db/connect.js"
export const disAllColour = async (req,res) =>{
    try{
    const [colourData] = await connect.execute("Select * from  p_colour")
    return colourData
    }catch(e){
        console.log(e)
    }
}