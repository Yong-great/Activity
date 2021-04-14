<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>活动</title>
    <%@include file="/pages/common/head.jsp"%>
    <style type="text/css">
        h1 {
            text-align: center;
            margin-top: 200px;
        }

        h1 a {
            color:red;
        }

        input {
            text-align: center;
        }
    </style>
</head>
<body>
<div id="header">
    <span class="wel_word">审核学生</span>
    <%@include file="/pages/common/sponsorMenu.jsp"%>
</div>

<div id="main">

    <table>
        <tr>
            <td>活动名</td>
            <td>活动类型</td>
            <td>活动内容</td>
            <td>活动地点</td>
            <td>活动开始时间</td>
            <td>活动结束时间</td>
            <td>活动时长</td>
            <td>人数上限</td>
            <td colspan="2">操作</td>
        </tr>

        <c:forEach items="${requestScope.page.items}" var="activity">
            <tr>
                <td>${activity.activityName}</td>
                <td>${activity.activityType}</td>
                <td>${activity.activityContext}</td>
                <td>${activity.activitySite}</td>
                <td>${activity.activityStartTime}</td>
                <td>${activity.activityOverTime}</td>
                <td>${activity.activityTime}</td>
                <td>${activity.activityPeople}</td>
                <td><a href="sponsorServlet?action=change&&activityId=${activity.id}
                &&bool=${empty requestScope.bool?"checkStudent":"provideTime"}">${requestScope.msg}</a></td>
            </tr>
            </c:forEach>

    </table>
</div>
    <%--分页操作--%>
    <div id="page_nav">
        <c:if test="${requestScope.page.pageNo>1}">
            <a href="activityServlet?action=queryActivity&&pageNo=1">首页</a>
            <a href="activityServlet?action=queryActivity&&pageNo=${requestScope.page.pageNo-1}">上一页</a>
        </c:if>
        ${[requestScope.page.pageNo]}
        <c:if test="${requestScope.page.pageNo<requestScope.page.pageTotal}">
            <a href="activityServlet?action=queryActivity&&pageNo=${requestScope.page.pageNo+1}">下一页</a>
            <a href="activityServlet?action=queryActivity&&pageNo=${requestScope.page.pageTotal}">末页</a>
        </c:if>

        共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录
        到第<input  name="pn" value="${param.pageNo}" id="pn_input"/>页
        <input id="searchPageBtn" type="button" value="确定" >
        <script>
            $(function () {
                $("#searchPageBtn").click(function (){
                    var pageNo=$("#pn_input").val();
                    location.href="${pageScope.basePath}activityServlet?action=queryActivity&&pageNo="+pageNo;

                });
            });
        </script>
</div>

<div id="bottom">
    <%@include file="/pages/common/tail.jsp"%>
</div>
</body>
</html>