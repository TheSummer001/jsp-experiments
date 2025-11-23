<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head><title>正在转发...</title></head>
<body>
<h1>这个页面你将看不见内容</h1>
<p>因为它会立即转发到 target.jsp</p>

<%-- jsp:forward 动作：服务器端跳转 --%>
<%-- 可以在转发时传递参数 --%>
<jsp:forward page="target.jsp">

    <jsp:param name="username" value="WangTongRan"/>
    <jsp:param name="source" value="Experiment2"/>
</jsp:forward>
</body>
</html>