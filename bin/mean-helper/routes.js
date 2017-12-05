const controller = require("../controllers/controller");
module.exports = (app) => {

    app.get("/", (req, res) => {
        controller.index(req, res);
    });

}
