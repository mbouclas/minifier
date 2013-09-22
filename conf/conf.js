var conf = function() {
    var conf = new Object();
    return (function(conf) {
        'use strict';

        conf = require("./ioc.conf.json");

        return conf;
    })(conf || (conf = {}));
};

exports.conf = conf;
global.conf = conf();