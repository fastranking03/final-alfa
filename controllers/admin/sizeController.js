import connect from "../../db/connect.js";
import { disAllSizes } from "../../services/admin/sizeServices.js";
 

export const displaySize = async (req,res) =>{
    try{
      const sizeData = await disAllSizes();
      res.render('admin/size-list',{sizeData:sizeData})
    }catch(e){
        console.log(e)
    }
}

export const addSize = async (req, res) => {
  try {
    const { size_name, status } = req.body;
    
    console.log('Received data:', size_name, status);  // Log the input values
    
    // Check if any of the values are undefined or null
    if (size_name === undefined || status === undefined) {
      return res.status(400).send('Missing required fields');
    }

    await connect.execute(
      "INSERT INTO size (size_name, status, created_at) VALUES (?, ?, ?, NOW())",
      [size_name, status]
    );
    
    res.redirect('/admin/size-list');
  } catch (e) {
    console.log(e);
    res.status(500).send('Error inserting data');
  }
};

export const editSize = async (req,res) =>{
  try{
     const {id} = req.params;
     const [editSize] = await connect.execute("Select * from size Where id = ?",[id])
     res.render('admin/edit-size' ,{editSize:editSize[0]})
  }catch(e){
    console.log(e)
  }
}

export const updateSize = async (req, res) => {
  try {
    const { id, size_name } = req.body;
    console.log('Received data:', { id, size_name })
    await connect.execute('UPDATE size SET size_name = ? WHERE id = ?', [size_name, id]);
    res.redirect('admin/size-list');
  } catch (e) {
    console.error('Error updating size:', e);
    res.status(500).send('An error occurred while updating the size.');
  }
};
 