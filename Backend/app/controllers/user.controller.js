var user = require('../model/user.model')

// Hàm đăng ký
exports.register = async function(req, res) {
    let data = req.body
    const exits = await user.userExists(data.username)
    if (!exits) {
        user.register(data, function(respone) {
            console.log('respibansd', respone);
            res.send({ result: respone })
        })
    } else {
        res.status(400).send({
            'success': false,
            'message': 'Tên tài khoản đã tồn tại'
        });
    }
}

//Login
exports.login = async function(req, res) {
    let data = req.body
    user.login(data, function(respone) {
        console.log(respone)
        res.send({
            result: respone
        })
    })
}
// Get All
exports.getUsers =  function(req,res){
    user.getUsers(req,function(respone){
        res.send(respone)
    })
}