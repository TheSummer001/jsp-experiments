<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h1>欢迎 (自动登录演示)</h1>
<p>当前用户：<%= session.getAttribute("currentUser") %></p>
<p>请关闭浏览器再重新访问 auto_login.jsp 测试自动跳转。</p>
<a href="clear_cookie.jsp">注销并清除自动登录</a>
</body>
</html>