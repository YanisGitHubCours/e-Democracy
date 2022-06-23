const bcrypt = require('bcrypt')
const UserModel = require('../../model/user.js')
const Mongoose = require('mongoose');


const updateprofile = async(body,res) => {

    const { name, description,fk_user } = body;

    if (!name || !description || !fk_user) {
      res.status(400).send("All input is required");
    }
    const id = Mongoose.Types.ObjectId(fk_user)
    // Find if user exist
    const user = await UserModel.findOne({ _id: id })
  
    if(user){
        const task = new TaskModel(body);
        const idTask = Mongoose.Types.ObjectId(body.id)
        const taskfind = await TaskModel.findOne({_id: idTask})
        if(taskfind){
          taskfind.name = task.name
          taskfind.description = task.description
          taskfind.fk_user = task.fk_user
          if(taskfind.save()){
            res.status(200).json("task update");
          }else {
            res.status(400).send("Invalid Credentials")
          }
        }else{
            res.status(400).send("Invalid Credentials")
        }
    }else {
      res.status(400).send("Invalid Credentials")
    }
}

module.exports = {updateprofile, updateprofile}