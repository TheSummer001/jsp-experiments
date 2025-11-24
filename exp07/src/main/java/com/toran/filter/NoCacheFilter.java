package com.toran.filter;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// 拦截所有 .jsp 结尾的请求，禁止它们被缓存
@WebFilter("*.jsp")
public class NoCacheFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) res;

        // 设置 HTTP 头，禁止浏览器缓存
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0
        response.setDateHeader("Expires", 0); // Proxies

        System.out.println("NoCacheFilter 已执行：禁止缓存");

        // 放行（非常重要，不写这行页面就显示不出来了）
        chain.doFilter(req, res);
    }

    // 初始化和销毁方法可以留空
    public void init(FilterConfig config) {}
    public void destroy() {}
}