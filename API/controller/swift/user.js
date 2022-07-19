
const PollModel = require('../../model/poll.js')
const AnswerModel = require('../../model/answer.js')
const UserModel = require('../../model/user.js')
const GroupModel = require('../../model/group.js')
const Mongoose = require('mongoose');
const VoteModel = require('../../model/votes.js')


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

  if (!body) {
    res.status(400).send("All input is required");
  }else{
    const user = await UserModel.findOne({token})
    if(user){
      const poll = new PollModel(body)
      const idPoll = poll._id
      if(poll){
        const oldPoll = await PollModel.findOne({name: poll.name})
        if(oldPoll){
          res.status(400).send("Poll already exist")
        }else {
          if(poll.save()){
            for(let i in reponse){
              let arrayAnswer = {"content": reponse[i], "idPolls_fk": idPoll}
              console.log(arrayAnswer)
              let answer = new AnswerModel(arrayAnswer)
              answer.save()
            }
          }else{
            res.status(400).send("error")
          }
        }
      }else{
        res.status(400).send("Invalid Credentials")
      }
    }
  }
}

const createGroup = async(req,token, res) => {
  if(!req.body){
    res.status(400).send("All input is required");
  }else{
    const ModelGroup = new GroupModel(req.body)
    const user = await UserModel.findOne({token})
    if(user){
      ModelGroup.owner = user._id
      const existGroup = await GroupModel.findOne({name: ModelGroup.name})
      if(existGroup){
        res.status(400).send("Group already exist")
      }else {
        ModelGroup.save()
        user.fk_group = ModelGroup._id
        user.save()
        res.status(200).send("Group create")
      }
    }else{
      res.status(400).send("Invalid Credentials")
    }
  }
  
}

const addGroup = async(req,token,res) => {
  if(!req.body){
    res.status(400).send("All input is required");
  }else{
    const email = req.body.email
    const user = await UserModel.findOne({token})
    if(user){
      const existGroup = await GroupModel.findOne({_id: user.fk_group})
      if(existGroup){
        const adduser = await UserModel.findOne({email: email})
        if(adduser){
          if(adduser.fk_group == existGroup._id){
            res.status(400).send("already in the group")
          }else {
            adduser.fk_group = existGroup._id
            adduser.save()
            res.status(200).send("add to group done")
          }
        }else{
          res.status(400).send("user dont exist");
        }
      }else{
        res.status(400).send("group dont exist");
      }
    }else{
      res.status(400).send("Invalid Credentials");
    }
  }
}

const getResultPoll = async(req,token,res) => {
  if(!req.body){
    res.status(400).send("All input is required");
  }else {
    const myPoll = await PollModel.findOne({name: req.body.name})
    const vote = await VoteModel.find({fk_poll: myPoll._id})
    let count = 0
    let tmp = 0
    for(i in vote){
      
    }
  }
}

const votes = async(body,token,res) => {
  if (!body) {
    res.status(400).send("All input is required");
  }else{
    const user = await UserModel.findOne({token: token})
    const votes = await VoteModel.findOne({fk_user: user._id})
    const poll = await PollModel.findOne({_id: votes.fk_poll})
    if(votes && poll){
      res.status(202).send("You already vote for this poll")
    }else{
      const newVote = new VoteModel(body)
      newVote.fk_user = user._id
      newVote.save()
      res.status(200).send("Success")
    }
  }
}



module.exports = {updateprofile, updateprofile, addPoll, createGroup, addGroup,getResultPoll,votes}