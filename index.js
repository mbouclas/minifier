var fs = require('fs');
var events = require('events');
var conf = require("./conf/conf.js").conf();
var express = require('express');
var app = express();
var util = require('util');
var compressor = require('node-minify');

app.configure(function() {
    app.use(express.static(__dirname + '/public'));
    app.use(express.methodOverride());
    app.use(express.bodyParser());
    app.use(express.cookieParser('secret'));
    app.use(express.cookieSession({
        secret: 'mySecret'
    }));
    app.use(express.session({
        maxAge: new Date(Date.now() + 3600000)
    }));


    app.use(app.router)
});


app.get('/', function (req, res) {
    res.render("index.html");
});

var server = app.listen(conf.port);
var io = require('socket.io').listen(server);

var walk = function(dir, done) {
    var results = [];
    fs.readdir(dir, function(err, list) {
        if (err) return done(err);
        var pending = list.length;
        if (!pending) return done(null, results);
        list.forEach(function(file) {
            file = dir + '/' + file;
            fs.stat(file, function(err, stat) {
                if (stat && stat.isDirectory()) {
                    walk(file, function(err, res) {
                        results = results.concat(res);
                        if (!--pending) done(null, results);
                    });
                } else {
                    results.push(file);
                    if (!--pending) done(null, results);
                }
            });
        });
    });
};

/*
 walk("C:/Program Files/nodejs", function(err, results) {
 if (err) throw err;
 console.log(results);
 });
 */

var dirParser = function(dir,done){
    var results = [];
    fs.readdir(dir, function(err, list) {
        if (err) return done(err);
        var pending = list.length,i=0;
        if (!pending) return done(null, results);
        list.forEach(function(file) {
            var fileName = file;
            file = dir + '/' + file;
            fileName = file.replace(dir,'');
            fileName = fileName.replace('/','');
            fs.stat(file, function(err, stat) {
                var type,children=[];
                var stats = fs.statSync(file);
                if (stat && stat.isDirectory()) {
                    type = 'dir';
                }
                else {
                    type = 'file';
                }
                results.push({file:file,type:type,details:util.inspect(stats),fileName:fileName,dir:dir});
                i++;
                if (!--pending) done(null, results);
            });
        });

    });
}



io.sockets.on('connection', function (socket) {
 /*   setInterval(function(){
        socket.emit('news', { hello: new Date()
        });
    },1000);*/


    socket.on('send:files', function (data) {
        dirParser(data.dir, function(err, results) {
            if (err) throw err;
            socket.emit('dirResults', results);
        });
    });

    socket.on('compress',function(data){
        var f = [];
        for (var a in data.files){
            f.push(data.files[a].file);
        }
        new compressor.minify({
            type: 'gcc',
            fileIn: f,
            fileOut: data.fileOut,
            callback: function(err){
                socket.emit('fileReady');
            }
        });
    });

});


