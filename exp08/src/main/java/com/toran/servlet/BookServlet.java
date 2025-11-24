package com.toran.servlet;

import com.toran.dao.BookDAO;
import com.toran.entity.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/bookServlet")
public class BookServlet extends HttpServlet {
    private BookDAO bookDAO = new BookDAO();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // 获取操作动作，默认为 list
        String action = req.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "list";
        }

        switch (action) {
            case "list":
                listBooks(req, resp);
                break;
            case "toAdd":
                // 跳转到添加页面
                req.getRequestDispatcher("book_add.jsp").forward(req, resp);
                break;
            case "save":
                saveBook(req, resp);
                break;
        }
    }

    private void listBooks(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 调用 Model 获取数据
        List<Book> books = bookDAO.getAllBooks();
        // 2. 存入 Request
        req.setAttribute("bookList", books);
        // 3. 转发到 View (JSP)
        req.getRequestDispatcher("book_list.jsp").forward(req, resp);
    }

    private void saveBook(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 1. 获取参数
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        String priceStr = req.getParameter("price");
        String dateStr = req.getParameter("publishDate");

        // 2. 封装对象
        Book book = new Book();
        book.setName(name);
        book.setAuthor(author);
        if (priceStr != null) book.setPrice(Double.parseDouble(priceStr));
        if (dateStr != null && !dateStr.isEmpty()) book.setPublishDate(java.sql.Date.valueOf(dateStr));

        // 3. 调用业务逻辑
        bookDAO.addBook(book);

        // 4. 重定向回列表 (防止表单重复提交，这里用 Redirect)
        resp.sendRedirect("bookServlet?action=list");
    }
}