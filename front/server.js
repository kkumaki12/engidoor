var express = require('express');
var history = require('connect-history-api-fallback');

var app = express();
app.use(history());
var path = require('path');
var serveStatic = require('serve-static');

app.use(serveStatic(__dirname + "/dist"));
var port = process.env.VUE_APP_API_BASE_URL || 5000;
app.listen(port);
console.log('server started '+ port);

