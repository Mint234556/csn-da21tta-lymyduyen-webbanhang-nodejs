import db from './database.js';

let data = [];
let dataNewArrivel = [];
let dataRecent = [];

export default new class ModelIndex {

    // Hàm util để thực hiện các truy vấn MySQL theo dạng Promise
    async queryAsync(sql) {
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

    listCat = async () => {
        try {
            const sql = "SELECT * FROM catalog";
            data = await this.queryAsync(sql);
            console.log('List success');
            return data;
        } catch (error) {
            console.error('Error getting catalog list', error);
            throw error;
        }
    };
    
    listNewArrival = async () => {
        try {
            const sql = "SELECT * FROM product LIMIT 7";
            dataNewArrivel = await this.queryAsync(sql);
            console.log('List success');
            return dataNewArrivel;
        } catch (error) {
            console.error('Error getting new arrival list', error);
            throw error;
        }
    };
    
    listRecent = async () => {
        try {
            const sql = "SELECT * FROM product ORDER BY dateUpdate DESC LIMIT 6";
            dataRecent = await this.queryAsync(sql);
            console.log('List success');
            return dataRecent;
        } catch (error) {
            console.error('Error getting recent list', error);
            throw error;
        }
    };
    
    listCart = async (user) => {
        try {
            const sql = `SELECT * FROM cart WHERE user='${user}'`;
            data = await this.queryAsync(sql);
            console.log('List success');
            return data;
        } catch (error) {
            console.error('Error getting cart list', error);
            throw error;
        }
    };
    
}


