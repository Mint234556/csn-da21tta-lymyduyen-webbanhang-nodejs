import express from 'express';
import db from '../models/database.js';
import modelUser from '../models/model_user.js';
import bcrypt from 'bcrypt';
import nodemailer from 'nodemailer';

const router = express.Router();

router.get('/tai-khoan', (req, res, next) => {
    if (req.session.User) {
        res.render("site/my-account.ejs", { user: req.session.User });
    } else {
        req.session.back = "/users/tai-khoan";
        res.redirect("/users/dang-nhap");
    }
});

router.get('/dang-nhap', (req, res, next) => {
    res.render('site/dang-nhap.ejs');
});

router.post('/dang-nhap', async (req, res, next) => {
    try {
        const u = req.body.username;
        const p = req.body.password;
        const sql = `SELECT * FROM user WHERE username = '${u}' OR email = '${u}'`;
        const rows = await db.query(sql);

        if (rows.length <= 0) {
            res.redirect("/users/dang-nhap");
            return;
        }

        const user = rows[0];
        const pass_fromdb = user.password;
        const isPasswordCorrect = bcrypt.compareSync(p, pass_fromdb);

        if (isPasswordCorrect) {
            req.session.User = {
                id: user.idUser,
                username: user.username,
                ho: user.ho,
                ten: user.ten,
                phone: user.phone,
                email: user.email,
                address: user.address,
                logIn: true
            };

            if (req.session.back) {
                res.redirect(req.session.back);
            } else {
                res.redirect("/");
            }
        } else {
            res.redirect("/users/dang-nhap");
        }
    } catch (error) {
        console.error('Error during login:', error);
        res.status(500).send('Internal Server Error');
    }
});

router.get('/dang-ky', (req, res, next) => {
    res.render('site/dang-ky.ejs');
});

router.post('/luu', async (req, res, next) => {
    try {
        const ho = req.body.ho;
        const ten = req.body.ten;
        const u = req.body.username;
        const em = req.body.email;
        const phone = req.body.phone;
        const p = req.body.password;
        const rp = req.body.retypePassword;
        const address = req.body.address;

        if (p === rp && p !== "") {
            const salt = bcrypt.genSaltSync(10);
            const pass_mahoa = bcrypt.hashSync(p, salt);

            const user_info = { ho, ten, email: em, username: u, password: pass_mahoa, phone, address };
            const sql = 'INSERT INTO user SET ?';
            await db.query(sql, user_info);
        } else {
            res.redirect("/users/dang-ky");
        }

        res.redirect("/users/thanh-cong");
    } catch (error) {
        console.error('Error during registration:', error);
        res.status(500).send('Internal Server Error');
    }
});

router.get('/thanh-cong', (req, res, next) => {
    const message = "Đăng ký thành công";
    res.render('site/thanh-cong', { message });
});

router.get('/dang-xuat', (req, res, next) => {
    req.session.destroy();
    res.redirect("/users/dang-nhap");
});

router.post('/doi-mat-khau', async (req, res, next) => {
    try {
        const password = req.body.password;
        const newPassword = req.body.newPassword;
        const confirmPassword = req.body.confirmPassword;
        const u = req.session.User.username;
        const sql = 'SELECT * FROM user WHERE username = ?';
        const rows = await db.query(sql, [u]);

        if (rows.length <= 0) {
            res.redirect("/users/error");
            return;
        }

        const user = rows[0];
        const pass_fromdb = user.password;
        const isPasswordCorrect = bcrypt.compareSync(password, pass_fromdb);

        if (isPasswordCorrect) {
            if (newPassword === confirmPassword) {
                const salt = bcrypt.genSaltSync(10);
                const pass_mahoa = bcrypt.hashSync(newPassword, salt);
                const sql2 = `UPDATE user SET password='${pass_mahoa}' WHERE username LIKE '%${u}%'`;
                await db.query(sql2);
                const mess = "Đổi mật khẩu thành công";
                res.render('site/thanh-cong', { message: mess });
            }
        }
    } catch (error) {
        console.error('Error during password change:', error);
        res.status(500).send('Internal Server Error');
    }
});

router.get('/quen-mat-khau', (req, res) => {
    res.render('site/quen-mat-khau', { message: '' });
});

router.post('/quen-mat-khau', async (req, res) => {
    try {
        const email = req.body.email;
        const checkEmail = await modelUser.checkEmail(email);

        if (email === '') {
            const mess = "Mời bạn nhập email";
            res.render('site/quen-mat-khau', { message: mess });
        }

        if (checkEmail) {
            const mess = `Mật khẩu đã được gửi qua email ${email} của bạn!`;
            const newPassword = Math.random().toString(36).substring(7);
            const salt = bcrypt.genSaltSync(10);
            const pass_mahoa = bcrypt.hashSync(newPassword, salt);
            const sql = `UPDATE user SET password='${pass_mahoa}' WHERE email='${email}' `;
            await db.query(sql);

            const transporter = nodemailer.createTransport({
                service: 'gmail',
                auth: { user: '', pass: '' }, // Thay đổi email và password của bạn
                tls: { rejectUnauthorized: false }
            });

            const mailOptions = {
                from: 'kenbi.njr@gmail.com',
                to: `${email}`,
                subject: 'Lấy lại mật khẩu',
                html: `Cửa hàng xin gửi lại mật khẩu của bạn. <br>Your password: <b style="padding: 5px 7px; background: #eee; color: red"> ${newPassword} </b>`,
            };

            transporter.sendMail(mailOptions, (error, info) => {
                if (error) console.log(error);
                else console.log('Đã gửi mail: ' + info.response);
                res.render('site/thanh-cong', { message: mess });
            });
        } else {
            const mess = "Email không tồn tại!";
            res.render('site/quen-mat-khau', { message: mess });
        }
    } catch (error) {
        console.error('Error during password recovery:', error);
        res.status(500).send('Internal Server Error');
    }
});

export default router;
