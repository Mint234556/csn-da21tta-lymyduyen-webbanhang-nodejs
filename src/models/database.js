import mysql from 'mysql';

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'mytuyen' // Đã sửa tên database để tránh sử dụng dấu cách
});

db.connect((err) => {
  if (err) {
    console.error("Database is failed to connect!", err); // Sửa từ `error` sang `err`
    return;
  }
  console.log('Database is connected successfully \nServer is running on port localhost:3000');
});

export default db;
