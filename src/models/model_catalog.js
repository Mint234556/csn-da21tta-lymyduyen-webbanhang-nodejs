import db from './database.js'; // Nhúng model database vào để kết nối db

let itemCat = []; // Biến để chứa dữ liệu đổ về cho controller
let dataList = [];
let dataListPro = [];

export default new class ModelCatalog {

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

    // Định nghĩa các hàm để tương tác vào MySQL
    list = async () => {
        try {
            const sql = "SELECT * FROM catalog";
            dataList = await this.queryAsync(sql);
            console.log('List success');
            return dataList;
        } catch (error) {
            console.error('Error getting catalog list', error);
            throw error;
        }
    };

    listByName = async (nameCat) => {
        try {
            const sql = `SELECT * FROM catalog WHERE nameCat='${nameCat}'`;
            itemCat = (await this.queryAsync(sql))[0].idCat;

            const sql2 = `SELECT * FROM product WHERE idCat=${itemCat}`;
            dataListPro = await this.queryAsync(sql2);

            console.log('Get list product by id Cat success');
            return dataListPro;
        } catch (error) {
            console.error('Error getting product list by category name', error);
            throw error;
        }
    };

    
}
