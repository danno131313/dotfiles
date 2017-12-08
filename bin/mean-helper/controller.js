const mongoose = require("mongoose");

module.exports = {
    index: function(req, res) {
        return res.json({content: "It's working"});
    }
}
