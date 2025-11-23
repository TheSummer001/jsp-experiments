<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>个人中心</title></head>
<body>
<%
    // 安全检查：如果没有登录，踢回登录页
    String user = (String) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<h1 style="color: blue">欢迎回来，<%= user %>！</h1>
<p>登录验证通过。</p>
<a href="logout.jsp">退出登录</a>
</body>
</html>