const db = require('../common/connect')
function a(){
    var sql = `CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        firstname VARCHAR(255),
        lastname VARCHAR(255),
        username VARCHAR(255), 
        password VARCHAR(255),
        email VARCHAR(255),
        phone VARCHAR(255),
        address VARCHAR(255),
        image VARCHAR(255),
        created_at datetime,
        updated_at datetime)`;
    db.query(sql, function (err, result) {
      if (err) throw err;
      console.log("Table created");
    });
}
a()