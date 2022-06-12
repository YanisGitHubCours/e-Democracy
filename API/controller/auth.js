const bcrypt = require('bcrypt')
const UserModel = require('../model/user.js')
const jwt = require("jsonwebtoken");

const ParseInput = async (body,res) => {
    
    const user = new UserModel(body)
    if (!user.email || !user.password || !user.lastname || !user.firstname || !user.pseudo) {
        res.status(400).send("mail, firstname, pseudo, lastname or password cant be empty");
    }else {
        const oldUser = await UserModel.findOne({ email: user.email })
        if (oldUser) {
            res.status(400).send("User already exist");
        }else {
            encryptedPassword = await bcrypt.hash(user.password, 10);
            user.password = encryptedPassword
            await user.save()
            res.status(200).json(user)
        }
    }
}

const login = async(body,res) => {

    const { email, password } = body;

    if (!email || !password) {
      res.status(400).send("All input is required");
    }
    // Find if user exist
    const user = await UserModel.findOne({ email });
    //if my user exist and the password match
    if (user && (await bcrypt.compare(password, user.password))) {
      // Create token
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
      res.status(200).json(user.token);
    }else [
        res.status(400).send("Invalid Credentials")
    ]
}

const logout = async(body, res) => {
    if(!body.user){
        res.status(400).send("you are not supposed to be here");
    }else {
        const userid = body.user.user_id
        const user = await UserModel.findOne({userid})
        user.token = ""
        if(user.save()){
            res.status(200).send("you are disconnected")
        }else {
            res.status(400).send("error in the process of logout")
        }
    }
}

module.exports = {ParseInput, login, logout}