
var express = require('express');
var router = express.Router();
var multer  = require('multer');
var upload = multer({ dest: 'public/uploads/' });
const models = require('../models');
const Sequelize = require('sequelize');

var paginate = require('express-paginate');
const Op = Sequelize.Op;
const { check, validationResult } = require('express-validator/check');

/* GET home page courses/. */
router.get('/', function(req, res, next) {
  models.Course.findAndCountAll({limit:req.query.limit,offset:req.skip}).then(results=>{
    const itemCount = results.count;
    const pageCount = Math.ceil(results.count / req.query.limit); 
    res.render('courses/main', {
              courses:results.rows,
              title : "course index",
              pageCount,
              itemCount,
              pages:paginate.getArrayPages(req)(3, pageCount, req.query.page)

            });
        });
});

router.get('/new', function(req, res, next) {
  res.render('courses/create', { title: 'creating new course' });
});

router.get('/edit/:id', function(req, res, next) {
  let id=req.params.id;
  models.Course.findById(id).then((data)=>{
    res.render('courses/update', { 
      course: data,
      title: 'course update' 
    });
  });
});

router.get('/view/:id', function(req, res, next) {
  let id=req.params.id;
  models.Course.findById(id).then((data)=>{
    res.render('courses/detail', { 
      course: data,
      title: 'course detail' 
    });
  });
});

router.post('/create',upload.single('pimg'),
[
check('title','title need min 5 char').isLength({ min: 5 }),
check('desr','description must have 5 char long').isLength({ min: 5 }),
check('price','price must int').isInt()

],

function(req, res, next) {
  let formData = req.body;
  console.log(req.body);
  console.log(req.body.subject);
  let pimg = req.file;
  console.log(pimg);
  if(pimg){
    formData.pimg = pimg.filename;
  }
  if(req.body.start_date==''){
    formData.start_date=null;
  }
  const errors = validationResult(req);
  console.log(errors.array());
  if (!errors.isEmpty()) {
    req.flash("errors",errors.array());
    return res.redirect("/courses/new"); //redirect to GET /submit
  }
  //Promise way
  models.Course.create(formData)
  .then( (package,err) => {
     req.flash("success","Course create success");
     res.redirect("/courses");
  });

});
router.post('/update/:id', upload.single('pimg'), function(req, res, next) {
  let id = req.params.id;
  let formData = req.body;
  let photo = req.file;
  if(photo){
    formData.pimg = photo.filename;
  }
  if(req.body.start_date==''){
    formData.start_date=null;
  }
  //Promise way
  models.Course.update(formData, {where:{id:id}}).then((data,err)=>{
        req.flash("success","Course update success");
        res.redirect("/courses");
  });
});

router.get("/delete/:id", function(req, res, next){
  let id = req.params.id;
  models.Course.destroy({where:{id:id}}).then(data=>{
     res.redirect("/courses");
  });
});

module.exports = router;
