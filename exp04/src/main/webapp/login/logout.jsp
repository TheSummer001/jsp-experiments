<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  session.invalidate(); // 销毁 Session
  response.sendRedirect("login.jsp");
%>