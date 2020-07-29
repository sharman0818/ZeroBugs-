var express = require('express');
var app = express();

var exphbs = require('express-handlebars');
app.engine('handlebars', exphbs());
app.set('view engine', 'handlebars');

app.use(express.urlencoded({ extended: false} )));
app.use(express.json());
app.set('port', 3330);
  
app.get('/', (req,res) =>{
  console.log(req.query);
  console.log('hello world');
  res.send('how are you');
});

app.get('/', function(req,res){
  var qParams = []
  for (var p in req.query){
    qParams.push({'name' + p, 'value':req.query[p]});
  }
  var context = {};
  context.dataList = qParams;
  res.render('get', context);
});

app.post('/', function(req,res){
    var qParams = [];
  for (var p in req.body){
    qParams.push({'name':p,'value':req.body[p]})
  }
  var context = {};
  context.dataList = qParams;
  res.render('post', context);
});


app.use(function(req,res){
  res.status(404);
  res.render('404 - Not Found');
});

app.use(function(err, req, res, next){
  console.error(err.stack);
  res.status(500);
  res.render('500 - Server Error');
});

app.listen(app.get('port'), function(){
  console.log('Express started on port ' + app.get('port') + '; press Ctrl-C to terminate.');
});