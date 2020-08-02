module.exports = function(){
    var express = require('express');
    var router = express.Router();


    function getUser(res, mysql, context, student_id, complete){
        var sql = "SELECT userID, userName, email, gender, age FROM Users WHERE userID=?";
        var inserts = [student_id];
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
        getUser(res, mysql, context, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('account', context);
            }
        }
    });


    /* Display one user for the specific purpose of updating that user */

    router.get('/:userID', function(req, res){
        callbackCount = 0;
        var context = {};
        context.jsscripts = ["selectedgender.js", "updateuser.js"];
        var mysql = req.app.get('mysql');
        getUser(res, mysql, context, req.params.student_id, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('update-account', context);
            }

        }
    });

    
    /* The URI that update data is sent to in order to update a student */

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
