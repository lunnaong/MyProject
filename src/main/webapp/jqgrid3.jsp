<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>jqgrid</title>
    <link rel="stylesheet" type="text/css" href="/myproject/system/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="/myproject/system/css/ui.jqgrid.css" >
    <link rel="stylesheet" type="text/css" media="screen" href="/myproject/system/themes/blitzer/jquery-ui-1.8.20.custom.css">
    <link rel="stylesheet" type="text/css" href="/myproject/system/themes/humanity/jquery.ui.theme.css">
    <link rel="stylesheet" type="text/css" href="/myproject/system/css/BeatPicker.min.css">
   <%-- <link rel="stylesheet" type="text/css" href="/myproject/System/css/jquery.ui.core.css">--%>

    <script src="/myproject/system/js/jquery-1.11.0.min.js"></script>
    <script src="/myproject/system/js/jquery.jqGrid.js"></script>
    <script src="/myproject/system/js/jquery-ui.min.js"></script>
    <script src="/myproject/system/js/grid.locale-cn.js"></script>
    <script src="/myproject/system/js/jquery.tablednd.js"></script>
    <script src="/myproject/system/js/BeatPicker.min.js"></script>
    <style type="text/css">

        #Modify_id,#Modify_name,#Modify_address,#Modify_sex,#Modify_birthday,#ADD_id,#ADD_name,#ADD_address,#date1,#ADD_sex{
            width:200px;
            height:30px;

        }
        div.pos_abs
        {
            position:absolute;
            right:200px;
            top:1px;
            border: 1px solid;

        }

    </style>


