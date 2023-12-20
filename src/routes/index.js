import express from 'express';
import modelIndex from '../models/model_index.js';
import modelUser from '../models/model_user.js';
import modelProduct from '../models/model_product.js';

const router = express.Router();

/* GET home page. */
router.get('/', async (req, res, next) => {
    try {
        const listCat = await modelIndex.listCat();
        const listRecent = await modelIndex.listRecent();
        const listNewArrival = await modelIndex.listNewArrival();
        res.render('site/index', { listCat, listNewArrival, listRecent });
    } catch (error) {
        console.error('Error rendering home page:', error);
        res.status(500).send('Internal Server Error');
    }
});

router.get('/gio-hang/', async (req, res, next) => {
    try {
        const listPro = await modelProduct.hotProduct();
        res.render('site/gio-hang.ejs', { listPro });
    } catch (error) {
        console.error('Error rendering shopping cart page:', error);
        res.status(500).send('Internal Server Error');
    }
});

router.get('/thanh-toan', (req, res, next) => {
    res.render('site/thanh-toan.ejs');
});

router.get('/wishlist', async (req, res, next) => {
    try {
        const listPro = await modelProduct.hotProduct();
        res.render('site/wishlist.ejs', { listPro });
    } catch (error) {
        console.error('Error rendering wishlist page:', error);
        res.status(500).send('Internal Server Error');
    }
});

router.get('/lien-he', (req, res, next) => {
    res.render('site/lien-he.ejs');
});

export default router;
