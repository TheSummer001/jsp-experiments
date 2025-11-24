package com.toran.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 处理请求乱码
        req.setCharacterEncoding("UTF-8");

        // 2. 获取参数
        String u = req.getParameter("username");
        String p = req.getParameter("password");

        // 3. 逻辑判断
        if ("admin".equals(u) && "123".equals(p)) {
            // 登录成功：存入 Session
            req.getSession().setAttribute("loginUser", u);
            // 重定向到欢迎页 (注意：这个页面将在项目4中被保护起来)
            resp.sendRedirect("welcome.jsp");
        } else {
            // 登录失败：设置提示信息并转发回登录页
            req.setAttribute("msg", "账号或密码错误");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}