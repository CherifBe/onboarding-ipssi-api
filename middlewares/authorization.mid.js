const jwt = require('jsonwebtoken');
require('dotenv').config();

const authorization = (req, res, next) => {
    try {
        const token = req.headers.authorization.split(' ')[1];
        const { userId, email } = jwt.verify(token, process.env.TOKEN_SECRET);
        req.user = {
            userId,
            email,
        };
        next();
    } catch (error) {
        console.log('error authorization');
        next('=> token not valid');
    }
};

module.exports = authorization;