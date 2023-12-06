import userService from '../service/userService';

const handleHelloWorld = (req, res) => {
    return res.render("home.ejs");
}

const handleUserPage = async (req, res) => {
    try {
        let userList = await userService.getUserList();
        console.log(">>> check user list: ", userList);
        return res.render("user.ejs", { userList });
    } catch (error) {
        console.error('Lỗi khi xử lý trang người dùng:', error);
        return res.status(500).send('Internal Server Error');
    }
}

const handleCreateNewUser = (req, res) => {
    // Lấy thông tin người dùng từ req.body
    let email = req.body.email;
    let password = req.body.password;
    let username = req.body.username;

    // Gọi userService để tạo người dùng mới
    userService.createNewUser(email, password, username);

    // Trả về một thông báo hoặc chuyển hướng tùy thuộc vào logic của bạn
    return res.send("User created successfully");
}

module.exports = {
    handleHelloWorld,
    handleUserPage,
    handleCreateNewUser
}
