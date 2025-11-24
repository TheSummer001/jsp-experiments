package com.toran.filter;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

// 拦截 welcome.jsp，保护它不被未登录用户访问
// 也可以配置为 "/*" 但需要复杂的排除逻辑(排除login.jsp)，为了实验简单，我们只拦截欢迎页
@WebFilter("/welcome.jsp")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        // 1. 获取 Session
        HttpSession session = request.getSession(false); // false表示没有也不创建新的

        // 2. 检查是否有登录标记
        // 注意：这里的 "loginUser" 必须和 LoginServlet 里 setAttribute 的名字一致
        if (session != null && session.getAttribute("loginUser") != null) {
            // 已登录，放行
            chain.doFilter(req, res);
        } else {
            // 未登录，拦截并跳转
            System.out.println("AuthFilter 拦截非法访问，跳转回登录页");
            response.sendRedirect("login.jsp");
        }
    }

    public void init(FilterConfig config) {}
    public void destroy() {}
}