const UserModel = require('../../model/user.js')
const TaskModel = require('../../model/task.js')
const Mongoose = require('mongoose');

const addtask = async(body,res) => {
  const { name, description,fk_user } = body;

  if (!name || !description || !fk_user) {
    res.status(400).send("All input is required");
  }
  const id = Mongoose.Types.ObjectId(fk_user)
  // Find if user exist
  const user = await UserModel.findOne({ _id: id })

  if(user){
      const task = new TaskModel(body);
      const taskfind = await TaskModel.findOne({name: task.name})
      if(taskfind){
        res.status(400).send("This task already exist")
      }else{
        if(task.save()){
          res.status(200).json("task save");
        }else {
          res.status(400).send("Invalid Credentials")
        }
      }
  }else {
    res.status(400).send("Invalid Credentials")
  }
}

const updatetask = async(body,res) => {
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

const deletetask = async(body,res) => {
  console.log(body)
  const task = await TaskModel.findOne({ _id: body.id });
    if(task){
        if(await task.deleteOne({_id: task._id})){
            res.status(200).send("task delete success")
        }else {
            res.status(400).send("error in delete task process")
        }
    }else {
        res.status(400).send("no task find")
    }
}

const getTask = async(res) => {
  const task = await TaskModel.find();
  if(task){
    res.status(200).send(task)
  }else{
    res.status(400).send('no task find')
  }
}


module.exports = {addtask, updatetask, deletetask, getTask}