const mongoose = require('mongoose');

const GroupSchema = new mongoose.Schema(
    {
      name: {
        type: String,
        default: ""
      },
      description: {
        type: String,
        default: ""
      },
      owner: {
        type: String,
        default: ""
      },
    }
  );
  const group = mongoose.model("groups", GroupSchema) 
  module.exports = group