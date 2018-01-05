<%--
  Created by IntelliJ IDEA.
  User: ARAIN
  Date: 2017/11/22
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<form action="http://localhost:8081/upload/User/SelUser.do" class="default-preloader" role="form">
    <div class="form-group">
        <label class="col-sm-1 control-label" > id :</label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="id">
        </div>
    </div>
    <button type="submit" value="Submit" class="btn btn-default btn-md " >submit</button>
</form>
<script>
    window.onload=function()
    {  function ajaxTest() {
        $.ajax({
            type: 'POST',
            url: 'http://localhost:8081/upload/User/selAll.do',
            contentType: "application/json; charset=utf-8",
            data: ajaxData,
            dataType: 'json',
            error: function (data) {
                alert("请求失败，网络异常")
                console.log(data);
            },
            success: function (data) {
                callback(data);
            }
        })
    }
    }
</script>
<%--
<p>增加用户</p>
<form action="http://localhost:8081/upload/User/insertUser.do" class="default-preloader" role="form">
    <div class="form-group">
        <label class="col-sm-1 control-label" > id :</label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="id">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-1 control-label"> name : </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="name">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-1 control-label"> address : </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="address">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-1 control-label"> birthday : </label>
        <div class="col-sm-1">
            <input type="date" class="form-control" name="birthday">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-1 control-label"> sex : </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="sex">
        </div>
    </div>

    <button type="submit" value="Submit" class="btn btn-default btn-lg " >submit</button>
</form>

<P>查询用户</P>


<p>更新用户</p>
<form action="http://localhost:8081/upload/User/updateUser.do" class="default-preloader" role="form">
    <div class="form-group">
        <label class="col-sm-1 control-label" > id :</label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="id">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-1 control-label"> name : </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="name">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-1 control-label"> address : </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="address">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-1 control-label"> birthday : </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="birthday">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-1 control-label"> sex : </label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="sex">
        </div>
    </div>

    <button type="submit" value="Submit" class="btn btn-default btn-lg " >submit</button>
</form>

<p>删除用户</p>
<form action="http://localhost:8081/upload/User/deleteUser.do" class="default-preloader" role="form">
    <div class="form-group">
        <label class="col-sm-1 control-label" > id :</label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="id">
        </div>
    </div>
    <button type="submit" value="Submit" class="btn btn-default btn-lg " >submit</button>
</form>--%>
</body>
</html>
