const db = require('../common/connect')

function run() {
    var sql = `CREATE TABLE orders_product (
        id INT AUTO_INCREMENT PRIMARY KEY,
        order_id int ,
        product_id int,
        quanity int,
        price int,
        created_at datetime,
        updated_at datetime,
        CONSTRAINT FK_Orders FOREIGN KEY (order_id) REFERENCES orders(id),
        CONSTRAINT FK_Product FOREIGN KEY (product_id) REFERENCES products(id)
        )`;
    db.query(sql, function(err, result) {
        if (err) throw err;
        console.log("Table created");
    });
}
run()