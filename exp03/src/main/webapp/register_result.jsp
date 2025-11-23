<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册结果</title>
</head>
<body>
<h2>注册成功，您提交的信息如下：</h2>
<%
    // 1. 设置编码，防止中文乱码 (非常重要)
    request.setCharacterEncoding("UTF-8");

    // 2. 获取单值参数
    String user = request.getParameter("username");
    String pass = request.getParameter("password");
    String gender = request.getParameter("gender");
    String edu = request.getParameter("education");

    // 3. 获取多值参数 (复选框)
    String[] hobbies = request.getParameterValues("hobbies");
%>

<ul>
    <li><strong>用户名：</strong> <%= user %></li>
    <li><strong>密码：</strong> <%= pass %></li>
    <li><strong>性别：</strong> <%= gender %></li>
    <li><strong>学历：</strong> <%= edu %></li>
    <li><strong>爱好：</strong>
        <%
            if (hobbies != null) {
                for (String hobby : hobbies) {
                    out.print(hobby + " ");
                }
            } else {
                out.print("无");
            }
        %>
    </li>
</ul>
<a href="register.jsp">返回注册页</a>
</body>
</html>