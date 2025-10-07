package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.DB.DBconnect;

@WebServlet("/remove")
public class Remove extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            conn = DBconnect.getConnection();

            String query = "DELETE FROM products WHERE product_id = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);

            int row = ps.executeUpdate();

            if (row > 0) {
                
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("admin.jsp");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            
        } catch (SQLException e) {
            e.printStackTrace();
           
        } finally {
            
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
