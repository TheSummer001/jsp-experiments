<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录处理</title>
</head>
<body>
<%
    // 设置编码
    request.setCharacterEncoding("UTF-8");

    // 获取输入
    String name = request.getParameter("loginName");
    String pwd = request.getParameter("loginPwd");

    // 模拟验证逻辑
    // 注意：字符串比较必须使用 equals() 方法
    if ("admin".equals(name) && "123456".equals(pwd)) {
%>
<h1 style="color: green;">登录成功！</h1>
<p>欢迎您，管理员：<%= name %></p>
<%
} else {
%>
<h1 style="color: red;">登录失败！</h1>
<p>用户名或密码错误。</p>
<a href="login.jsp">点击这里返回重试</a>
<%
    }
%>
</body>
</html>