<%--
  Created by IntelliJ IDEA.
  User: ARAIN
  Date: 2017/11/27
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>jqgrid</title>
    <link rel="stylesheet" href="/upload/System/css/ui.jqgrid.css" type="text/css">
    <link rel="stylesheet" href="/upload/System/css/jquery-ui.css">
    <link rel="stylesheet" href="/upload/System/css/jquery-ui-1.8.20.custom.css">
    <link rel="stylesheet" href="/upload/System/css/jquery-ui.theme.css">

    <script src="/upload/System/js/jquery-1.11.0.min.js"></script>
    <script src="/upload/System/js/grid.locale-en.js"></script>
    <script src="/upload/System/js/jquery.jqGrid.min.js"></script>
    <script src="/upload/System/js/jquery.jqGrid.src.js"></script>
    <script src="/upload/System/js/jquery-ui.js"></script>


<script type="text/javascript">
    $(function(){
        //页面加载完成之后执行
        pageInit();
    });
    function pageInit(){

        /*获取当前选中行的id*/
        function getid(){
            var rowId=$("#rightGrid9").jqGrid("getGridParam","selrow");
            var rowData = $("#gridTable").jqGrid('getRowData',rowId);
            var id = rowData.id;
            return id;
        };
      /*  $('#editgrid').jqGrid('navGrid', "#JqGrid-pager", {
            search: true, // show search button on the toolbar
            add: true,
            edit: true,
            del: true,
            refresh: true
        });
        //模糊查询
        var timer;
        $("#search_input").on("keyup", function () {
            var self = this;
            if (timer) { clearTimeout(timer); }
            timer = setTimeout(function () {
                //timer = null;
                $("#editgrid").jqGrid('filterInput', self.value);
            }, 0);
        });*/
        jQuery("#editgrid").jqGrid(
            {
                url : 'http://localhost:8081/upload/User/selAll.do',
                datatype : "json",
                colNames : [ 'id', 'name', 'address', 'birthday', 'sex'  ],
                colModel : [ //jqGrid每一列的配置信息。包括名字，索引，宽度,对齐方式.....
                    {name : 'id',index : 'id',width : 200},
                    {name : 'name',index : 'name',width : 200},
                    {name : 'address',index : 'address',width : 200,align : "right"},
                    {name : 'birthday',index : 'birthday',width : 200,align : "right"},
                    {name : 'sex',index : 'sex',width : 200,align : "right"},
                ],
                rowNum : 10,
                height :300,
                rowList : [ 10, 20, 30 ],
                pager : '#pager2',
                sortname : 'id',
                viewrecords : true,
                sortorder : "desc",
                caption : "用户信息",
                editurl :"http://localhost:8081/upload/User/SelUser.do?id="+getid()
            });
        $("#bedata").click(function() {
            var gr = jQuery("#editgrid").jqGrid('getGridParam', 'selrow');
            if (gr != null)
                jQuery("#editgrid").jqGrid('editGridRow', gr, {
                    height : 300,
                    reloadAfterSubmit : false
                });
            else
                alert("Please Select Row");
        });
    }

