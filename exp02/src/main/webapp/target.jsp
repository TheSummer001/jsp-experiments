<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head><title>转发目标页</title></head>
<body style="background-color: #e6fffa; text-align: center; padding-top: 50px;">
<h2 style="color: green;">恭喜！你看到了这个页面。</h2>
<p>这意味着 request 已经被成功转发 (Forward)。</p>
<hr>
<h3>接收到的参数：</h3>
<%-- 获取上一个页面传来的参数 --%>
<p>用户名: <%= request.getParameter("username") %>
</p>
<p>来源: <%= request.getParameter("source") %>
</p>
</body>
</html>