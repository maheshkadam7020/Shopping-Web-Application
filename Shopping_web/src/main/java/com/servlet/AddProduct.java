package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.DB.DBconnect;



@WebServlet("/addproduct")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,   
	    maxFileSize = 5 * 1024 * 1024,     
	    maxRequestSize = 20 * 1024 * 1024  
	)
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection conn;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pname =request.getParameter("name");
		String description=request.getParameter("description");
		int  price=Integer.parseInt(request.getParameter("price"));
		int  stock=Integer.parseInt(request.getParameter("stock"));
		Part part=request.getPart("image");
		InputStream inputStream=part.getInputStream();
		conn=DBconnect.getConnection();
	 int row=0;
		String query="insert into products(name,description,price,stock,image) values(?,?,?,?,?)";
		
		try {
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, pname);
			ps.setString(2, description);
			ps.setInt(3, price);
			ps.setInt(4, stock);
			ps.setBlob(5, inputStream);
			
			row=ps.executeUpdate();
			
			if(row>0)
			{
				HttpSession session=request.getSession();
				session.setAttribute("msg","Product Details Uploaded...");
				response.sendRedirect("addproduct.jsp");
			}
			else {
				HttpSession session=request.getSession();
				session.setAttribute("msg","Product Details Upload Failed...");
				response.sendRedirect("addproduct.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	    
		
	}

}
