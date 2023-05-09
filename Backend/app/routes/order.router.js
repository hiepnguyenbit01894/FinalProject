// Routing 
module.exports = function(router) {
    var orderRouter = require('../controllers/order.controller')
    router.get('/order/list', orderRouter.getAll)
    router.post('/order/create', orderRouter.createOrder)
}