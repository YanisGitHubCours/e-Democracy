const PollModel = require('../../model/poll.js')

const getPolls = async (res) => {
  // Find pool
  const poll = await PollModel.find()

  //if my pool exist
  if (poll) {
    // return all pool
    res.status(200).json(poll);
  } else {
    res.status(400).send("no poll")
  }
}

const getPollsDesc = async (res) => {
  // Find pool
  const poll = await PollModel.find().sort({_id: -1})

  //if my pool exist
  if (poll) {
    // return all pool
    res.status(200).json(poll);
  } else {
    res.status(400).send("no poll")
  }
}

const getPollsByIdUser = async (req, res) => {
  // Find pool
  const user = req.body.id
  const poll = await PollModel.find({fk_user:user})

  //if my pool exist
  if (poll) {
    // return all pool
    res.status(200).json(poll);
  } else {
    res.status(400).send("no poll")
  }
}

const getPollsByTimer = async (req, res) => {
  const type = req.body.type
  const poll = await PollModel.findOne(timer)

  //if my pool exist
  if (poll) {
    // return all pool
    res.status(200).json(poll);
  } else {
    res.status(400).send("no poll")
  }
}

const getPollsByType = async (req, res) => {
  const type = req.body.type
  const poll = await PollModel.findOne({ type: type })

  //if my pool exist
  if (poll) {
    // return all pool
    res.status(200).json(poll);
  } else {
    res.status(400).send("no poll")
  }
}

const deletePolls = async (req, res) => {
  const id = req.body.id
  const poll = await PollModel.findOneAndDelete({ _id: id })

  //if my pool exist
  if (poll) {
    // return all pool
    res.status(200).json("success");
  } else {
    res.status(400).send("error in delete process")
  }
}

module.exports = { getPolls, getPollsByIdUser, getPollsByType, getPollsByTimer, deletePolls, getPollsDesc }