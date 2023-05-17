const db = require('../common/connect')
const helper = require('../common/helper')


const statistic = (statistic) => {
    this.totalProduct = statistic.totalProduct
    this.totalOrder = product.totalOrder
}
statistic.getAll = function(result) {
    db.query("SELECT  (SELECT COUNT(*)FROM products) AS totalProduct,(SELECT COUNT(*)FROM orders) AS totalOrder,(SELECT COUNT(*)FROM users) AS totalUsers FROM dual", function(err, statistic) {

        if (err) {
            console.log('asdasd', err);
        } else {
            console.log("statistic",statistic);
            result(statistic)

        }
    })
}
statistic.getStatisticOrder = function(result) {
    db.query("Select count(created_at) as total, created_at as created_at from orders group by date(created_at) ORDER BY created_at DESC", function(err, statistic) {
        if (err) {
            console.log('asdasd', err);
        } else {
            console.log("statistic",statistic);
            result(statistic)

        }
    })
}
module.exports = statistic