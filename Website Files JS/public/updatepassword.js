function updatePassword(user_id){
    $.ajax({
        url: '/users/' + user_id,
        type: 'PUT',
        data: $('#update-password').serialize(),
        success: function(result){
            window.location.replace("./");
        }
    })
};