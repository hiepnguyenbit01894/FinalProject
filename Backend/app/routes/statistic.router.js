module.exports = function(router) {
    var statistic = require('../controllers/statistic.controller')
    router.get('/home/statistic', statistic.getAll)
    router.get('/home/order/statistic', statistic.getStatisticOrder)
    
}