const mongoose = require('mongoose');

const VoteSchema = new mongoose.Schema(
    {
      fk_user: {
        type: String,
        default: ""
      },
      fk_poll: {
        type: String,
        default: ""
      },
      fk_answer: {
        type: String,
        default: ""
      },
    }
  );
  const vote = mongoose.model("votes", VoteSchema) 
  module.exports = vote