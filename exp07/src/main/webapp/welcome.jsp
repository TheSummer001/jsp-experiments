<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h1>登录成功！欢迎你：<%= session.getAttribute("loginUser") %></h1>
<p>这是一个受保护的页面。</p>
<a href="login.jsp">退出 (需关闭浏览器或清除Session)</a>
</body>
</html>