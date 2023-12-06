import bcrypt from 'bcryptjs';
import mysql from 'mysql2/promise'; // Sử dụng phiên bản promise
import bluebird from 'bluebird';

const saltRounds = 10;
const connectionPool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'web ban hang nodejs',
    Promise: bluebird
});


const hashUserPassword = (userPassword) => {
    return bcrypt.hashSync(userPassword, saltRounds);
}

const createNewUser = async (email, password, username) => {
    const hashPass = hashUserPassword(password);
    try {
        const connection = await mysql.createConnection({host: 'localhost', user:'root', database:'web ban hang nodejs'});
        const [results, fields] = await connection.execute(
            'INSERT INTO users (email, password, username) VALUES (?, ?, ?)',
            [email, hashPass, username]
        );
        connection.release(); // Giải phóng kết nối trở lại pool
        return results;
    } catch (error) {
        console.error('Lỗi tạo người dùng mới:', error);
        throw error; // Ném lại lỗi để xử lý ở cấp cao hơn
    }
}

const handleUserPage = (req, res) => {
    let userList = userService.getUserList();

    // Kiểm tra kiểu dữ liệu của userList
    console.log(">>> check user list type: ", typeof userList);

    console.log(">>> check user list: ", userList)
    return res.render("user.ejs", { userList });
}


const getUserList = async () => {
    try {
        const connection = await connectionPool.getConnection();
        const [rows, fields] = await connection.execute('SELECT * FROM users');
        connection.release();
        return rows;
    } catch (error) {
        console.error('Lỗi lấy danh sách người dùng:', error);
        throw error;
    }
}

module.exports = {
    getUserList
};


module.exports = {
    createNewUser,
    getUserList
};
