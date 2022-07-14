const mongoose = require('mongoose');

const TasksSchema = new mongoose.Schema(
    {
      name: {
        type: String,
        default: ""
      },
      description: {
        type: String,
        default: ""
      },
      fk_user: {
        type: String,
        default: ""
      },
    }
  );
  const task = mongoose.model("tasks", TasksSchema) 
  module.exports = task