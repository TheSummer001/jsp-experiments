<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    String productName = request.getParameter("name");

    // 获取或创建购物车 List
    List<String> cart = (List<String>) session.getAttribute("myCart");
    if (cart == null) {
        cart = new ArrayList<>();
    }

    if (productName != null) {
        cart.add(productName);
    }

    session.setAttribute("myCart", cart);
    response.sendRedirect("cart.jsp"); // 跳转回购物车页
%>