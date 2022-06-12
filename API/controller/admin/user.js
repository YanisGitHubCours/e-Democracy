const UserModel = require("../../model/user")

const deleteUser = async(req,res) => {
    const user = await UserModel.findOne({ _id: req });
    if(user){
        if(await UserModel.deleteOne({_id: user._id})){
            res.status(200).send("user delete success")
        }else {
            res.status(400).send("error in delete account process")
        }
    }else {
        res.status(400).send("no user find")
    }
}

module.exports = {deleteUser}