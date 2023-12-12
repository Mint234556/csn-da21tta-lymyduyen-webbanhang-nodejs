import express  from "express";
import cosmeticsController from '../controller/cosmeticsController';

const router = express.Router();


/**
 * 
 * @param {*} app :express app
 * 
 */
const initwebRoutes = (app) => {
  router.get("/", cosmeticsController.handleHelloWorld); 
      
  router.get("/user", cosmeticsController.handleUserPage);
// Routes
router.get('/products',cosmeticsController.getAllProducts);
router.get('/products/add', cosmeticsController.getProductForm);
router.post('/products/add', upload.single('image'), cosmeticsController.addProduct);
router.get('/products/delete/:id', cosmeticsController.deleteProduct);
}

export default router;
