<%--
  Created by IntelliJ IDEA.
  User: ARAIN
  Date: 2017/11/15
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>User</title>
    <style>
        #content{
            height:500px;
            padding: 40px;
            margin:0;
        }
        table, td, th
        {
            border:1px solid black;
            border-color: darkcyan;
        }
        td
        {
            padding:15px ;
            border-color: darkcyan;
        }
        p{color:darkcyan;
            font-family: sans-serif;}
        body{background-color: bisque}
    </style>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
</head>
<body>


<div style="margin:10px 20px;padding:20px; border:1px solid #00ffff">
    <button>新增</button>
    <button>修改</button>
    <button>删除</button>
</div>
<div id="content" class="table-responsive">
<table class="table">
    <tr >
        <th>id</th>
        <th>name</th>
        <th>address</th>
        <th>birthday</th>
        <th>sex</th>
    </tr>

    <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.address}</td>
        <td>${user.birthday}</td>
        <td>${user.sex}</td>
    </tr>

</table>
</div>

</body>
</html>
