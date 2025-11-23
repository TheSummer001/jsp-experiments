<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理系统</title>
</head>
<body>
<h2>图书列表</h2>
<hr/>
<a href="add_book.jsp">添加新图书</a>
<br/><br/>

<table border="1" cellpadding="10" cellspacing="0">
    <tr style="background-color: #f0f0f0;">
        <th>ID</th>
        <th>书名</th>
        <th>作者</th>
        <th>价格</th>
        <th>出版日期</th>
    </tr>

    <%
        // --- JDBC 连接配置 ---
        // 1. 加载驱动
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 2. 建立连接 (注意修改 url 中的数据库名 book，以及你的账号密码)
        String url = "jdbc:mysql://localhost:3306/book?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
        String user = "root";      // TODO: 修改为你的 MySQL 账号
        String password = "123456";  // TODO: 修改为你的 MySQL 密码

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();

            // 3. 执行查询
            String sql = "SELECT * FROM bookinfo";
            rs = stmt.executeQuery(sql);

            // 4. 遍历结果集
            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("author") %></td>
        <td><%= rs.getDouble("price") %></td>
        <td><%= rs.getDate("publish_date") %></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            out.print("<tr><td colspan='5' style='color:red'>数据库连接错误：" + e.getMessage() + "</td></tr>");
        } finally {
            // 5. 释放资源
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</table>
</body>
</html>