module.exports = function (router) {
    var userController = require('../controllers/user.controller')
    router.post('/user/resgister', userController.register)

}