<script>

 /*   function beforeSelectRow()
    {
        $("#JqGrid-table").jqGrid('resetSelection');
        return(true);
    }*/
    $(document).ready(function (){
    //查找
    $("#btn_search").click(function () {
        var id = $("#precisionSearch_input").val();
        var name = $("#name_input").val();
        var birthday = $("#birthday_input").val();
        if(id == '' && name == ''&& birthday == ''){
            $("#JqGrid-table").jqGrid("setGridParam",
                {
                    url: "http://localhost:8081/myproject/User2/selAll.do",
                    page: 1,
                    datatype: "json",
                    jsonReader :{
                        root: "list",  //数据模型
                        records: "size",//数据总记录数
                        repeatitems: false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
                    },
                }).trigger("reloadGrid");
            return;
        }
        var reg = /\D/;
       // var reg = /\D/g,'' ;
        var r = id.match(reg);
        if(!( r == null || r == '')){
            alert('请输入数字');
            return false;
        }
       // alert("r="+r);
        $.ajax({
            url: "http://localhost:8081/myproject/User2/conditionalSel.do",
            page: 1,
            datatype: "json",
            data: {id:id,name:name,birthday:birthday},
            async: false,
            height:200,
            success: function(message){
                //alert(name);
               $("#JqGrid-table").jqGrid("setGridParam",
                {
                    url: "http://localhost:8081/myproject/User2/conditionalSel.do",
                    page: 1,
                    mytype: "post",
                    datatype: "json",
                    postData: {id:id,name:name,birthday:birthday},
                    jsonReader :{
                        root: "user",  //数据模型
                        },
                    async: false,
                    height:200,
                }).trigger("reloadGrid");
               $("#JqGrid-table").setGridHeight("510");
                //alert(message);
             },
             error: function(message){
                    alert(message);
        }});


    })})

    // 复位查询条件输入域
    function reset(){
        document.getElementById("precisionSearch_input").value = '';
        document.getElementById("name_input").value = '';
        document.getElementById("birthday_input").value = '';
        //alert("test!");
    };

    //添加
    function  Add() {
        $ (":text").val ("");
        $("#date1").val("");
        $("#AddEmployeeInfo").dialog({
            closeOnEscape: false,
            height: 400,
            width: 500,
            resizable: true,
            modal: true,//这里就是控制弹出为模态
            cache: false,
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close").hide();},
                buttons: {
                "确定": function () {
                    var id = $("#ADD_id").val();
                    var name = $("#ADD_name").val();
                    var address = $("#ADD_address").val();
                    var birthday = $("#date1").val();
                    var sex = $("#ADD_sex").val();
                    if(id == ''){
                        alert("序号不能为空");
                        id.focus();
                        return false;
                    }
                    var reg = /\D/;
                    var r = id.match(reg);
                    if(!( r == null || r == '')){
                        alert('序号请输入数字');
                        return false;
                    }
                    if(name == ''){
                        alert("姓名不能为空");
                        return false;
                    }
                    if(address == ''){
                        alert("地址不能为空");
                        return false;
                    }
                    if( birthday == ''){
                        alert("生日不能为空");
                        return false;
                    }

                    $.ajax({
                        url: "http://localhost:8081/myproject/User2/insertUser.do",
                        type: "GET",
                        data: {
                            id: id, name: name, address: address,
                            birthday: birthday, sex: sex
                        },
                        success: function (message) {
                           //alert(message);
                           if(message == false){
                               alert("插入数据失败，请核对数据");
                           }
                           else{
                               alert("插入成功");
                           }
                            $("#JqGrid-table").jqGrid("setGridParam",
                                {
                                    url: "http://localhost:8081/myproject/User2/selAll.do",
                                    page: 1,
                                    datatype: "json",
                                    jsonReader :{
                                        root: "list",  //数据模型
                                        records: "size",//数据总记录数
                                        repeatitems: false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
                                    },
                                }).trigger("reloadGrid");


                        },
                        error: function (message) {
                            alert('error'+ message);
                        }
                    });
                    $(this).dialog("close");
                },

                "取消": function () {
                    $(this).dialog("close");

                }
            }
        });
    };
    //删除;
   function Del() {
        var id = $('#JqGrid-table').jqGrid('getGridParam', 'selarrrow');//获取行id
       //alert(id.length);
        var len = id.length;
        if(len<1){
            alert("请选择一条数据");
            return;
        }
       $("#Delete").dialog({
           height: 300,
           width: 500,
           resizable: false,
           modal: true,
           open: function (event, ui) {
               $(".ui-dialog-titlebar-close").hide();},
           buttons: {
               "确定": function () {
                   $(this).dialog("close");
                   $.ajax({
                       url: "http://localhost:8081/myproject/User2/deleteUser.do",
                       type: "post",
                       data: {id: id},
                       success: function (message) {
                           $("#JqGrid-table").jqGrid("setGridParam",
                               {
                                   url: "http://localhost:8081/myproject/User2/selAll.do",
                                   page: 1,
                                   datatype: "json",
                                   jsonReader :{
                                       root: "list",  //数据模型
                                       records: "size",//数据总记录数
                                       repeatitems: false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
                                   },
                               }).trigger("reloadGrid");
                           alert('成功删除'+message.len+'条数据');
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
       } );

    };

 function fmtDate(obj){
     var date =  new Date(obj);
     var y = 1900+date.getYear();
     var m = "0"+(date.getMonth()+1);
     var d = "0"+date.getDate();
     return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
 }
    //编辑
    function Edit() {
        //var ids = jQuery("#JqGrid-table").jqGrid('getDataIDs');//返回grid里所有数据的id
        var id = jQuery("#JqGrid-table").jqGrid('getGridParam', 'selarrrow');
        //alert("there!"+ id.length);
        if(id.length >1){
            alert("你选择了多行，请选择一条");
            return;
        }
        if(id.length < 1){
            alert("请选择一条数据");
            return;
        }
        var EmployeeInfoModel = jQuery("#JqGrid-table").jqGrid('getRowData', id);
        var birthday = EmployeeInfoModel.birthday;
        var d = fmtDate(birthday);
        $("#Modify_id").val(EmployeeInfoModel.id);
        $("#Modify_name").val(EmployeeInfoModel.name);
        $("#Modify_address").val(EmployeeInfoModel.address);
        $("#Modify_birthday").val(d);
        $("#Modify_sex").val(EmployeeInfoModel.sex);

        $("#ModifyEmployeeInfo").dialog({
            height: 400,
            width: 500,
            resizable: false,
            modal: true,  //这里就是控制弹出为模态
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close").hide();},
            buttons: {
                "确定": function () {
                    $(this).dialog("close");
                    //提交前的初始值
                    var id = $("#Modify_id").val();
                    var name = $("#Modify_name").val();
                    var address = $("#Modify_address").val();
                    var birthday = $("#Modify_birthday").val();
                    var sex = $("#Modify_sex").val();
                    if(name == ''){
                        alert("姓名不能为空");
                        return false;
                    }
                    if(address == ''){
                        alert("地址不能为空");
                        return false;
                    }
                    if( birthday == ''){
                        alert("生日不能为空");
                        return false;
                    }
                    $.ajax({
                        url: "http://localhost:8081/myproject/User2/updateUser.do",
                        type: "GET",
                        data: {
                            id: id, name: name, address: address,
                            birthday: birthday, sex: sex
                        },
                        success: function (message) {
                            $("#JqGrid-table").jqGrid("setGridParam",
                                {
                                    url: "http://localhost:8081/myproject/User2/selAll.do",
                                    page: 1,
                                    datatype: "json"
                                    /*jsonReader :{
                                        root: "list",  //数据模型
                                        records: "size",//数据总记录数
                                        repeatitems: false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
                                    },*/
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

    };

</script>


</head>
<body>
<div>

    <div style="width:1000px;height:50px;margin: 20px;border:1px solid;padding: 30px" align="left" >
        序号：<input id="precisionSearch_input" type="text" placeholder="请输入您要查询的序号" style=" width:200px; height:50px;margin-bottom: 10px;"  />
        姓名: <input id="name_input" type="text" placeholder="请输入您要查询的姓名" style=" width:200px; height:50px;margin-bottom: 10px;"  />
        生日：<input id="birthday_input" type="text" placeholder="请输入您要查询的生日" data-beatpicker="true" data-beatpicker-position="['*','*']"  data-beatpicker-module="today,clear"  style=" width:200px; height:50px;top:50px;right:720px;position: absolute"/>
        <div class="pos_abs" style="width:130px;height:50px;margin:20px;padding: 30px" align="center">
        <input id="btn_search" type="button" value="查询" class="btn btn-info" style="width:50px; height:50px;margin-bottom: 10px;" />
        <input id="btn_reset" type="button" value="重置" onclick="reset()" class="btn btn-info" style="width:50px; height:50px;margin-bottom: 10px;" />
        </div>
    </div>


<div class="main" id="main">
    <table id="JqGrid-table" style="z-index: 1"></table>
    <div id="JqGrid-pager" style="z-index: 1"></div>
    <form method="post" id="ModifyEmployeeInfo" title="修改信息"  style="display:none;" style="width: 350px; margin: 0px; z-index: 9999;position:relative;">
        <fieldset>
            <legend>Modify Data</legend>
            <table style="z-index:1;">
                <tbody>
                <tr>
                    <td>序号：</td>
                    <td><input type="text" id="Modify_id" placeholder="请输入序号" maxlength="8" disabled= "true " /></td>
                </tr>
                <tr>
                    <td>姓名：</td>
                    <td><input type="text" id="Modify_name" placeholder="请输入姓名" maxlength="255" /></td>
                </tr>
                <tr>
                    <td>地址：</td>
                    <td><input type="text" id="Modify_address" placeholder="请输入地址" maxlength="255"/></td>
                </tr>
                <tr>
                    <td>生日：</td>
                    <td><input  type="date" id="Modify_birthday" placeholder="请输入生日" data-beatpicker="true" data-beatpicker-module="today,clear" /></td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>
                        <select id="Modify_sex" >
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </td>
                    <%-- <td><input type="text" id="Modify_sex" placeholder="请输入性别" /></td>--%>
                </tr>
                </tbody>
            </table>
        </fieldset>
    </form>

    <div id="AddEmployeeInfo" title="增加信息" style="display:none;width: 350px; margin: 0px;z-index: 9999;position:relative;">
        <fieldset>
            <legend>Add Data</legend>
            <table style="z-index: 99;">
                <tbody>
                  <tr>
                      <td>序号：</td>
                      <td>  <input type="text" id="ADD_id" placeholder="请输入序号" maxlength="9" autofocus /></td>
                  </tr>
                  <tr>
                      <td>姓名：</td>
                      <td> <input type="text" id="ADD_name" placeholder="请输入姓名" maxlength="255"/></td>
                  </tr>
                  <tr>
                      <td>地址：</td>
                      <td><input type="text" id="ADD_address" placeholder="请输入地址" maxlength="255"/></td>
                  </tr>
                  <tr>
                      <td>生日：</td>
                      <td><input id="date1" type="date" placeholder="请输入生日" data-beatpicker="true" data-beatpicker-module="today,clear" /></td>
                  </tr>
                  <tr>
                      <td>性别: </td>
                     <%-- <td> <input type="input" id="ADD_sex" placeholder="请输入性别" /></td>--%>
                      <td>
                          <select id="ADD_sex">
                              <option value="男">男</option>
                              <option value="女">女</option>
                          </select>
                      </td>
                  </tr>
                </tbody>
            </table>
        </fieldset>
    </div>
    <div id="Delete" title="删除信息" style="display:none;width: 350px; margin: 0px;z-index: 99;position:relative;">
        <fieldset>
            <legend>Delete date</legend>
            <table>
                <tbody>
                   <tr><td>确认删除？</td></tr>
                </tbody>
            </table>
        </fieldset>
    </div>
</div>
</div>
<div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#JqGrid-table").jqGrid({
                url: "http://localhost:8081/myproject/User2/selAll.do",
                //editurl: 'clientArray',
                datatype: "json",
                mtype: "Get",
               // scroll: true,
                jsonReader :{
                    root: "list",  //数据模型
                    records: "size",//数据总记录数
                    repeatitems: false, // 如果设为false，则jqGrid在解析json时，会根据name来搜索对应的数据元素（即可以json中元素可以不按顺序）；而所使用的name是来自于colModel中的name设定。
                },
                colNames: ['序号', '姓名', '地址', '生日', '性别'],
                colModel: [{
                    name: 'id',
                    index: '序号',
                    key: true,
                    width: 100,
                    height: 200,
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
                    index: '姓名',
                    width: 200,
                    height: 200,
                    editable: true,
                    editoptions: {
                        align:'center',
                        size: "20",
                        maxlength: "30",
                        sortable: true
                    }
                }, {
                    name: 'address',
                    index: '地址',
                    width: 200,
                    height: 200,
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
                        index: '生日',
                        width: 100,
                        height: 200,
                        align: 'center',
                        editable: true,
                        //edittype: false,
                        formatter:function(cellvalue, options, row){
                            var d1 = new Date(cellvalue).toDateString();
                            return fmtDate(d1)},
                        editoptions: {
                            align:'center',
                            size: "20",
                            maxlength: "30"
                        }
                    }, {
                        name: 'sex',
                        index: '性别',
                        width: 50,
                        height: 200,
                        align: 'center',
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
                sortname: "id",
                loadonce: true,
                altRows: true,
                pgbuttons:true,
                pginput:true,
                multiselect: true,
                multiboxonly: true,
                caption: "客户信息表",
                autowidth: true,
                //width: "100%",
                height: "auto",
               /* height:400,*/
                sortable: true,
                sortorder: 'asc',
                loadComplete: function() {
                    var grid = $("#JqGrid-table");
                    var ids = grid.getDataIDs();
                    for (var i = 0; i < ids.length; i++) {
                        grid.setRowData ( ids[i], true, {height: 50} );
                    }
                }
            })

            jQuery("#JqGrid-table")
                .navGrid('#JqGrid-pager',{edit:false,add:false,del:false,search:false})
                .navButtonAdd('#JqGrid-pager',{
                    caption:"Add",
                    buttonicon:"none",
                    onClickButton: function(){
                        Add();
                    },
                    position:"last"
                }).navSeparatorAdd("#JqGrid-pager",{sepclass : "ui-separator",sepcontent: ''})
                .navButtonAdd('#JqGrid-pager',{
                    caption:"Edit",
                    cursor:"pointer",
                    autowidth: true,
                    buttonicon:"none",
                    onClickButton: function(){
                        Edit();
                    },
                    position:"last"
                }).navSeparatorAdd("#JqGrid-pager",{sepclass : "ui-separator",sepcontent: ''})
                .navButtonAdd('#JqGrid-pager',{
                    caption:"Del",
                    buttonicon:"none",
                    onClickButton: function(){
                        Del();
                    },
                    position:"last"
                }).navSeparatorAdd("#JqGrid-pager",{sepclass : "ui-separator",sepcontent: ''}) ;
        });

    </script>
</div>
</body>
</html>
