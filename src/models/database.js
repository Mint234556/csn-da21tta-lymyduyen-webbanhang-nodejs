var mysql = require('mysql');
var db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'web ban hang nodejs'
})

db.connect(function (err) {
    if (err) {
        console.error("Database is failed to connect!", error);
        return;
    }
    console.log('Database is connected successfully \nServer is running on port localhost:3000');
});

module.exports = db;