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


@WebServlet("/UpdateOrder")
public class UpdateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status=request.getParameter("order_status");
		int id=Integer.parseInt(request.getParameter("order_id"));
		
		Connection conn=DBconnect.getConnection();
		
		try {
			PreparedStatement ps=conn.prepareStatement("UPDATE orders SET order_status = ? WHERE order_id = ? ");
			ps.setString(1, status);
			ps.setInt(2, id);
			if(ps.executeUpdate()>0)
			{
				response.sendRedirect("order.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
