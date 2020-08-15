module.exports = function(){
    var express = require('express');
    var router = express.Router();




    /* Adds a comment, redirects to the posts page after adding */

    router.post('/', function(req, res){
        console.log(req.body)
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO Comments (commentText, commentUserID, commentPostID) VALUES (?,?, ?)";
        var inserts = [req.body.commentText, req.body.commentUserID, req.body.commentPostID];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                console.log(JSON.stringify(error))
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.redirect('/posts');
            }
        });
    });

    return router;

}();
