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

@WebServlet("/order")
public class Order extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            // Get form parameters
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int pid = Integer.parseInt(request.getParameter("product_id"));
            int price = Integer.parseInt(request.getParameter("price"));
            int uid = Integer.parseInt(request.getParameter("uid"));
            String payment = request.getParameter("method");
            

            // Calculate total price
            int total = quantity * price;

            // Get DB connection
            Connection conn = DBconnect.getConnection();

            // Prepare SQL statement
            String sql = "INSERT INTO orders (user_id, product_id, quantity, total_price, payment) VALUES (?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ps.setInt(3, quantity);
            ps.setInt(4, total);
            ps.setString(5, payment);
           

            int row = ps.executeUpdate();

            if(row > 0){
                request.setAttribute("message", "✅ Order placed successfully!");
            } else {
                request.setAttribute("message", "❌ Failed to place order!");
            }

            request.getRequestDispatcher("orderplace.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "❌ Something went wrong!");
            request.getRequestDispatcher("orderplace.jsp").forward(request, response);
        }
    }
}
