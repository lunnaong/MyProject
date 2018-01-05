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
    <title>productList</title>
    <style>
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


<p >商品购买信息</p>
<table >
    <tr  border="1" bgcolor="#ffe4c4">
        <th>购买总数（${unit}）</th>
        <th>销售总额(￥)</th>
        <th>利润(￥)</th>
    </tr>
    <tr  border="1" bgcolor="#f5f5dc">
        <td>${profit.customerNum}</td>
        <td>${profit.saleCount}</td>
        <td>${profit.profit}</td>
    </tr>
</table>

<p >购买此商品的用户信息</p>

<table data-toggle="table" data-striped="true">
    <tr  border="1" bgcolor="#faebd7">
        <th>#</th>
        <th>name</th>
        <th>prices  </th>
        <th>number</th>
        <th>SaleDate</th>
    </tr>

    <c:forEach items="${requestScope.list}" var="BuyList" varStatus="id">


        <tr  bgcolor="#f5f5dc" border="1">
            <td>${id.index}</td>
            <td>${BuyList.name}</td>
            <td>${BuyList.prices}  </td>
            <td>${BuyList.number}</td>
            <td>${BuyList.saleDate}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
