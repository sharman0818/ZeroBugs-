function completeWorkout(userWorkoutID){
    $.ajax({
        url: '/my-workouts/' + userWorkoutID,
        type: 'PUT',
        data: $('#update-my-workouts').serialize(),
        success: function(result){
            window.location.replace("./");
        }
    })
};