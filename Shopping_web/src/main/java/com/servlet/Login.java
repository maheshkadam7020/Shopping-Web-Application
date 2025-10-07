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

@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String role = request.getParameter("role");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao uDao = new UserDao(DBconnect.getConnection());
        User us = uDao.isLogin(email, password);

        if (us != null) {
            
            if (us.getRole().equals(role)) {
                HttpSession session = request.getSession();
                session.setAttribute("us", us);
                session.setAttribute("role", us.getRole());

                if (us.getRole().equals("admin")) {
                    response.sendRedirect("admin.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Access Denied! Wrong role selected.");
                response.sendRedirect("login.jsp");
            }
        } else {
            
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Invalid Email or Password!");
            response.sendRedirect("login.jsp");
        }
    }
}
