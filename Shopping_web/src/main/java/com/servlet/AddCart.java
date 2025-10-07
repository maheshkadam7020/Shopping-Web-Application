package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;



import com.DB.DBconnect;
import com.assest.User;



@WebServlet("/addcart")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		HttpSession session=request.getSession(false);
		Connection connection=DBconnect.getConnection();
		
		User user =(User)session.getAttribute("us");
		
		if(user==null)
		{
			response.sendRedirect("login.jsp");
		}
		else {
			try {
				PreparedStatement ps=connection.prepareStatement("insert into cart(uid,product_id) values(?,?)");
				ps.setInt(1,user.getId());
				ps.setInt(2, id);
				if(ps.executeUpdate()>0)
				{
					response.sendRedirect("index.jsp");
				}
				else {
						PrintWriter out=response.getWriter();
					
					out.write("<h1>There is problem on Server</h1>");
				}
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
	
	
	}
	

	

}
