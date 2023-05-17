/* Kết nối với DB*/
const db = require('../common/connect')
const helper = require('../common/helper')

const orderProduct = (orderProduct) => {
        this.id = orderProduct.id
        this.order_id = orderProduct.order_id
        this.product_id = orderProduct.product_id
        this.quantity = orderProduct.quantity
        this.created_at = product.created_at
        this.updated_at = product.updated_at
    }
    // Lấy toàn bộ order
orderProduct.getAll = function(result) {
    console.log(result);
    db.query("SELECT odp.id, pr.`name`, us.username FROM orders_product as odp JOIN orders as od ON odp.order_id = od.id JOIN products  as pr ON odp.product_id = pr.id JOIN users  as us ON od.user_id = us.id", function(err, orderProduct) {

        if (err) {
            console.log('asdasd', err);
        } else {
            let a = orderProduct
            result(a)
        }
    })
}

orderProduct.createOrder = function(data, result) {
    let timeToday = helper.getTimeCurrent()
    data.created_at = timeToday
    data.updated_at = timeToday
    let userId = data.user_id
    if (userId !== null && userId > 0) {
        let bodyOrder = {
            "user_id": data.user_id,
            "created_at": timeToday,
            "updated_at": timeToday
        }
        console.log('asdasdasd', bodyOrder);
        db.query("INSERT INTO orders SET ? ", bodyOrder, function(err, order) {
            if (err) {
                console.log('ád', err);
                result(null)
            } else {
                console.log('data.products', data.products);
                data.products.forEach(async element => {
                    db.query('SELECT * FROM products Where id = ?', element.id, function(err, product) {
                        let dataProduct = product[0]

                        if (dataProduct.quantity > 0) {
                            dataProduct.quantity = dataProduct.quantity - element.quantity

                        } else {
                            dataProduct.quantity = 0
                        }
                        let bodyOrderProduct = {
                            'order_id': order.insertId,
                            'product_id': element.id,
                            'quantity': element.quantity,
                            'created_at': timeToday,
                            'updated_at': timeToday
                        }
                        db.query('INSERT INTO orders_product SET ?', bodyOrderProduct, function(err, orders_product) {
                            if (err) {
                                console.log('vao day ko nhi', err);
                            } else {
                                console.log('order_produtc', orders_product);
                            }
                        })
                        db.query('UPDATE products SET quantity = ?  Where id = ?', [dataProduct.quantity, dataProduct.id], function(err, product) {
                            if (err) {
                                console.log('vao day ko nhi222', err);
                            } else {
                                console.log('order_produtc222222', product);
                            }
                        })
                    })

                });
                result({ id: order.insertId, ...data })
                console.log('ádasdasdsd', order);
            }
        })
    }
    // db.query("INSERT INTO products SET ?", data, function(err, product) {
    //     if (err) {
    //         result(null)
    //     } else {
    //         
    //     }
    // })
}
module.exports = orderProduct