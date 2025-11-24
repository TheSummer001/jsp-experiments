<%@ page import="com.toran.dao.BookDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="book" class="com.toran.entity.Book" scope="page"/>

<jsp:setProperty name="book" property="*"/>
<%
    request.setCharacterEncoding("UTF-8");

    // 手动处理日期转换 (因为 property="*" 无法自动处理 String 到 java.sql.Date)
    String dateStr = request.getParameter("publish_date");
    if(dateStr != null && !dateStr.isEmpty()){
        book.setPublishDate(java.sql.Date.valueOf(dateStr));
    }

    // 3. 调用 DAO 保存
    BookDAO dao = new BookDAO();
    boolean success = dao.addBook(book);

    if (success) {
        response.sendRedirect("book_list.jsp");
    } else {
        out.print("添加失败，<a href='add_book.jsp'>返回</a>");
    }
%>