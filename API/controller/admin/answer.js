const PollModel = require('../../model/poll.js');
const Mongoose = require('mongoose');
const AnswerModel = require('../../model/answer.js')

const getAnswerById = async(req, res) => {
    const id = req.body.id
    const poll = await PollModel.findOne({_id: id})
    
    if(poll){
      
      const answer = await AnswerModel.find({idPolls_fk: poll._id})
      console.log(answer)
      if(answer){
        res.status(200).json(answer)
      }else{
        res.status(400).send("no answer find")
      }
    }else{
      res.status(400).send("no poll find")
    }
  }

  module.exports = {getAnswerById}