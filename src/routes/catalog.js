import express from 'express';
const router = express.Router();
import modelCatalog from '../models/model_catalog.js';
import modelProduct from '../models/model_product.js';

let message = '';

router.get('/:name', async (req, res) => {
    try {
        const name = req.params.name;
        const listPro = await modelCatalog.listByName(name);
        const listProPopular = await modelProduct.list();
        const listCat = await modelCatalog.list();
        const breadcrumb = name;

        res.render('site/san-pham-theo-loai', { listPro, listCat, listProPopular, breadcrumb });
    } catch (error) {
        console.error('Error rendering page:', error);
        res.status(500).send('Internal Server Error');
    }
});

// API 
router.get('/api/:name', async (req, res) => {
    try {
        const name = req.params.name;
        const listPro = await modelCatalog.listByName(name);
        res.json(listPro);
    } catch (error) {
        console.error('Error handling API request:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

export default router;
