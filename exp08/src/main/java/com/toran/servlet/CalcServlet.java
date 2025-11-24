package com.toran.servlet;

import com.toran.bean.Calculator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/calcServlet")
public class CalcServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
// 1. 接收参数
        String n1 = req.getParameter("num1");
        String n2 = req.getParameter("num2");
        String op = req.getParameter("operator");

// 2. 调用 Model (JavaBean)
        Calculator calc = new Calculator();
        try {
            if (n1 != null) calc.setNum1(Double.parseDouble(n1));
            if (n2 != null) calc.setNum2(Double.parseDouble(n2));
            if (op != null) calc.setOperator(op);

            calc.calculate(); // 执行业务逻辑
        } catch (NumberFormatException e) {
// 处理非法输入
        }

// 3. 将结果存入 Request 域
        req.setAttribute("calcData", calc);

// 4. 转发回 JSP 进行显示 (View)
        req.getRequestDispatcher("model2_calc.jsp").forward(req, resp);
    }
}