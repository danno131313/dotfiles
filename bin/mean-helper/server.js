const express  = require('express');
const app      = express();
const bp       = require("body-parser");
const path     = require("path");
const session  = require("express-session");
const mongoose = require("mongoose");
const port     = 8000;

app.use(express.static(path.join(__dirname, "./client")));
app.use(bp.json());
app.use(session({
    secret: "lolololololol secrets",
    saveUninitialized: false,
    resave: false,
}));

require("./config/mongoose");
require("./config/routes")(app);

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
