import express from "express";
import configviewEngine from "./config/viewEngine";
import initWebRoutes from "./routes/web";
require("dotenv").config();

let app = express();

//config app

configviewEngine(app);

initWebRoutes(app);

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    console.log("Web ban hang dang chay" +PORT);
})