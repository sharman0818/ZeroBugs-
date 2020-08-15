module.exports = function(){
    var express = require('express');
    var router = express.Router();


 /*Function getPosts returns all posts for loading posts page*/
    function getPosts(res, mysql, context, complete){
        var sql = "SELECT postID, postUserID, postText, likes, userName FROM Posts, Users WHERE postUserID=userID";
        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.posts = results;
            complete();
        });
    }

 /*Function getComments returns all comments for a given post for loading comments page*/
    function getComments(res, mysql, context, commentPostID, complete){
        var sql = "SELECT commentText, commentUserID, commentPostID, userName FROM Comments, Users WHERE commentUserID=userID and commentPostID=?";
        var inserts = [commentPostID];
        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.comments = results;
            complete();
        });
    }

 /*Function getPost returns one post for loading comments page*/
    function getPost(res, mysql, context, postID, complete){
        var sql = "SELECT postID, postUserID, postText, likes, userName FROM Posts, Users WHERE postUserID=userID and postID=?";
        var inserts = [postID];
        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.post = results[0];
            complete();
        });
    }

    /*Requires web based javascript to delete users with AJAX*/

    router.get('/', function(req, res){
    	var callbackCount = 0;
        var context = {};
        var mysql = req.app.get('mysql');
        getPosts(res, mysql, context, req.params.userID, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('posts', context);
            }
        }
    });


    /* Adds a post, redirects to the posts page after adding */

    router.post('/', function(req, res){
        console.log(req.body)
        var mysql = req.app.get('mysql');
        var sql = "INSERT INTO Posts (postText, postUserID) VALUES (?,?)";
        var inserts = [req.body.postText, req.body.postUserID];
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
    
    /* Display one post's comments */

    router.get('/:postID', function(req, res){
        callbackCount = 0;
        var context = {};
        var mysql = req.app.get('mysql');
        getComments(res, mysql, context, req.params.postID, complete);
        getPost(res, mysql, context, req.params.postID, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('post-comments', context);
            }

        }
    });

    return router;

}();