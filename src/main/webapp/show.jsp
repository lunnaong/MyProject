<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
    <script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>

</head>

<body>
<div data-role="page">
    <div data-role="header">
        <h1>欢迎访问我的主页</h1>
    </div>

    <div data-role="main" class="ui-content">
        <a href="#myPopup" data-rel="popup" class="ui-btn ui-btn-inline ui-corner-all">显示弹窗</a>

        <div data-role="popup" id="myPopup">
            <form action="http://localhost:8081/upload/User/deleteUser.do" class="default-preloader" role="form">
                <div class="form-group">
                    <label class="col-sm-1 control-label" > id :</label>
                    <div class="col-sm-1">
                        <input type="text" class="form-control" name="id">
                    </div>
                </div>
                <button type="submit" value="Submit" class="btn btn-default btn-lg " >submit</button>
            </form>

        </div>
    </div>

    <div data-role="footer">
        <h1>底部文本</h1>
    </div>
</div>
</body>
</html>