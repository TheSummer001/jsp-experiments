<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 设置编码
    request.setCharacterEncoding("UTF-8");

    // 获取表单数据
    String name = request.getParameter("name");
    String author = request.getParameter("author");
    String price = request.getParameter("price");
    String date = request.getParameter("publish_date");

    // JDBC 配置
    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/book?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
    String dbUser = "root";     // TODO: 修改
    String dbPass = "123456";     // TODO: 修改

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        // 使用 PreparedStatement 防止注入，且代码更清晰
        String sql = "INSERT INTO bookinfo (name, author, price, publish_date) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        pstmt.setString(1, name);
        pstmt.setString(2, author);
        pstmt.setDouble(3, Double.parseDouble(price));
        pstmt.setString(4, date); // MySQL 可以直接接受 'yyyy-MM-dd' 字符串

        int count = pstmt.executeUpdate();

        if (count > 0) {
            // 成功，跳转回列表页
            response.sendRedirect("book_list.jsp");
        } else {
            out.print("添加失败");
        }

    } catch (Exception e) {
        out.print("发生错误：" + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>