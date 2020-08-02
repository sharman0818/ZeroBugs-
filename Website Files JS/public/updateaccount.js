function updateUser(userID){
    $.ajax({
        url: '/account/' + userID,
        type: 'PUT',
        data: $('#update-user').serialize(),
        success: function(result){
            window.location.replace("./");
        }
    })
};