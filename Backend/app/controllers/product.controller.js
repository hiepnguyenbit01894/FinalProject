var product = require('../model/product.model')
// Nơi sử dụng các phương thức để có thể thêm ,sửa,xóa,cập nhật các sản phẩm 
/** GET **/

// lấy toàn bộ sản phẩm 
exports.getProducts = function (req, res) {
    product.getAll(req.query.page, req.query.page_size, req.query.sort, req.query.params_sort, function (respone) {
        res.send({ result: respone, totalPage: respone.totalPage, total: respone.total })
    })
}
// Lấy thông tin sản phẩm 
exports.getDetail = function (req, res) {
    product.getById(req.params.id, function (data) {
        res.send({ result: data })
    })
}
// // sắp xếp giá sản phẩm từ cao xuống thấp
// exports.priceDecrease = function (req, res) {
//     product.priceDecrease(function (data) {
//         res.send({ result: data })
//     })
// }
// // sắp xếp giá sản phẩm từ thấp lên cao
// exports.priceIncrease = function (req, res) {
//     product.priceIncrease(function (data) {
//         res.send({ result: data })
//     })
// }
// // sắp xếp tên sản phẩm từ a-z
// exports.sortNameAz = function (req, res) {
//     product.sortNameAz(function (data) {
//         res.send({ result: data })
//     })
// }
// // sắp xếp tên sản phẩm từ a-z
// exports.sortNameZa = function (req, res) {
//     product.sortNameZa(function (data) {
//         res.send({ result: data })
//     })
// }


// Cập nhật thông tin sản phẩm 
exports.updateProduct = function (req, res) {
    product.update(req.body, function (data) {
        res.send({ result: data })
    })
}
/** ADD**/
exports.addProduct = function (req, res) {
    let data = req.body
    product.create(data, function (respone) {
        res.send({ result: respone })
    })
}

/*DELETE*/
exports.deleteProduct = function (req, res) {
    product.delete(req.params.id, function (respone) {
        res.send({ result: respone })
    })
}
