module.exports = function(router) {
    var userController = require('../controllers/user.controller')
    router.post('/user/resgister', userController.register)
    router.post('/user/login', userController.login)
    router.get('/user/list',userController.getUsers)
}