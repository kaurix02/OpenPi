<%--
  Created by IntelliJ IDEA.
  User: alandu
  Date: 8.03.16
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Hello, ${user}</title>
    <script>
        window.fbAsyncInit = function() {
            FB.init({
                appId      : '1761793507390965',
                xfbml      : true,
                version    : 'v2.5'
            });

            // ADD ADDITIONAL FACEBOOK CODE HERE
        };

        (function(d, s, id){
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {return;}
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    </script>
</head>
<body>
<p>${test}</p>
</body>
</html>
