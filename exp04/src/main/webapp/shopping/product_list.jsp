<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>商城首页</title></head>
<body>
<h2>在线商城</h2>
<table border="1" cellpadding="10">
    <tr><th>商品名称</th><th>价格</th><th>操作</th></tr>
    <tr>
        <td>Java编程思想</td><td>￥88.0</td>
        <td><a href="add_cart.jsp?name=Java编程思想">加入购物车</a></td>
    </tr>
    <tr>
        <td>iPhone 15</td><td>￥5999.0</td>
        <td><a href="add_cart.jsp?name=iPhone15">加入购物车</a></td>
    </tr>
    <tr>
        <td>机械键盘</td><td>￥300.0</td>
        <td><a href="add_cart.jsp?name=机械键盘">加入购物车</a></td>
    </tr>
</table>
<br/>
<a href="cart.jsp">查看我的购物车</a>
</body>
</html>