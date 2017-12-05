const mongoose = require("mongoose");
const path     = require("path");
const fs       = require("fs");
const mp       = path.join(__dirname, "../models");

mongoose.connect("mongodb://localhost/{{ DB_NAME }}");
mongoose.Promise = global.Promise;

fs.readdirSync(mp).forEach(function(file) {
    if(file.indexOf(".js") >= 0) {
        require(mp + "/" + file);
    }
});
