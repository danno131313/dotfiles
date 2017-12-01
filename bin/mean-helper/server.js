const express  = require('express');
const app      = express();
const bp       = require("body-parser");
const path     = require("path");
const session  = require("express-session");
const mongoose = require("mongoose");
const port     = 8000;

app.use(express.static(path.join(__dirname, "./client")));
app.use(bp.urlencoded({extended: true}));
app.set("views", path.join(__dirname, "./views"));
app.set("view engine", "ejs");
app.use(session({
    secret: "lolololololol secrets",
    saveUninitialized: false,
    resave: false,
}));

mongoose.connect("mongodb://localhost/{{ DB_NAME }}")
mongoose.Promise = global.Promise;



app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
