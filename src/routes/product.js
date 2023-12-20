import express from 'express';
const router = express.Router();
import modelProduct from '../models/model_product.js';
import modelCatalog from '../models/model_catalog.js';

let breadcrumb = 'Tất cả sản phẩm';

router.get('/', async (req, res) => {
    try {
        const listPro = await modelProduct.list();
        const listProPopular = await modelProduct.list();
        const listCat = await modelCatalog.list();
        res.render('site/san-pham', { listPro, listCat, listProPopular, breadcrumb });
    } catch (error) {
        console.error('Error rendering product page:', error);
        res.status(500).send('Internal Server Error');
    }
});

router.get('/addnew', (req, res, next) => {
    res.render('product_addnew');
});

router.get('/:name', async (req, res) => {
    try {
        const name = req.params.name;
        const listPro = await modelProduct.list();
        const listCat = await modelCatalog.list();

        for (const itemPro of listPro) {
            const newNamePro = itemPro.nameProduct;
            breadcrumb = newNamePro;
            const newNameProLowerCase = replaceNameProduct(itemPro.nameProduct).toLowerCase();
            console.log(newNameProLowerCase);
            if (newNameProLowerCase === name) {
                const newItemPro = itemPro;
                break;
            }
        }

        const listComment = await modelProduct.getComment(newItemPro.idProduct);
        res.render('site/chi-tiet-san-pham', { itemPro: newItemPro, listCat, listPro, listComment, breadcrumb });
    } catch (error) {
        console.error('Error rendering product details page:', error);
        res.status(500).send('Internal Server Error');
    }
});

// API
router.get('/api/hot-product', async (req, res) => {
    try {
        const data = await modelProduct.hotProduct();
        res.json(data);
    } catch (error) {
        console.error('Error handling API request:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

router.get('/api/new-product', async (req, res) => {
    try {
        const data = await modelProduct.newProduct();
        res.json(data);
    } catch (error) {
        console.error('Error handling API request:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

router.get('/api/chi-tiet-san-pham/:name', async (req, res) => {
    try {
        const name = req.params.name;
        console.log(name);
        const data = await modelProduct.detailByName(name);
        console.log(data);
        res.json(data);
    } catch (error) {
        console.error('Error handling API request:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

router.get('/api/comment/:id', async (req, res) => {
    try {
        const idProduct = req.params.id;
        const data = await modelProduct.getComment(idProduct);
        res.json(data);
    } catch (error) {
        console.error('Error handling API request:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

router.post('/comment/createcomment', async (req, res) => {
    try {
        const rating = req.body.star;
        const ten = req.body.ten;
        const email = req.body.email;
        const content = req.body.content;
        const idProduct = req.body.idProduct;
        const date = new Date();

        const data = {
            ten,
            email,
            content,
            idProduct,
            rating,
            date,
        };

        console.log(data);
        const query = await modelProduct.createComment(data);
        const nameProduct = req.body.nameProduct;
        const newName = replaceNameProduct(nameProduct).toLowerCase();
        res.redirect(`/san-pham/${newName}`);
    } catch (error) {
        console.error('Error handling comment creation:', error);
        res.status(500).send('Internal Server Error');
    }
});

function xoa_dau(str) {
    // Hàm xóa dấu như trong mã nguồn gốc
    // ...
}

function replaceNameProduct(nameProduct) {
    // Hàm thay thế tên sản phẩm như trong mã nguồn gốc
    // ...
}

export default router;
