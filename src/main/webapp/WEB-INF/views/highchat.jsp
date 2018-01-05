<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/series-label.js"></script>
    <script src="https://img.hcharts.cn/highcharts/modules/oldie.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="https://api.hcharts.cn/highcharts#series.data.dataLabels"></script>
 <%--   <script src="https://img.hcharts.cn/highcharts/themes/dark-unica.js"></script>--%>

</head>
<body>
<div id="container" style="min-width:400px;height:600px"></div>
<div class="message"></div>
<script>
    var chart = Highcharts.chart('container', {
        chart:{
            type:"column"
        },
        title: {
            text: '利润前10变化趋势',
            style:{
                color:"white"
            }
        },
        yAxis: {
            title: {
                text: '利润 (元)'
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },
        xAxis: {
            categories: ['One', 'Two', 'Thr', 'Fou', 'Fiv', 'Six', 'Sev', 'Eig', 'Nin', 'Ten']
        },
        plotOptions: {
            series: {
                allowPointSelect: true
            },
            line: {
                dataLabels: {
                    enabled: true
                }
            }

            },

        series: [{
            name: '${date1.year}- ${date1.month}利润',

            data:[
            <c:forEach items="${requestScope.first}" var="element" varStatus="status">
            <c:if test ="${status.last}">${element}</c:if>
            <c:if test = "${!status.last}"> ${element},</c:if>
            </c:forEach>
       ] ,  tooltip: {
                valueSuffix: '￥'
            },
            dashStyle: 'Solid'

        }, {
            name: '${date2.year}-${date2.month}利润',
            data: [<c:forEach items="${requestScope.second}" var="element" varStatus="status">
                <c:if test ="${status.last}">${element}</c:if>
                <c:if test = "${!status.last}"> ${element},</c:if>
                </c:forEach>],
            tooltip: {
                valueSuffix: '￥'
            },
            dashStyle:  'Solid'
        }]
    });

</script>
</body>
</html>
