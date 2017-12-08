const home = require("../controllers/home");

module.exports = (app) => {
    app.get("/test", (req, res) => {
        home.index(req, res);
    });
}
