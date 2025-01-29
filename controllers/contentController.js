import connect from "../db/connect.js"

export const addtoContact = async (req, res) => {
    try {
        const { name, email, contact, subject, message } = req.body;
        await connect.execute(
            "INSERT INTO get_in_touch (name,email,contact,subject,message,created_at) VALUES (?, ?, ?, ?, ?, NOW())",
            [name, email, contact, subject, message]
        );

        req.flash("success", "Your message has been sent successfully!");
        res.redirect("/contact-us");
    } catch (e) {
        console.log(e);
        req.flash("error", "Something went wrong. Please try again.");
        res.redirect("/contact-us");
    }
};



export const editContent = async(req,res) =>{
    try{
     const {id} = req.params
     const [editContent] = await connect.execute("SELECT * FROM content WHERE id = ?",[id])
      res.render('admin/contents' ,{editContent:editContent[0]})
    }catch(e){
        console.log(e)
    }
}

export const updateContent = async (req,res) =>{
    try{
      const {id,about_title,about_desc,about_img,privacy_policy,term_condition,phone,email,address,facebook,instagram,linkedin,twitter} = req.body;
      const query = `
      UPDATE content SET
      about_title = ?,
      about_desc = ?,
      about_img= ?,
      privacy_policy = ?,
      term_condition = ?,
      phone = ?,
      email = ?,
      address = ?,
      facebook = ?,
      instagram = ?,
      linkedin = ?,
      twitter = ?
      WHERE id = ?
      `;
      await connect.execute(query,[about_title,about_desc,about_img,privacy_policy,term_condition,phone,email,address,facebook,instagram,linkedin,twitter,id]);
      res.redirect(`/admin/contents/${id}`)
    }catch(e){
        console.log(e)
    }
}