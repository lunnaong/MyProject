<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Bootstrap 实例 - 输入框</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<form class="form-horizontal" role="form">
    <div class="form-group">
        <label class="col-sm-2 control-label">Email</label>
        <div class="col-sm-10">
            <p class="form-control-static">email@example.com</p>
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword" placeholder="请输入密码">
        </div>
    </div>
    <p>
        <button type="button" class="btn btn-default btn-lg ">默认按钮</button>
        <button type="button" class="btn btn-default btn-lg active">激活按钮</button>
    </p>
    <p>
        <button type="button" class="btn btn-primary btn-lg ">原始按钮</button>
        <button type="button" class="btn btn-primary btn-lg active">激活的原始按钮</button>
    </p>
</form>

</body>
</html>
