<%@ page import="com.toran.dao.BookDAO" %>
<%@ page import="com.toran.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>图书管理(JavaBean版)</title></head>
<body>
<h2>图书列表 (JavaBean)</h2>
<hr/>
<a href="add_book.jsp">添加新图书</a>
<br/><br/>

<table border="1" cellpadding="10" cellspacing="0">
    <tr style="background-color: #f0f0f0;">
        <th>ID</th><th>书名</th><th>作者</th><th>价格</th><th>出版日期</th>
    </tr>
    <%
        // 调用 JavaBean
        BookDAO dao = new BookDAO();
        List<Book> books = dao.getAllBooks();

        for (Book b : books) {
    %>
    <tr>
        <td><%= b.getId() %></td>
        <td><%= b.getName() %></td>
        <td><%= b.getAuthor() %></td>
        <td><%= b.getPrice() %></td>
        <td><%= b.getPublishDate() %></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>