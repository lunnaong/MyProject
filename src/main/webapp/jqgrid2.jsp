<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>jqgrid</title>
    <link rel="stylesheet" href="/upload/System/css/jquery-ui.css">
    <link rel="stylesheet" href="/upload/System/css/ui.jqgrid.css" type="text/css">

   <%-- <link rel="stylesheet" href="/upload/System/css/jquery-ui-1.8.20.custom.css">
    <link rel="stylesheet" href="/upload/System/css/jquery-ui.theme.css">--%>

    <script src="/upload/System/js/jquery-1.11.0.min.js"></script>
    <script src="/upload/System/js/jquery.jqGrid.js"></script>
    <script src="/upload/System/js/jquery-ui.min.js"></script>
    <script src="/upload/System/js/grid.locale-cn.js"></script>
    <script src="/upload/System/js/jquery.jqGrid.min.js"></script>
    <script src="/upload/System/js/jquery.jqGrid.src.js"></script>

    <title>员工信息表</title>
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

                            var id = $("#ADD_id").val();
                            var name = $("#ADD_name").val();
                            var address = $("#ADD_address").val();
                            var birthday = $("#ADD_birthday").val();
                            var sex = $("#ADD_sex").val();
                            $.ajax({
                                url: "http://localhost:8081/upload/User2/insertUser.do",
                                type: "GET",
                                data: {
                                    id: id, name: name, address: address,
                                    birthday: birthday, sex: sex
                                },
                                success: function (message) {
                                    $("#JqGrid-table").jqGrid("setGridParam",
                                        {
                                            url: "http://localhost:8081/upload/User2/selAll.do",
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
                var id = $('#JqGrid-table').jqGrid('getGridParam', 'selrow');//获取行id
                $.ajax({
                    url: "http://localhost:8081/upload/User2/deleteUser.do",
                    type: "post",
                    data: {id: id},
                    success: function (message) {
                        $("#JqGrid-table").jqGrid("setGridParam",
                            {
                                url: "http://localhost:8081/upload/User2/selAll.do",
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
                $("#Modify_id").val(EmployeeInfoModel.id);
                $("#Modify_name").val(EmployeeInfoModel.name);
                $("#Modify_address").val(EmployeeInfoModel.address);
                $("#Modify_birthday").val(EmployeeInfoModel.birthday);
                $("#Modify_sex").val(EmployeeInfoModel.sex);

                $("#ModifyEmployeeInfo").dialog({
                    height: 400,
                    width: 500,
                    resizable: false,
                    modal: true,  //这里就是控制弹出为模态
                    buttons: {
                        "确定": function () {

                            //提交前的初始值
                            var id = $("#Modify_id").val();
                            var name = $("#Modify_name").val();
                            var address = $("#Modify_address").val();
                            var birthday = $("#Modify_birthday").val();
                            var sex = $("#Modify_sex").val();

                            $.ajax({
                                url: "http://localhost:8081/upload/User2/updateUser.do",
                                type: "GET",
                                data: {
                                    id: id, name: name, address: address,
                                     birthday: birthday, sex: sex
                                },
                                success: function (message) {
                                    $("#JqGrid-table").jqGrid("setGridParam",
                                        {
                                            url: "http://localhost:8081/upload/User2/selAll.do",
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
                        }
                    }
                });

            });
            //查询
            $("#btn_search").click(function () {
                var id = $("#precisionSearch_input").val();
                $("#JqGrid-table").jqGrid("setGridParam",
                    {
                        url: "http://localhost:8081/upload/User2/SelUser.do" + "?id=" + id,
                        page: 1,
                        datatype: "json"
                    }).trigger("reloadGrid");

            })
        })
    </script>
</head>
<body>
<div>
    <div>

        <input id="precisionSearch_input" type="text" placeholder="请输入您要查询的id" />
        <input id="btn_search" type="button" value="查询" class="btn btn-info" />
        <input id="btn_add" type="button" value="添加" class="btn btn-primary" />
        <input id="btn_edit" type="button" value="编辑" class="btn btn-success" />
        <input id="btn_del" type="button" value="删除" class="btn btn-danger" />


    </div>
    <div class="main" id="main">
        <table id="JqGrid-table"></table>
        <div id="JqGrid-pager"></div>
        <div id="ModifyEmployeeInfo" title="修改信息" style="display:none;">
            <table>
                <tbody>
                <tr>
                    <td>id：<input type="text" id="Modify_id" placeholder="请输入ID" /></td>
                    <td>name：<input type="text" id="Modify_name" placeholder="请输入姓名" /></td>
                </tr>
                <tr>
                    <td>address：<input type="text" id="Modify_address" placeholder="请输入地址" /></td>
                    <td>birthday：<input type="date" id="Modify_birthday" placeholder="请输入生日" /></td>
                </tr>
                <tr>
                    <td>sex：<input type="text" id="Modify_sex" placeholder="请输入性别" /></td>
                </tr>

                </tbody>
            </table>
        </div>
        <div id="AddEmployeeInfo" title="增加信息" style="display:none;">
            <table>
                <tbody>
                <tr>
                    <td>id：<input type="text" id="ADD_id" placeholder="请输入ID" /></td>
                    <td>name：<input type="text" id="ADD_name" placeholder="请输入姓名" /></td>
                </tr>
                <tr>
                    <td>address：<input type="text" id="ADD_address" placeholder="请输入地址" /></td>
                    <td>birthday：<input type="date" id="ADD_birthday" placeholder="请输入生日" /></td>
                </tr>
                <tr>
                    <td>sex：<input type="text" id="ADD_sex" placeholder="请输入性别" /></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#JqGrid-table").jqGrid({
                url: "http://localhost:8081/upload/User2/selAll.do",
                //editurl: 'clientArray',
                datatype: "json",
                height: 300,
                mtype: "Get",
                colNames: ['id', 'name', 'address', 'birthday', 'sex'],
                colModel: [{
                    name: 'id',
                    index: 'id',
                    key: true,
                    width: 100,
                    edittype: Text,
                    editable: false,
                    editoptions: {
                        align:'center',
                        size: "20",
                        maxlength: "30",
                        sorttable: false,
                    },
                    searchoptions: {
                        searchOperMenu: false,
                        sopt: ['eq', 'gt', 'lt', 'ge', 'le']
                    }
                }, {
                    name: 'name',
                    index: 'name',
                    width: 200,
                    editable: true,
                    editoptions: {
                        align:'center',
                        size: "20",
                        maxlength: "30",
                        sortable: true
                    }
                }, {
                    name: 'address',
                    index: 'address',
                    width: 200,
                    editable: true,
                    //edittype: false,
                    editoptions: {
                        align:'center',
                        size: "20",
                        maxlength: "30"
                    }
                },
                    {
                        name: 'birthday',
                        index: 'birthday',
                        width: 200,
                        editable: true,
                        //edittype: false,
                        formatter:function(cellvalue, options, row){return new Date(cellvalue).toLocaleString()},
                        editoptions: {
                            align:'center',
                            size: "20",
                            maxlength: "30"
                        }
                    }, {
                        name: 'sex',
                        index: 'sex',
                        width: 200,
                        editable: true,
                        //edittype: false,
                        editoptions: {
                            align:'center',
                            size: "20",
                            maxlength: "30"
                        }
                    }],
                viewrecords: true,
                rowNum: 10,
                rowList: [5, 10, 20, 30],
                pager: '#JqGrid-pager',
                altRows: true,
                multiselect: true,
                multiboxonly: true,
                caption: "客户信息表",
                autowidth: true,
                //width: "100%",
                height: Audio,
                sortable: true,
                sortorder: 'asc',
                loadonce: true, //排序时，必须添加该字段
            })
            //JqGrid自带的CRUD
            $('#JqGrid-table').jqGrid('navGrid', "#JqGrid-pager", {
                search: true,
                // show search button on the toolbar
                add: true,
                edit: true,
                del: true,
                refresh: true
            });
        })
    </script>
</div>
</body>
</html>