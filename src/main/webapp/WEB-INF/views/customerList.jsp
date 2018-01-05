<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>customerList</title>
   <%-- <style>
        table, td, th
        {
            border:1px solid black;
            border-color: lightpink;
        }
        td
        {
            padding:15px ;
            border-color: lightpink;
        }
        p{color:darkcyan;
            font-family: sans-serif;}
        body{background-color: lightpink}
    </style>--%>
    <!-- Latest compiled and minified CSS -->
  <%--  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<%--    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>

    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
</head>
<body>
<div class="table-responsive">
    <table class="table" >
        <tr >
            <th>#</th>
            <th>商品名称</th>
            <th>商品种类</th>
        </tr>
        <c:forEach items="${requestScope.userP}" var="ele" varStatus="id">
        <tr >
            <td>${id.index}</td>
            <td> ${ele.bookName}</td>
            <td>${ele.species}</td>
        </tr>
        </c:forEach>
    </table>

</div>

</body>
</html>
