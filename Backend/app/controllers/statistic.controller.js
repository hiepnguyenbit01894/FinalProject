var statistic = require('../model/statistic.model')
    // Nơi sử dụng các phương thức để có thể thêm ,sửa,xóa,cập nhật các sản phẩm 
    /** GET **/

// lấy toàn bộ sản phẩm 
exports.getAll = function(req, res) {
    statistic.getAll( function(respone) {
            res.send({ result: respone })
        })
    }
exports.getStatisticOrder = function(req, res) {
    statistic.getStatisticOrder( function(respone) {
            res.send({ result: respone })
        })
    }