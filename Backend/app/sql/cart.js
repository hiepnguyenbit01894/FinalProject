const db = require('../common/connect')
function b(){
    var sql = `CREATE TABLE cart (
        id INT AUTO_INCREMENT PRIMARY KEY,
        productId VARCHAR(255),
        userId VARCHAR(255),
        created_at datetime,
        updated_at datetime)`;
    db.query(sql, function (err, result) {
      if (err) throw err;
      console.log("Table created");
    });
}
b()