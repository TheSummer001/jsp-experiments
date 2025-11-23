<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 删除 Cookie
    Cookie c1 = new Cookie("c_user", "");
    c1.setMaxAge(0);
    response.addCookie(c1);

    Cookie c2 = new Cookie("c_pass", "");
    c2.setMaxAge(0);
    response.addCookie(c2);

    session.invalidate();
    response.sendRedirect("auto_login.jsp");
%>