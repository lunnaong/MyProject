<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container col-lg-12">
    <div style="margin:100px 200px;padding:20px; border:1px solid #00ffff">
        <form id="form1" action="/" method="post" role="form">
            <div class="form-group">
                <input type="text" name="name" class="text-primary form-control" placeholder="NAME" />
            </div>
            <div class="form-group">
                <input type="password" name="pwd" class="text-primary form-control" placeholder="PASSWORD" />
            </div>
            <div class="form-group">
                <input type="text" name="email" class="text-primary form-control" placeholder="EMAIL" />
            </div>
            <div class="form-inline col-lg-offset-4">
                <input type="button" class="btn btn-primary" value="Login" style="margin:20px" />
                <input type="reset" class="btn btn-warning" value="Reset" />
            </div>
        </form>
    </div>
    <div id="tip"></div>
</div>


<script type="text/javascript">
    $(function () {
        $("#form1 :input[type=button]").click(function () {
            $.getJSON("../../test/user.json", function (data) {
                $("#tip").empty();
                var strHTML = "";
                $.each(data, function (index,Info) {
                    strHTML += "name:" + Info["name"] + "<br>";
                    strHTML += "sex:" + Info["sex"] + "<br>";
                    strHTML += "email:" + Info["email"] + "<hr>";
                })
                $("#tip").html(strHTML);
            })
        })
    })
</script>

</body>
</html>