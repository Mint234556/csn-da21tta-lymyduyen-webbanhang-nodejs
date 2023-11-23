import Express  from "express";

let router = Express.Router();

let initwebRoutes = (app) =>{
    router.get('/', (req, res) => {
        return res.send('Hello world')
    });
    return app.use("/", router);
}

module.exports = initwebRoutes;