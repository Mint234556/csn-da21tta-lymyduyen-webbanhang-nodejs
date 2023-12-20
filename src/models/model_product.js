import db from './database.js';

let dataList = [];
let dataName = [];

export default new class ModelProduct {

    createComment = (data) => {
        console.log(data);
        return new Promise((resolve, reject) => {
            let sql = "INSERT INTO comment SET ?";
            db.query(sql, data, (err, d) => {
                console.log('Insert successfully');
                resolve(d);
            });
        });
    };
    
    // Hàm util để thực hiện các truy vấn MySQL theo dạng Promise
    queryAsync = (sql) => {
        return new Promise((resolve, reject) => {
            db.query(sql, (err, result) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(result);
                }
            });
        });
    };
    
    
    xoa_dau(str) {
        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
        str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
        str = str.replace(/đ/g, "d");
        str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "a");
        str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "e");
        str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "i");
        str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "o");
        str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "u");
        str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "y");
        str = str.replace(/Đ/g, "d");
        str = str.split(' ').join('-');
        return str;
      }
      
    replaceNameProduct(nameProduct) {
        var newNameProduct = xoa_dau(nameProduct);
        return newNameProduct;
    }

    list = async () => {
        try {
            const sql = "SELECT * FROM product";
            dataList = await this.queryAsync(sql);
            console.log('List success');
            return dataList;
        } catch (error) {
            console.error('Error getting product list', error);
            throw error;
        }
    };
    
    detail = async (idProduct) => {
        try {
            const sql = `SELECT * FROM product WHERE idProduct=${idProduct}`;
            const data = (await this.queryAsync(sql))[0];
            console.log('Detail success');
            return data;
        } catch (error) {
            console.error('Error getting product detail', error);
            throw error;
        }
    };
    
    detailByName = async (name) => {
        try {
            let filterProduct;
            const sql = `SELECT * FROM product`;
            dataName = await this.queryAsync(sql);
            for (let i in dataName) {
                let product = dataName[i];
                let newName = replaceNameProduct(product.nameProduct.toLowerCase());
                if (newName === name) {
                    filterProduct = product;
                }
            }
            console.log('Detail success');
            return filterProduct;
        } catch (error) {
            console.error('Error getting product detail by name', error);
            throw error;
        }
    };
    
    create = (name, shortDesc, images, description, dateUpdate, price, author, idCat, showHide) => {
        let data = {
            name: name,
            shortDesc: shortDesc,
            images: images,
            description: description,
            dateUpdate: dateUpdate,
            price: price,
            author: author,
            idCat: idCat,
            showHide: showHide,
        };
        let sql = "INSERT INTO products SET ?";
        db.query(sql, data, (err, result) => {
            console.log('Create success');
        });
    };
    
    update = (idProduct, name, shortDesc, images, description, dateUpdate, price, author, idCat, showHide) => {
        let sql = `UPDATE products SET 
                    name='${name}', 
                    shortDesc='${shortDesc}', 
                    images='${images}',
                    description='${description}',
                    dateUpdate='${dateUpdate}',
                    price='${price}',
                    author='${author}',
                    idCat='${idCat}',
                    showHide='${showHide}'
                    WHERE idProduct=${idProduct}`;
        db.query(sql, (err, result) => {
            console.log('Update success');
        });
    };
    
    remove = (idProduct) => {
        let sql = `DELETE FROM products WHERE idProduct=${idProduct}`;
        db.query(sql, (err, result) => {
            console.log('Delete success');
        });
    };
    
    hotProduct = async () => {
        try {
            const sql = "SELECT * FROM product WHERE views > 0 ORDER BY views DESC LIMIT 5";
            dataList = await this.queryAsync(sql);
            console.log('List success');
            return dataList;
        } catch (error) {
            console.error('Error getting hot products list', error);
            throw error;
        }
    };
    
    newProduct = async () => {
        try {
            const sql = "SELECT * FROM product ORDER BY dateUpdate DESC LIMIT 5";
            dataList = await this.queryAsync(sql);
            console.log('List success');
            return dataList;
        } catch (error) {
            console.error('Error getting new products list', error);
            throw error;
        }
    };
    
    
}

// exports.createComment = (data) => {
//     console.log(data);
//     return new Promise( (resolve, reject) => {
//         let sql = "INSERT INTO comment SET ?";
//         db.query(sql, data, (err, d) => {
//             console.log('Insert successfully')
//             resolve(d);
//         })
//     })
// }