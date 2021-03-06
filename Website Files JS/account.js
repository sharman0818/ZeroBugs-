module.exports = function(){
    var express = require('express');
    var router = express.Router();


    function getUser(res, mysql, context, userID, complete){
        var sql = "SELECT userID, userName, email, gender, age FROM Users WHERE userID=?";
        var inserts = [userID];
        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.user = results[0];
            complete();
        });
    }

    /*Display user info. Requires web based javascript to delete users with AJAX*/

    router.get('/', function(req, res){
    	var callbackCount = 0;
        var context = {};
        var mysql = req.app.get('mysql');
        getUser(res, mysql, context, req.params.userID, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('account', context);
            }
        }
    });


    router.get('/:userID', function(req, res){
        callbackCount = 0;
        var context = {};
        context.jsscripts = ["selectedgender.js", "updateuser.js"];
        var mysql = req.app.get('mysql');
        getUser(res, mysql, context, req.params.userID, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('update-account', context);
            }

        }
    });

  /*router put with userID*/

    router.put('/userID', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "UPDATE Users SET email=?, gender=?, age=?, password=? WHERE userID=?";
        if (req.body.major_id == "NULL"){
            var major_id = null;
        }else {major_id = req.body.major_id}
        var inserts = [req.body.email, req.body.gender, req.body.age, req.body.passwordd, req.params.userID];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.status(200);
                res.end();
            }
        })
    })

    return router;

}();
