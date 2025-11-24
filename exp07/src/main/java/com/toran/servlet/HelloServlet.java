package com.toran.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

// @WebServlet 注解的作用是配置访问路径，这就不用去 web.xml 里写配置了
@WebServlet("/hello")
public class HelloServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 设置响应类型和编码
        resp.setContentType("text/html;charset=UTF-8");

        // 2. 获取输出流向浏览器打印内容
        resp.getWriter().println("<h1>Hello! 这是我的第一个 Servlet</h1>");
        resp.getWriter().println("<p>当前时间：" + new java.util.Date() + "</p>");
    }
}