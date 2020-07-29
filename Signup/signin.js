<script>
    function loginvalidation(){
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;

        var valid = true;

        if(email == ""){
        	   valid = false;
            document.getElementById('email_error').innerHTML = "required.";
        }

        if(password == ""){
        	   valid = false;
            document.getElementById('password_error').innerHTML = "required.";
        }
        return valid;
    }
    </script>