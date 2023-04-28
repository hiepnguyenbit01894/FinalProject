const db = require('../common/connect')
const helper = require('../common/helper')

const user = (user) => {
    this.id = user.id
    this.firstname = user.firstname
    this.lastname = user.lastname
    this.username = user.username
    this.password = user.password
    this.email = user.email
    this.phone = user.status
    this.address = user.address
    this.created_at = user.created_at
    this.updated_at = user.updated_at
}


user.userExists = (username) => {
    return new Promise((resolve) => {
        db.query(
            'SELECT id FROM users WHERE username = ? LIMIT 1', username, (error, result) => {
                if (error) return reject(error);
                if (result && result[0]) {
                    console.log('User exists:', result); // for debug purposes
                    return resolve(true);
                }
                resolve(false);
            });
    });
};

user.register = function (data, result) {
    let timeToday = helper.getTimeCurrent()
    data.created_at = timeToday
    data.updated_at = timeToday
    db.query("INSERT INTO users SET ?", data, function (err, user) {
        if (err) {
            result(null)
        }
        else {
            result({ id: user.insertId, ...data })
        }
    })
}

module.exports = user