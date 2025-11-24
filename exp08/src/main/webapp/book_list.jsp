<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head><title>图书列表(Model 2)</title></head>
<body>
<h2>图书管理系统 (Model 2 / MVC)</h2>
<hr/>
<a href="bookServlet?action=toAdd">添加新图书</a>
<br/><br/>

<table border="1" cellpadding="10" cellspacing="0">
    <tr><th>ID</th><th>书名</th><th>作者</th><th>价格</th><th>出版日期</th></tr>

    <c:forEach items="${bookList}" var="b">
        <tr>
            <td>${b.id}</td>
            <td>${b.name}</td>
            <td>${b.author}</td>
            <td>${b.price}</td>
            <td>${b.publishDate}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>