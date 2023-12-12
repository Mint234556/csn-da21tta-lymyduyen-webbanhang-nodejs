// productService.js

import mysql from 'mysql2/promise';
import bluebird from 'bluebird';

const connectionPool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'web ban hang nodejs',
    Promise: bluebird
});

const createNewProduct = async (name, price) => {
    try {
        const connection = await connectionPool.getConnection();
        const [results, fields] = await connection.execute(
            'INSERT INTO products (name, price) VALUES (?, ?)',
            [name, price]
        );
        connection.release();
        return results;
    } catch (error) {
        console.error('Lỗi tạo sản phẩm mới:', error);
        throw error;
    }
}

const getProductList = async () => {
    try {
        const connection = await connectionPool.getConnection();
        const [rows, fields] = await connection.execute('SELECT * FROM products');
        connection.release();
        return rows;
    } catch (error) {
        console.error('Lỗi lấy danh sách sản phẩm:', error);
        throw error;
    }
}

const deleteProduct = async (productId) => {
    try {
        const connection = await connectionPool.getConnection();
        const [rows, fields] = await connection.execute('DELETE FROM products WHERE id = ?', [productId]);
        connection.release();
        return rows;
    } catch (error) {
        console.error('Lỗi xóa sản phẩm:', error);
        throw error;
    }
}

const getProductById = async (productId) => {
    try {
        const connection = await connectionPool.getConnection();
        const [rows, fields] = await connection.execute('SELECT * FROM products WHERE id = ?', [productId]);
        connection.release();
        return rows[0];
    } catch (error) {
        console.error('Lỗi lấy thông tin sản phẩm:', error);
        throw error;
    }
}

const updateProduct = async (productId, name, price) => {
    try {
        const connection = await connectionPool.getConnection();
        const [rows, fields] = await connection.execute(
            'UPDATE products SET name = ?, price = ? WHERE id = ?',
            [name, price, productId]
        );
        connection.release();
        return rows;
    } catch (error) {
        console.error('Lỗi cập nhật sản phẩm:', error);
        throw error;
    }
}

export default {
    createNewProduct,
    getProductList,
    deleteProduct,
    getProductById,
    updateProduct
};
