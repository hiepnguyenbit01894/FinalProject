const db = require('../common/connect')

function run() {
    var sql = `CREATE TABLE orders (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id int ,
        created_at datetime,
        updated_at datetime,
        CONSTRAINT FK_UserOrder FOREIGN KEY (user_id)REFERENCES users(id)
        )`;
    db.query(sql, function(err, result) {
        if (err) throw err;
        console.log("Table created");
    });
}
run()