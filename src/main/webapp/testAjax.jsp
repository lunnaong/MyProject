<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.bootcss.com/vue/2.2.2/vue.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <%-- <script src="/../System/js/json2.js"></script>--%>
    <script>
        window.onload = function loadAllUser()
        {
            var xmlhttp;
            if (window.XMLHttpRequest)
            {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp=new XMLHttpRequest();
            }
            else
            {// code for IE6, IE5
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
                }
            }
            xmlhttp.open("GET","http://localhost:8081/upload/User/selAll.do",true);
            xmlhttp.send();
        }
    </script>
    <script>
         function loadUser()
       {
           var id2 = $("#id").val() ;
           var xmlhttp;
           if (window.XMLHttpRequest)
           {
               //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
               xmlhttp=new XMLHttpRequest();
           }
           else
           {
               // IE6, IE5 浏览器执行代码
               xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
           }
           xmlhttp.onreadystatechange=function()
           {
               if (xmlhttp.readyState==4 && xmlhttp.status==200)
               {
                   document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
               }
           }
           xmlhttp.open("GET","http://localhost:8081/upload/User/SelUser.do?id="+id2,true);
           xmlhttp.send();
       }

    </script>

</head>
<body>
<form name="myform">
<div class="form-group" style="margin:10px 20px;padding:20px; height:80px ;border:1px solid #00ffff">
        <label class="col-sm-1 control-label" > id :</label>
        <div class="col-sm-1">
            <input type="text" class="form-control" id="id">
        </div>
        <button type="button" onclick="loadUser()" class="btn btn-default btn-md " >查找</button>
    </div>
</form>
<div id="myDiv" tyle="margin:100px 200px;padding:20px; border:1px solid #00ffff"><h2></h2></div>

</body>
</html>