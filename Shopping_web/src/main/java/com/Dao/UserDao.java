package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.assest.User;





public class UserDao {
	private Connection conn;
	 User user=null;
	 public UserDao(Connection conn) {
		super();
		this.conn = conn;
	 }
	 
	 public boolean isRegister(User us)
	 {
		 boolean f=false;
		 final String query="insert into user(name,email,password) values(?,?,?)";
		 
		 try {
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,us.getName() );
			ps.setString(2,us.getEmail());
			ps.setString(3, us.getPassword());
			
			ps.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.getStackTrace();
		}
		 return f;
	 }
	 
	 public User isLogin(String email,String password)
	 {
		 String query="select*from user where email=? and password=?";
			try {
				PreparedStatement ps=conn.prepareStatement(query);
				ps.setString(1, email);
				ps.setString(2, password);
				
				ResultSet rs=ps.executeQuery();
				while (rs.next()) {
					user=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
					
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		
		 return user;
	 }
}
