
const PollModel = require('../../model/poll.js')
const AnswerModel = require('../../model/answer.js')
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

const addPoll = async(body,token,res) => {
  const { name, description, type, timer, reponse} = body

  if (!name || !description || !type || !timer || reponse) {
    res.status(400).send("All input is required");
  }

  const user = await UserModel.findOne({token})
  if(user){
    console.log("in condition user exist")
    const poll = new PollModel(body)
    const idPoll = poll._id
    if(poll){
      console.log("in condition poll exist")
      if(poll.save()){
        console.log("poll created")
        for(let i in reponse){
          let arrayAnswer = {"content": reponse[i], "idPolls_fk": idPoll}
          console.log(arrayAnswer)
          let answer = new AnswerModel(arrayAnswer)
          answer.save()
        }
      }else {
        res.status(400).send("Invalid Credentials")
      }
    }else{
      res.status(400).send("Invalid Credentials")
    }
  }
}



module.exports = {updateprofile, updateprofile, addPoll}