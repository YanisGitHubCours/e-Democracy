const mongoose = require('mongoose');

const AnswerSchema = new mongoose.Schema(
    {
      content: {
        type: String,
        default: ""
      },
      idPolls_fk: {
        type: String,
        default: ""
      },
    }
  );
  const answer = mongoose.model("answers", AnswerSchema) 
  module.exports = answer