module.exports = function(){
    var express = require('express');
    var router = express.Router();

 /*Function getDailydWorkouts returns the following selected workouts*/
    function getDailyWorkouts(res, mysql, context, userID, complete){
        var sql = "SELECT Workouts.workoutName, Workouts.bodyPart, Workouts.linkToVideo, UserWorkouts.sets, UserWorkouts.reps FROM UserWorkouts, Workouts WHERE userID=? and UserWorkouts.completed=`N`";
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
    
 /*Function getCompletedWorkouts returns the following selected workouts*/
    function getCompletedWorkouts(res, mysql, context, userID, complete){
        var sql = "SELECT Workouts.workoutName, Workouts.bodyPart, Workouts.linkToVideo, UserWorkouts.sets, UserWorkouts.reps FROM UserWorkouts, Workouts WHERE userID=? and UserWorkouts.completed=`Y`";
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
        context.jsscripts = ["completeworkout.js"];
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

    /*Router URI for "complete a workout" functionality goes here, updates completed attribute in workouts to 'y'*/

    router.put('/:userWorkoutID', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "UPDATE UserWorkouts SET completed=`Y` WHERE userWorkoutID=?";
        var inserts = [req.params.userWorkoutID];
        sql = mysql.pool.query(sql,inserts,function(error, results, fields){
            if(error){
                res.write(JSON.stringify(error));
                res.end();
            }else{
                res.status(200);
                res.end();
            }
        });
    });