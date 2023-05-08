/* Kết nối với DB*/
const db = require('../common/connect')
const helper = require('../common/helper')

const orderProduct = (orderProduct) => {
        this.id = orderProduct.id
        this.order_id = orderProduct.order_id
        this.product_id = orderProduct.product_id
        this.quanity = orderProduct.quanity
        this.created_at = product.created_at
        this.updated_at = product.updated_at
    }
    // Lấy toàn bộ order
orderProduct.getAll = function(result) {
    let total;
    db.query("SELECT odp.id, pr.`name`, us.username FROM orders_product as odp JOIN orders as od ON odp.order_id = od.id JOIN products  as pr ON odp.product_id = pr.id JOIN users  as us ON od.user_id = us.id", function(err, orderProduct) {

        if (err) {
            console.log('asdasd', err);
        } else {
            let a = orderProduct
                // result(a)
            console.log('asdasdasd', a);
        }

    })
}
module.exports = orderProduct