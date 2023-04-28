var mysql = require ('mysql')
var connection = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'demo_node_api'
})
connection.connect(function(err){
    if(err)
    {
        console.log("Kết nối CSDL không Thành công")
    }
    else{
        console.log('Kết nối CSDL thành công')
    }
})
module.exports = connection