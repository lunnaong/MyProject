<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%--<form action="http://localhost:8081/upload/User/SelProd.do">
    ProdId :
    <input type="text" name="id">
    <button type="submit" value="Submit">submit</button>
</form>

<form action="http://localhost:8081/upload/User/SelSale.do">
    SaleId :
    <input type="text" name="UserId">
    <button type="submit" value="Submit">submit</button>
</form>--%>

<p>查询某个客户所购买的商品 范围：1000-3012</p>
<form action="http://localhost:8081/upload/get/getCustomerList">
    CustomerId :
    <input type="text" name="id">
    <button type="submit" value="Submit">submit</button>
</form>
<p>查询某个商品客户数、销售额、利润和所有购买此商品的用户信息 范围：2000-3000</p>
<form action="http://localhost:8081/upload/get/getProductList">
    ProductId :
    <input type="text" name="id">
    <button type="submit" value="Submit">submit</button>
</form>
</br>
</br>
<form action="http://localhost:8081/upload/get/getTopProfit">
    <button type="submit" value="Submit">
        利润前十柱图</button>
</form>


</body>
</html>
