package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DB.DBconnect;
import com.Dao.UserDao;
import com.assest.User;


@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name= request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		User user=new User(name,email,password);
		UserDao uDao=new UserDao(DBconnect.getConnection());
		 boolean f=uDao.isRegister(user);
		 
		 if(f)
		 {
			 HttpSession session=request.getSession();
			 session.setAttribute("msg", "Registration Successful...");
			 response.sendRedirect("register.jsp");
			 
			 
		 }
		 else {
			 HttpSession session=request.getSession();
			 session.setAttribute("msg", "Registration Fail...");
			 response.sendRedirect("register.jsp");
		}
	}

}
