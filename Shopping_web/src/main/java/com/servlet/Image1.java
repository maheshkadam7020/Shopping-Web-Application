package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DB.DBconnect;

@WebServlet("/image1")
public class Image1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBconnect.getConnection();
            int id = Integer.parseInt(request.getParameter("id"));

            ps = conn.prepareStatement("SELECT image FROM products WHERE product_id=?");

            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                byte[] img = rs.getBytes("image");
                if (img != null) {
                    response.setContentType("image/jpeg"); // Make sure matches your image type
                    OutputStream os = response.getOutputStream();
                    os.write(img);
                    os.flush();
                    os.close();
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND); // image not found
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND); // product not found
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            try { if(rs != null) rs.close(); } catch(Exception e) {}
            try { if(ps != null) ps.close(); } catch(Exception e) {}
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }
    }
}
