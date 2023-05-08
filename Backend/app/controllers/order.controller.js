var order = require('../model/order.model')
var orderProduct = require('../model/orderProduct.model')

exports.getAll = function(req, res) {
    console.log('vao ko111');
    orderProduct.getAll()
        // orderProduct.delete(req.params.id, function(respone) {
        //     res.send({ result: respone })
        // })
}