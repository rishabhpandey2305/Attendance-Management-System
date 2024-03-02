// authenticationMiddleware.js

const authenticationMiddleware = async (req, res, next) => {
    // Authentication logic here
    next();
};

module.exports = authenticationMiddleware;
