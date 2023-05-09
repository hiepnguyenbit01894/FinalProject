var order = require('../model/order.model')
var orderProduct = require('../model/orderProduct.model')

exports.getAll = function(req, res) {
    console.log('vao ko111');
    orderProduct.getAll(function(respone) {
        res.send({ data: respone })
    })
}

exports.createOrder = function(req, res) {
    console.log(123123123);
    let data = req.body
    orderProduct.createOrder(data, function(respone) {
        res.send({ result: respone })
    })
}