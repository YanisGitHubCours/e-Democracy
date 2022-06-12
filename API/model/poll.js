const mongoose = require('mongoose');

const PoolSchema = new mongoose.Schema(
    {
      name: {
        type: String,
        default: ""
      },
      description: {
        type: String,
        default: ""
      },
      type: {
        type: String,
        default: ""
      },
      isAnonym: {
        type: Boolean,
        default: ""
      },
      isFinish: {
        type: Boolean,
        default: ""
      },
      timer: {
        type: String,
        default: ""
      },
      fk_user: {
        type: String,
        default: ""
      },
    }
  );
  const pool = mongoose.model("polls", PoolSchema) 
  module.exports = pool