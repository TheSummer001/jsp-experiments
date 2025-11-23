<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册 - 实验3</title>
</head>
<body>
<h2>项目1：用户注册信息录入</h2>
<form action="register_result.jsp" method="post">
    <p>
        用户名：<input type="text" name="username" required/>
    </p>
    <p>
        密  码：<input type="password" name="password" required/>
    </p>
    <p>
        性  别：
        <input type="radio" name="gender" value="男" checked/>男
        <input type="radio" name="gender" value="女"/>女
    </p>
    <p>
        爱  好（多选）：
        <input type="checkbox" name="hobbies" value="编程">编程
        <input type="checkbox" name="hobbies" value="阅读">阅读
        <input type="checkbox" name="hobbies" value="运动">运动
    </p>
    <p>
        学  历：
        <select name="education">
            <option value="本科">本科</option>
            <option value="硕士">硕士</option>
            <option value="专科">专科</option>
        </select>
    </p>
    <p>
        <input type="submit" value="立即注册"/>
        <input type="reset" value="重置"/>
    </p>
</form>
</body>
</html>