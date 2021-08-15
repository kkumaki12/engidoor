var express = require('express');
var path = require('path');
var serveStatic = require('serve-static');
app = express();
app.use(serveStatic(__dirname + "/dist"));
var port = process.env.VUE_APP_API_BASE_URL || 5000;
app.listen(port);
console.log('server started '+ port);
