<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>购物车</title></head>
<body>
<h2>我的购物车</h2>
<hr/>
<%
    List<String> cart = (List<String>) session.getAttribute("myCart");

    if (cart == null || cart.size() == 0) {
        out.print("<p>购物车是空的，快去选购吧！</p>");
    } else {
        out.print("<ul>");
        for (String item : cart) {
            out.print("<li>" + item + "</li>");
        }
        out.print("</ul>");
    }
%>
<br/>
<a href="product_list.jsp">继续购物</a>
</body>
</html>