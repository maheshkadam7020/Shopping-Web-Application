package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.DB.DBconnect;

@WebServlet("/BuyNowServlet")
public class BuyNowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cartId = Integer.parseInt(request.getParameter("cart_id"));
        int productId = Integer.parseInt(request.getParameter("product_id"));

        try (Connection conn = DBconnect.getConnection()) {

            
            String deleteQuery = "DELETE FROM cart WHERE cart_id = ?";
            PreparedStatement ps = conn.prepareStatement(deleteQuery);
            ps.setInt(1, cartId);
            ps.executeUpdate();

            
            response.sendRedirect("buy.jsp?id=" + productId);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error processing request: " + e.getMessage());
        }
    }
}
