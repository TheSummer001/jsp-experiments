<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="calc" class="com.toran.bean.Calculator" scope="page"/>
<jsp:setProperty name="calc" property="*"/>

<%
    // 3. 如果是表单提交（有参数），则执行计算
    if (request.getParameter("num1") != null) {
        calc.calculate();
    }
%>

<html>
<head><title>Model 1 计算器</title></head>
<body>
<h2>项目1：Model 1 四则运算器</h2>
<form action="model1_calc.jsp" method="post">
    <input type="text" name="num1" value="<%= calc.getNum1() %>"/>
    <select name="operator">
        <option value="+" <%= "+".equals(calc.getOperator())?"selected":"" %>>+</option>
        <option value="-" <%= "-".equals(calc.getOperator())?"selected":"" %>>-</option>
        <option value="*" <%= "*".equals(calc.getOperator())?"selected":"" %>>*</option>
        <option value="/" <%= "/".equals(calc.getOperator())?"selected":"" %>>/</option>
    </select>
    <input type="text" name="num2" value="<%= calc.getNum2() %>"/>
    <input type="submit" value=" = "/>

    <input type="text" value="<%= calc.getResult() %>" readonly/>
</form>
</body>
</html>