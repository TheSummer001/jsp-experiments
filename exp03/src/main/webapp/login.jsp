<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录 - 实验3</title>
</head>
<body>
<h2>项目2：模拟用户登录</h2>
<hr/>
<form action="login_action.jsp" method="post">
    <table border="0">
        <tr>
            <td>账号：</td>
            <td><input type="text" name="loginName" placeholder="请输入admin"/></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="loginPwd" placeholder="请输入123456"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="登录"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>