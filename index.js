var restify = require("restify");
var server = restify.createServer();
var mysql = require("mysql");

server.use(function crossOrigin(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  return next();
});

server.use(restify.plugins.queryParser());

var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "course_comment",
});

connection.connect();

var apiPath = "/api";

var port = 8081

server.listen(port, function () {
  console.log(`Course-comment Started ${port}`);
});

server.get('/*/*', restify.plugins.serveStatic({
  'directory': __dirname,
  'default': '/index.html'
}));

server.get(apiPath + "/getAllCourse", function (req, res, next) {
  connection.query("SELECT * FROM course", function (error, results, fields) {
    res.send(results);
  });
});

server.get(apiPath + "/getClusterCourse", function (req, res, next) {
  connection.query(
    `SELECT * FROM course WHERE courseCluster = '${req.query.cluster}' `,
    function (error, results, fields) {
      res.send(results);
    }
  );
});

server.get(apiPath + "/getCommentByCourse", function (req, res, next) {
  connection.query(
    `SELECT * FROM comment WHERE courseCode = '${req.query.courseCode}' ORDER BY postDate DESC`,
    function (error, results, fields) {
      if (error) throw error;
      res.send(results);
    }
  );
});

server.get(apiPath + "/getCourseDataByCourse", function (req, res, next) {
  connection.query(
    `SELECT * FROM course WHERE courseCode = '${req.query.courseCode}'`,
    function (error, results, fields) {
      if (error) throw error;
      res.send(results);
    }
  );
});

server.get(apiPath + "/getMostCommentCourse", function (req, res, next) {
  connection.query(
    `SELECT * FROM course ORDER BY commentAmount DESC LIMIT 5 `,
    function (error, results, fields) {
      if (error) throw error;
      res.send(results);
    }
  );
});

server.get(apiPath + "/getNewestComment", function (req, res, next) {
  connection.query(
    `SELECT * FROM comment ORDER BY postDate DESC LIMIT 5`,
    function (error, results, fields) {
      if (error) throw error;
      res.send(results);
    }
  );
});

server.get(apiPath + "/submitComment", function (req, res, next) {
  var date = new Date();
  var nowDate = `${date.getFullYear()}-${date.getMonth()}-${date.getDate()}`;
  connection.query(
    `INSERT INTO comment (commentNumber, courseCode, content, postDate, year, Semester, Grade, rating) VALUES (0, '${req.query.courseCode}', '${req.query.content}', '${nowDate}', '${req.query.year}', '${req.query.sem}', '${req.query.grade}', '${req.query.rating}')`,
    function (error, results, fields) {
      if (error) throw error;
      res.send(results);
    }
  )
  
  connection.query(
    `UPDATE course SET commentAmount = commentAmount + 1 WHERE courseCode = '${req.query.courseCode}'`,
    function (error, results, fields) {
      if (error) throw error;
    })
    
});
