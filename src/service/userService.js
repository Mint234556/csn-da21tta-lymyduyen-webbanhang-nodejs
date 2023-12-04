import bcrypt from 'bcryptjs';
import mysql from 'mysql2';
import bluebird from 'bluebird';


const salt = bcrypt.genSaltSync(10);


const hashUserPassword = (userPassword) => {
    let hashPassword = bcrypt.hashSync(userPassword, salt);
    return hashPassword;
}

const createNewUser = (email, password, username) => {
    let hashPass = hashUserPassword(password);
    connection.connect(); // Mở kết nối đến cơ sở dữ liệu
    connection.query(
        'INSERT INTO users (email, password, username) VALUES (?, ?, ?)',
        [email, hashPass, username],
        function (err, results, fields) {
            if (err) {
                console.log(err);
            }
        }
    );
}

const getUserList = async () =>{
    const connection = await mysql.createConnection({host:'localhost', user: 'root', database: 'web ban hang nodejs', Promise: bluebird});
    let user = [];
    //  connection.query(
    //     'Select * from users' ,
    //     function (err, results, fields) {
    //         if (err) {
    //             console.log(err);
    //             return users;
    //         }
    //         users = results;
    //         console.log(">>> run get user list:", users)
    //        return users;
    //     }
    // );

    try{
        const [rows, fields] = await connection.execute('Select * from users ');
        return rows;
        console.log(">>> check rows:", rows)
    }catch(error){

    }
    

module.exports = {
    createNewUser, getUserList
 }
}
