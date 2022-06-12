const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema(
    {
      firstname: {
        type: String,
        default: ""
      },
      lastname: {
        type: String,
        default: ""
      },
      pseudo: {
        type: String,
        default: ""
      },
      email: {
        type: String,
        default: ""
      },
      password: {
        type: String,
        default: ""
      },
      bio: {
        type: String,
        default: ""
      },
      img: {
        type: String,
        default: ""
      },
      token: {
        type: String,
        default: ""
      },
      fk_group: {
        type: String,
        default: ""
      },
      fk_role: {
        type: String,
        default: ""
      }
    }
  );
  const user = mongoose.model("User", UserSchema) 
  module.exports = user