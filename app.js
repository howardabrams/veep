var fs = require("fs");
var host = "127.0.0.1";
var port = 8085;
var express = require("express");

var app = express();
app.use(app.router); //use both root and other routes below
app.use(express.static(__dirname + "/site"));

app.get("/", function(request, response) {
  response.redirect('/index.html');
});

console.log("Starting simple web server at http://localhost:"+port);
app.listen(port, host);
