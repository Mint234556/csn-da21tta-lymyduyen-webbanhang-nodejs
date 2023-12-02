import express from "express";
import configviewEngine from "./config/viewEngine";
import initWebRoutes from "./routes/web";
require("dotenv").config();
import bodyParser from "body-parser";
let app = express();

//config app

configviewEngine(app);

//config body-parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

initWebRoutes(app);

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    console.log("Web ban hang dang chay" +PORT);
})