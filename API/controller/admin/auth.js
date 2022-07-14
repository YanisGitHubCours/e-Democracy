const bcrypt = require('bcrypt')
const UserModel = require('../../model/user.js')
const RoleModel = require('../../model/role.js')
const jwt = require("jsonwebtoken");
const Mongoose = require('mongoose');
const { json } = require('body-parser');

const login = async (body, res) => {
  let jsonObject = {};
  const { email, password } = body;

  if (!email || !password) {
    jsonObject["error"] = "All input is required"
    res.status(400).json(jsonObject);
  }
  // Find if user exist
  const user = await UserModel.findOne({ email });

  if (user && (await bcrypt.compare(password, user.password))) {
    const id = Mongoose.Types.ObjectId(user.fk_role)
    const userrole = await RoleModel.findOne({ _id: id })
    console.log(userrole)
    if (userrole.name == "admin") {
      const token = jwt.sign(
        { user_id: user._id, email },
        process.env.TS,
        {
          expiresIn: "5h",
        }
      );

      // save user token
      user.token = token;
      user.save()

      // user
      jsonObject["good"] = user.token
      res.status(200).send(JSON.stringify(jsonObject));
    } else {
      jsonObject["error"] = "Invalid Credentials"
      res.status(400).send(JSON.stringify(jsonObject))
    }
  } else {
    jsonObject["error"] = "Invalid Credentials"
    res.status(400).send(JSON.stringify(jsonObject))
  }
}

const logout = async (body, res) => {
  let jsonObject = {};
  if (!body.user) {
    jsonObject["error"] = "you are not supposed to be here"
    res.status(400).send(JSON.stringify(jsonObject));
  } else {
    const email = body.user.email
    const user = await UserModel.findOne({ email })
    user.token = ""
    if (user.save()) {
      jsonObject["good"] = "you are disconnected"
      res.status(200).send(JSON.stringify(jsonObject))
    } else {
      jsonObject["error"] = "error in the process of logout"
      res.status(400).send(JSON.stringify(jsonObject))
    }
  }
}

module.exports = { login, logout }