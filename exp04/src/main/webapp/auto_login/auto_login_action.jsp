<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String user = request.getParameter("username");
    String pass = request.getParameter("password");
    String auto = request.getParameter("autoLogin");

    if ("admin".equals(user) && "123".equals(pass)) {
        session.setAttribute("currentUser", user);

        // --- Cookie 写入逻辑 ---
        if ("true".equals(auto)) {
            Cookie c1 = new Cookie("c_user", user);
            Cookie c2 = new Cookie("c_pass", pass);
            c1.setMaxAge(60*60*24*14); // 14天
            c2.setMaxAge(60*60*24*14);
            response.addCookie(c1);
            response.addCookie(c2);
        }

        response.sendRedirect("auto_welcome.jsp");
    } else {
        out.print("登录失败，<a href='auto_login.jsp'>重试</a>");
    }
%>