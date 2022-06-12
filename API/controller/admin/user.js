const UserModel = require("../../model/user")

const deleteUser = async(req,res) => {
    const user = await UserModel.findOne({ _id });
}