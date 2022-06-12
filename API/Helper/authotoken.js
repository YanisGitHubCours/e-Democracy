const jwt = require("jsonwebtoken");

const config = process.env;

const isAuthorized = (req, res, next) => {
    const token = req.headers["authorization"];
    
    if (!token) {
        return res.status(403).send("Something wrong with your request");
    }
    try {
        const decodetoken = jwt.verify(token, config.TS);
        req.user = decodetoken;
    } catch (err) {
        return res.status(401).send("Invalid Token");
    }
    return next();
};

module.exports = isAuthorized;