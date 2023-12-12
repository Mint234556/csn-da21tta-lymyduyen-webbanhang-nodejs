import { validationResult } from 'express-validator';
import cosmeticsService from '../service/cosmeticsService';

const cosmeticsController = {
  handleHelloWorld: (req, res) => {
    return res.render("home.ejs");
  },

  handleCosmeticsPage : async (req, res) => {
    try {
      let productList = await cosmeticsService.getProductList();
      console.log(">>> check product list: ", productList);
      return res.render("productForm.ejs", { productList });
    } catch (error) {
      console.error('Lỗi khi xử lý trang mỹ phẩm:', error);
      return res.status(500).send('Internal Server Error');
    }
  },

  handleCreateOrder: (req, res) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
      return res.status(400).render('order-form', { errors: errors.array() });
    }

    // Logic để xử lý tạo đơn hàng
    const { customerName, email, phone, cosmeticId, quantity } = req.body;
    // Validate và xử lý đơn hàng
    res.render('order-success', { quantity, cosmeticId, customerName });
  },

  const handleCreateProduct = async (req, res) => {
    try {
      // Lấy thông tin sản phẩm từ req.body
      let productName = req.body.productName;
      let productPrice = req.body.productPrice;
      let productDescription = req.body.productDescription;
  
      // Gọi cosmeticsService để tạo sản phẩm mới
      await cosmeticsService.createNewProduct(productName, productPrice, productDescription);
  
      // Trả về một thông báo hoặc chuyển hướng tùy thuộc vào logic của bạn
      return res.send("Product created successfully");
    } catch (error) {
      console.error('Error creating product:', error);
      return res.status(500).send('Internal Server Error');
    }
  };
  

  displayOrderHistory: (req, res) => {
    // Logic để lấy và hiển thị lịch sử đơn hàng
    return res.render('order-history', { pageTitle: 'Trang Lịch sử đơn hàng' });
  }
};

export default cosmeticsController;
module.exports = {
  handleHelloWorld,
  handleCosmeticsPage,
  handleCreateNewProduct
}