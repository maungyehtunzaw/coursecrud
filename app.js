require('dotenv').config();
var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var session = require('express-session');
var flash = require('connect-flash-plus');
var paginate = require('express-paginate');
var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var coursesRouter= require('./routes/courses');
var expressLayouts = require('express-ejs-layouts');
var app = express();
app.use(paginate.middleware(4,50));
// view engine setup
// app.engine('html', require('ejs').__express);
// app.set('views', __dirname+'/views/');
// app.set('view engine', 'ejs');

//app.set('views', path.join(__dirname, 'views'));
app.set('views', './views');
app.set('view engine', 'ejs');
app.set('layout extractScripts', true)
app.set('layout extractStyles', true)
app.use(session({
  secret: 'SomethingThatSomebodyShouldNotKnow',
  cookie: { maxAge: 60000 },
  saveUninitialized:true
}));
app.use(flash());
app.use(expressLayouts);

app.use(logger('dev'));

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));



app.use(function( req, res, next){
  res.locals.appname = process.env.APP_NAME;
  //console.log(res.locals.appname);
 // console.log(req.flash("errors"));
  res.locals.errors=req.flash("errors");
  
  res.locals.success=req.flash("success");
  next();
});
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/courses',coursesRouter);


// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
