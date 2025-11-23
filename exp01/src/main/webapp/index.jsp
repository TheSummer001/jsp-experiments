<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>实验1 - Hello World</title>
</head>

<body>
<h2>输出1000行hello world</h2>

<% for (int i = 1; i <= 1000; i++) { %>

<div>第<%= i %> 行：hello world</div>

<% } %>

</body>
</html>
