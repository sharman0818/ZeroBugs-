    /* Get current user info and js function for user updating */

    router.get('/:user_id', function(req, res){
        callbackCount = 0;
        var context = {};
        context.jsscripts = ["updatepassword.js"];
        var mysql = req.app.get('mysql');
        getDorm(res, mysql, context, req.params.dorm_id, complete);
        function complete(){
            callbackCount++;
            if(callbackCount >= 1){
                res.render('update-password', context);
            }

        }
    });
    
    /* The URI that update data is sent to in order to update a user password */

    router.put('/:user_id', function(req, res){
        var mysql = req.app.get('mysql');
        var sql = "UPDATE Users SET password=?, security-question=?, security-answer=? WHERE user_id=?";
        var inserts = [req.body.password, req.body.security-question, req.body.security-answer, req.params.user_id];
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

    return router;
}();