import db from './database.js';

export default new class ModelUser {

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

    checkEmail = async (email) => {
        try {
            const sql = `SELECT * FROM user WHERE email = '${email}'`;
            const data = (await this.queryAsync(sql))[0];
            console.log('List success');
            return data;
        } catch (error) {
            console.error('Error checking email', error);
            throw error;
        }
    };
    
    checkUsername = async (username) => {
        try {
            const sql = `SELECT * FROM user WHERE username = '${username}'`;
            const data = (await this.queryAsync(sql))[0];
            console.log('List success');
            return data;
        } catch (error) {
            console.error('Error checking username', error);
            throw error;
        }
    };
    
    
}

