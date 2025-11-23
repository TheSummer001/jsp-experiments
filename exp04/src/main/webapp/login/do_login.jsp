<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    // 模拟验证：用户名 admin，密码 123
    if ("admin".equals(user) && "123".equals(pass)) {
        session.setAttribute("currentUser", user); // 存入Session
        response.sendRedirect("welcome.jsp");      // 跳转到欢迎页
    } else {
        out.print("<script>alert('账号或密码错误'); window.location='login.jsp';</script>");
    }
%>