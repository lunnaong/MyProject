<%--
  Created by IntelliJ IDEA.
  User: ARAIN
  Date: 2017/11/22
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
</head>
<body>
<p>insert user information</p>

<table data-toggle="table" data-striped="true">
<tr  border="1" bgcolor="#faebd7">
    <th>id</th>
    <th>name</th>
    <th>address </th>
    <th>birthday</th>
    <th>sex</th>
</tr>

    <tr  bgcolor="#f5f5dc" border="1">
        <td>${ur.id}</td>
        <td>${ur.name}</td>
        <td>${ur.address}</td>
        <td>${ur.birthday}</td>
        <td>${ur.sex}</td>
    </tr>
</table>
</body>
</html>
