/* Kết nối với DB*/
const db = require('../common/connect')
const helper = require('../common/helper')


const product = (product) => {
    this.id = product.id
    this.name = product.name
    this.price = product.price
    this.quantity = product.quantity
    this.linkImage = product.linkImage
    this.status = product.status
    this.created_at = product.created_at
    this.updated_at = product.updated_at
}
// Lấy toàn bộ sản phẩm 
product.getAll = function (page, page_size, sort, params_sort, result) {
    let total;
    db.query("SELECT COUNT(*) as count FROM products", function (err, res) {
        // Tổng số lượng sản phẩm
        total = res[0].count
        // Số trang
        const totalPage = Math.ceil(total / page_size)
        if (page || page_size) {
            db.query("SELECT * FROM products", function (err, product) {
                if (err) {
                    throw err
                }
                else {
                    // tính offset
                    const offset = (parseInt(page) - 1) * parseInt(page_size)
                    // tạo biến val để check đối tượng cần sort
                    let val;
                    // tạo biến sort để check tăng giảm
                    let sort2 = params_sort ? params_sort : 'ASC';
                    if (sort == 1) {
                        val = 'price'
                    }
                    else if (sort == 2) {
                        val = 'name'
                    }
                    else {
                        val = 'created_at'
                    }
                    if (sort || params_sort) {
                        // Truy vấn vào db
                        db.query(`SELECT * FROM products ORDER BY ${val} ${sort2} LIMIT ? OFFSET ? `, [parseInt(page_size), offset], function (err, product) {
                            console.log(sort2);
                            if (err) {
                                console.log(err);
                            }
                            else {
                                product.totalPage = totalPage
                                product.total = total
                                console.log(totalPage, total);
                                result(product)
                            }
                        })
                    }
                    else {
                        db.query(`SELECT * FROM products ORDER BY ${val} LIMIT ? OFFSET ?`, [parseInt(page_size), offset], function (err, product) {
                            if (err) {
                                console.log(err);
                            }
                            else {
                                product.totalPage = totalPage
                                product.total = total
                                console.log(totalPage, total);
                                result(product)
                            }
                        })
                    }
                }
            })
        } else {
            db.query("SELECT * FROM products", function (err, product) {
                if (err) {
                    console.log(err)
                }
                else {
                    product.totalPage = totalPage
                    product.total = total
                    result(product)
                }
            })
        }
    })
}

// Lấy sản phẩm chi tiết
product.getById = function (id, result) {
    console.log('id', id);
    console.log('result', result);
    db.query("SELECT * FROM products Where id = ? ", id, function (err, product) {
        if (err) {
            console.log(product);
        }
        else {
            result(product)
        }
    })
}

// Tạo thêm sản phẩm trong DB
product.create = function (data, result) {
    let timeToday = helper.getTimeCurrent()
    data.created_at = timeToday
    data.updated_at = timeToday
    db.query("INSERT INTO products SET ?", data, function (err, product) {
        if (err) {
            result(null)
        }
        else {
            result({ id: product.insertId, ...data })
        }
    })
}
// Cập nhật thông tin sản phẩm
product.update = function (data, result) {
    db.query("UPDATE products SET name = ? , price = ? , quantity = ? , link_image =?,status=?, updated_at=? Where id = ?", [data.name, data.price, data.quantity, data.link_image, data.status, helper.getTimeCurrent(), data.id], function (err, product) {
        if (err) {
            result(null)
        }
        else {
            result(data)
        }
    })
}
// Xóa Sản phẩm
product.delete = function (id, result) {
    db.query("DELETE FROM products Where id = ?", id, function (err, product) {
        if (err) {
            console.log(product);
        }
        else {
            result("Xóa thành công sản phẩm")
        }
    })
}
// Pagination
module.exports = product