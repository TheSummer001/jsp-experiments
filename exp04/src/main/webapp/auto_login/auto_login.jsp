<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // --- 检查 Cookie 逻辑 ---
    String cookieUser = null;
    String cookiePass = null;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("c_user".equals(c.getName())) cookieUser = c.getValue();
            if ("c_pass".equals(c.getName())) cookiePass = c.getValue();
        }
    }

    // 发现有效 Cookie，直接跳转
    if ("admin".equals(cookieUser) && "123".equals(cookiePass)) {
        session.setAttribute("currentUser", cookieUser);
        response.sendRedirect("auto_welcome.jsp");
        return;
    }
%>
<html>
<head><title>自动登录</title></head>
<body>
<h2>登录 (支持两周免登录)</h2>
<form action="auto_login_action.jsp" method="post">
    账号：<input type="text" name="username" value="<%= (cookieUser!=null)?cookieUser:"" %>"/><br/>
    密码：<input type="password" name="password" value="<%= (cookiePass!=null)?cookiePass:"" %>"/><br/>
    <input type="checkbox" name="autoLogin" value="true"> 两周内自动登录<br/><br/>
    <input type="submit" value="登录"/>
</form>
</body>
</html>