</script>
    <script type="text/javascript">
        $(document).ready(function () {
            //添加
            $("#btn_add").click(function () {
                //var model = jQuery("#JqGrid-table").jqGrid('getRowData', EmployeeID);
                $("#AddEmployeeInfo").dialog({
                    height: 400,
                    width: 500,
                    resizable: false,
                    modal: true,  //这里就是控制弹出为模态
                    buttons: {
                        "确定": function () {
                            //alert("在这里对数据进行修改！");
                            //$(this).dialog("close");
                            //var birthdayTime ="2017/9/28";
                            var id = $("#ADD_id").val();
                            var name = $("#ADD_name").val();
                            var address = $("#ADD_address").val();
                            var birthday = $("#ADD_birthday").val();
                            var sex = $("#ADD_sex").val();
                            /* var employeeEmail = $("#ADD_EmployeeEmail").val();
                             var employeeJiGuan = $("#ADD_EmployeeJiGuan").val();
                             var employeeAddress = $("#ADD_EmployeeAddress").val();
                             var employeePosition = $("#ADD_EmployeePosition").val();
                             var employeeBirthday = $("#ADD_EmployeeBirthday").val();*/
                            $.ajax({
                                url: "http://localhost:8081/upload/User/insertUser.do",
                                type: "GET",
                                data: {
                                    id: id, name: name, address: address,
                                    address: address, birthday: birthday, sex: sex
                                },
                                success: function (message) {
                                    $("#JqGrid-table").jqGrid("setGridParam",
                                        {
                                            url: "http://localhost:8081/upload/User/insertUser.do",
                                            page: 1,
                                            datatype: "json"
                                        }).trigger("reloadGrid");
                                    alert('添加数据成功');

                                },
                                error: function (message) {
                                    alert('error!');
                                }
                            });
                        },
                        "取消": function () {
                            $(this).dialog("close");
                        }
                    }
                });
            });
            //删除
            $("#btn_del").click(function () {
                var employeeID = $('#JqGrid-table').jqGrid('getGridParam', 'selrow');//获取行id
                $.ajax({
                    url: "/JqGridDemo/JqGridCRUD/EmployeeInfoToDel",
                    type: "post",
                    data: { EmployeeID: employeeID },
                    success: function (message) {
                        $("#JqGrid-table").jqGrid("setGridParam",
                            {
                                url: "/JqGridDemo/JqGridCRUD/EmployeeInfoToLoad",
                                page: 1,
                                datatype: "json"
                            }).trigger("reloadGrid");
                        alert('成功删除一条数据');
                    },
                    error: function (message) {
                        alert('error!');
                    }
                });
            });
            //编辑
            $("#btn_edit").click(function () {
                //var ids = jQuery("#JqGrid-table").jqGrid('getDataIDs');//返回grid里所有数据的id
                var id = jQuery("#JqGrid-table").jqGrid('getGridParam', 'selarrrow');
                var EmployeeInfoModel = jQuery("#JqGrid-table").jqGrid('getRowData', id);
                $("#Modify_EmployeeID").val(EmployeeInfoModel.EmployeeID);
                $("#Modify_EmployeeName").val(EmployeeInfoModel.EmployeeName);
                $("#Modify_EmployeeMajor").val(EmployeeInfoModel.EmployeeMajor);
                $("#Modify_EmployeeDepartment").val(EmployeeInfoModel.EmployeeDepartment);
                $("#Modify_EmployeeTel").val(EmployeeInfoModel.EmployeeTel);
                $("#Modify_EmployeeEmail").val(EmployeeInfoModel.EmployeeEmail);
                $("#Modify_EmployeeJiGuan").val(EmployeeInfoModel.EmployeeJiGuan);
                $("#Modify_EmployeeAddress").val(EmployeeInfoModel.EmployeeAddress);
                $("#Modify_EmployeePosition").val(EmployeeInfoModel.EmployeePosition);
                $("#Modify_EmployeeBirthday").val(EmployeeInfoModel.EmployeeBirthday);
                $("#ModifyEmployeeInfo").dialog({
                    height: 400,
                    width: 500,
                    resizable: false,
                    modal: true,  //这里就是控制弹出为模态
                    buttons: {
                        "确定": function () {
                            //alert("在这里对数据进行修改！");
                            //$(this).dialog("close");
                            //var birthdayTime ="2017/9/28";
                            //$("#Modify_EmployeeEmployeeName").value = 'ddd';
                            //提交前的初始值
                            var employeeID = $("#Modify_EmployeeID").val();
                            var employeeName = $("#Modify_EmployeeName").val();
                            var employeeMajor = $("#Modify_EmployeeMajor").val();
                            var employeeDepartment = $("#Modify_EmployeeDepartment").val();
                            var employeeTel = $("#Modify_EmployeeTel").val();
                            var employeeEmail = $("#Modify_EmployeeEmail").val();
                            var employeeJiGuan = $("#Modify_EmployeeJiGuan").val();
                            var employeeAddress = $("#Modify_EmployeeAddress").val();
                            var employeePosition = $("#Modify_EmployeePosition").val();
                            var employeeBirthday = $("#Modify_EmployeeBirthday").val();
                            $.ajax({
                                url: "/JqGridDemo/JqGridCRUD/EmployeeInfoToUpdate",
                                type: "GET",
                                data: {
                                    EmployeeID: employeeID, EmployeeName: employeeName, EmployeeMajor: employeeMajor,
                                    EmployeeDepartment: employeeDepartment, EmployeeTel: employeeTel, EmployeeEmail: employeeEmail,
                                    EmployeeJiGuan: employeeJiGuan, EmployeeAddress: employeeAddress, EmployeePosition: employeePosition,
                                    EmployeeBirthday: employeeBirthday
                                },
                                success: function (message) {
                                    $("#JqGrid-table").jqGrid("setGridParam",
                                        {
                                            url: "/JqGridDemo/JqGridCRUD/EmployeeInfoToLoad",
                                            page: 1,
                                            datatype: "json"
                                        }).trigger("reloadGrid");
                                    alert('编辑成功！！');

                                },
                                error: function (message) {
                                    alert('error!');
                                }
                            });
                        },
                        "取消": function () {
                            $(this).dialog("close");
                            $("#JqGrid-table").jqGrid('clearGridData');
                            //$("#JqGrid-table").trigger('reloadGrid');
                            $("#JqGrid-table").setGridParam({ url: "/JqGridDemo/JqGridCRUD/EmployeeInfoToLoad" }).trigger('reloadGrid');
                        }
                    }
                });

            });
            //查询
            $("#btn_search").click(function () {
                var employeeName = $("#precisionSearch_input").val();
                $("#JqGrid-table").jqGrid("setGridParam",
                    {
                        url: "/JqGridDemo/JqGridCRUD/EmployeeInfoToSearch" + "?EmployeeName=" + employeeName,
                        page: 1,
                        datatype: "json"
                    }).trigger("reloadGrid");

            });
            //导出
            $("#btn_export").on("click", function () {
                $("#JqGrid-table").jqGrid("exportToExcel", {
                    includeLabels: true,
                    includeGroupHeader: true,
                    includeFooter: true,
                    fileName: "jqGridExport.xlsx",
                    maxlength: 40 // maxlength for visible string
                });
            });
            //导入
            $("#btn_import").click(function () {
                var FileName = $("#UpLoadFile").val();
                $.ajax({
                    url: '/JqGridDemo/ImportData/InsertDataToDB',
                    type: 'post',
                    data: { fileName: FileName }
                });
            });
        })
    </script>
</head>
<body>
<table id="editgrid"></table>
<div id="pager2" style="width:60px ; height:60px" ></div>
<%--<input type="BUTTON" id="bedata" value="Edit Selected" />--%>
<!--新增表单区域开始-->
<form method="post" id="http://localhost:8081/upload/User/insertUser.do">
    <div >
        <table id="insertgrid"></table>
        <div id="pager3" style="width:60px ; height:60px" ></div>
    </div>

    <!--按钮开始-->
    <!--<div class="new-guard">
        <input type="submit" class="btn save-btn" onclick="submitForm()"
               value="保存"> <input type="button" class="btn back-btn"
                                  onclick="afterLoad('checkAfterRain/init')" value="返回">
    </div>
    <!--按钮结束-->
    <input id="btn_search" type="button" value="查询" class="btn btn-info" />
     <input id="btn_add" type="button" value="添加" class="btn btn-primary" />
     <input id="btn_edit" type="button" value="编辑" class="btn btn-success" />
    <input id="btn_del" type="button" value="删除" class="btn btn-danger" />
</form>


</body>
</html>
