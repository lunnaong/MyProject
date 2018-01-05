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
    <title>ALLUser</title>
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
    <%--<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/upload/System/css/ui.jqgrid.css" type="text/css">
    <link rel="stylesheet" href="/upload/System/css/jquery-ui.css">
    <link rel="stylesheet" href="/upload/System/css/jquery-ui.theme.css">


    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/upload/System/js/grid.local-en.js"></script>
    <script src="/upload/System/js/jquery.jqGrid.min.js"></script>
   <%-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>--%>
</head>
<%--<script>
    $(function(){
        pageInit();
    });
    function pageInit(){
        jQuery("#editgrid").jqGrid(
            {
                url : ctx+'/JSONData',
                datatype : "json",
                colNames : [ 'Inv No', 'Date', 'Client', 'Amount', 'Tax','Total', 'Closed', 'Ship via', 'Notes' ],
                colModel : [
                    {name : 'id',index : 'id',width : 55,editable : false,editoptions : {readonly : true,size : 10}},
                    {name : 'invdate',index : 'invdate',width : 80,editable : true,editoptions : {size : 10}},
                    {name : 'name',index : 'name',width : 90,editable : true,editoptions : {size : 25}},
                    {name : 'amount',index : 'amount',width : 60,align : "right",editable : true,editoptions : {size : 10}},
                    {name : 'tax',index : 'tax',width : 60,align : "right",editable : true,  editoptions : {size : 10}},
                    {name : 'total',index : 'total',width : 60,  align : "right",editable : true,editoptions : {size : 10}},
                    {name : 'closed',  index : 'closed',  width : 55,align : 'center',  editable : true,  edittype : "checkbox",editoptions : {value : "Yes:No"}},
                    {name : 'ship_via',index : 'ship_via',  width : 70,editable : true,  edittype : "select",editoptions : {  value : "FE:FedEx;TN:TNT"}},
                    {name : 'note',index : 'note',width : 100,sortable : false,editable : true,edittype : "textarea",editoptions : {rows : "2",cols : "20"}}
                ],
                rowNum : 10,
                rowList : [ 10, 20, 30 ],
                pager : '#pagered',
                sortname : 'id',
                viewrecords : true,
                sortorder : "desc",
                caption : "Editing Example",
                editurl : ctx+"/RowEditing"
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
</script>--%>

<body>

<div style="margin:10px 20px;padding:20px; border:1px solid #00ffff">
    <button class="btn btn-default btn-md ">新增</button>
    <button class="btn btn-default btn-md " id="bedata">修改</button>
    <button class="btn btn-default btn-md ">删除</button>
</div>
<%--<div id="content" class="table-responsive">--%>
    <div id="pagered" class="table-responsive">
    <%--<table id="table" class="table">--%>
        <table id="editgrid" >
        <tr >
            <th>id</th>
            <th>name</th>
            <th>address</th>
            <th>birthday</th>
            <th>sex</th>
            <%--<th>
                <button class="btn btn-primary btn-sm" data-toggle="modal"  data-target="#addUserModal">
                    添加用户
                </button>--%>
            </th>

        </tr>

        <c:forEach items="${requestScope.user}" var="ele">
            <tr>
                <td>${ele.id}</td>
                <td>${ele.name}</td>
                <td>${ele.address}</td>
                <td>${ele.birthday}</td>
                <td>${ele.sex}</td>
               <%-- <td>
                    <button type="button" class="btn btn-info" data-toggle="modal" onclick="return editInfo()" data-target="#addUserModal">编辑</button>
                    &nbsp;&nbsp;
                    <button type="button" class="btn btn-danger" onclick="return delete_info({id})">删除</button>
                </td>--%>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
