package com.toran.dao;



import com.toran.entity.Book;
import com.toran.util.DBHelper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    // 1. 查询所有图书
    public List<Book> getAllBooks() {
        List<Book> list = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBHelper.getConnection(); // 使用刚才定义的 DBHelper
            String sql = "SELECT * FROM bookinfo";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("id"));
                book.setName(rs.getString("name"));
                book.setAuthor(rs.getString("author"));
                book.setPrice(rs.getDouble("price"));
                book.setPublishDate(rs.getDate("publish_date"));
                list.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBHelper.close(rs, stmt, conn);
        }
        return list;
    }

    // 2. 添加图书
    public boolean addBook(Book book) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean isSuccess = false;

        try {
            conn = DBHelper.getConnection();
            String sql = "INSERT INTO bookinfo (name, author, price, publish_date) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, book.getName());
            pstmt.setString(2, book.getAuthor());
            pstmt.setDouble(3, book.getPrice());
            pstmt.setDate(4, book.getPublishDate());

            int count = pstmt.executeUpdate();
            isSuccess = count > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBHelper.close(pstmt, conn);
        }
        return isSuccess;
    }
}