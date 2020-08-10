module.exports = function(){
    var express = require('express');
    var router = express.Router();


    function getDailyWorkouts(res, mysql, context, userID, complete){
        var sql = "SELECT workoutName, bodyPart, linkToVideo, sets, reps FROM DailyWorkouts WHERE userID=?";
        var inserts = [userID];
        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.dailyWorkouts = results;
            complete();
        });
    }
    
 /*Function getCompletedWorkouts od the following selected workouts*/
    function getCompletedWorkouts(res, mysql, context, userID, complete){
        var sql = "SELECT workoutName, bodyPart, sets, reps FROM DailyWorkouts WHERE userID=?";
        var inserts = [userID];
        mysql.pool.query(sql, inserts, function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }
            context.completedWorkouts = results;
            complete();
        });
    }

    /*Requires web based javascript to delete users with AJAX*/

    router.get('/', function(req, res){
    	var callbackCount = 0;
        var context = {};
        var mysql = req.app.get('mysql');
        getDailyWorkouts(res, mysql, context, req.params.userID, complete);
        getCompletedWorkouts(res, mysql, context, req.params.userID, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 2){
                res.render('my-workouts', context);
            }
        }
    });

    /*Router URI for "complete a workout" functionality goes here, delete from dailyWorkouts and insert into Completed workouts*/
