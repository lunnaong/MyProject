<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<!-- 输出Map -->
<div id="1" style="color: #F00" >id :${requestScope.user.getId()}</div>
<div id="2" style="color: #F00"> name : ${requestScope.user.getName()}</div>
<div id="3" style="color: #F00">address : ${requestScope.user.getAddress()}</div>
<div id="4" style="color: #F00"> birthday: ${requestScope.user.getBirthday()}</div>
<div id="5" style="color: #F00">sex : ${requestScope.user.getSex()}</div>

</body>
</html>