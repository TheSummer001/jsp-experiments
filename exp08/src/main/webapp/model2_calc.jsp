<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head><title>Model 2 计算器</title></head>
<body>
<h2>项目2：Model 2 (MVC) 四则运算器</h2>
<form action="calcServlet" method="post">
    <input type="text" name="num1" value="${calcData.num1}"/>
    <select name="operator">
        <option value="+" ${calcData.operator == '+' ? 'selected' : ''}>+</option>
        <option value="-" ${calcData.operator == '-' ? 'selected' : ''}>-</option>
        <option value="*" ${calcData.operator == '*' ? 'selected' : ''}>*</option>
        <option value="/" ${calcData.operator == '/' ? 'selected' : ''}>/</option>
    </select>
    <input type="text" name="num2" value="${calcData.num2}"/>
    <input type="submit" value=" = "/>

    <input type="text" value="${calcData.result}" readonly/>
</form>
</body>
</html>