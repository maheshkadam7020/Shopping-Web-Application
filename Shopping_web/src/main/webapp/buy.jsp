<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.assest.User"%>
<%
   User user1=(User)session.getAttribute("us");
  if(user1==null)
  {
	  response.sendRedirect("login.jsp");
  }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Buy Product</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>

  <style>
    body {
      background: #f2f5f9;
      font-family: "Poppins", sans-serif;
    }
    .buy-card {
      max-width: 600px;
      margin: 60px auto;
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      padding: 30px;
    }
    .product-img {
      width: 100%;
      height: 300px;
      object-fit: cover;
      border-radius: 12px;
      margin-bottom: 20px;
    }
    .btn-confirm {
      background-color: #007bff;
      color: white;
      font-weight: 500;
      border-radius: 8px;
      transition: all 0.3s ease;
    }
    .btn-confirm:hover {
      background-color: #0056b3;
      transform: translateY(-2px);
    }
    .price {
      font-size: 1.3rem;
      color: #007bff;
      font-weight: 600;
    }
  </style>
</head>
<body>


<%@ include file="include/navbar.jsp" %>


<%
    Connection conn = DBconnect.getConnection();
    int id = Integer.parseInt(request.getParameter("id"));
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE product_id = ?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
%>

 

  <div class="container">
    <div class="buy-card">
      <h3 class="text-center mb-4">🛍 Confirm Your Purchase</h3>

      <!-- ✅ Correct way to load image stored in DB -->
      <img src="image1?id=<%=rs.getInt("product_id")%>" alt="Product Image" class="product-img" />

      <!-- ✅ Product Details -->
      <h4><%= rs.getString("name") %></h4>
      <p class="text-muted"><%= rs.getString("description") %></p>
      <p class="price">Price: ₹<%= rs.getInt("price") %></p>

      <hr />

      
      <form action="order" method="post">
      	<%  if(user!=null){ %>
      	<input type="hidden" name="product_id" value="<%= rs.getInt("product_id") %>">
    	<input type="hidden" name="price" value="<%=  rs.getInt("price") %>">
    	<input type="hidden" name="uid" value="<%= user.getId() %>">
    <%} %>
      	<div class="mb-3">
  		<label class="form-label">Quantity</label>
  		<input type="number" name="quantity" class="form-control" value="1" min="1" required>
		</div>
      
        <div class="mb-3">
          <label class="form-label">Delivery Address</label>
          <textarea class="form-control" rows="3" placeholder="Enter your delivery address" required></textarea>
        </div>

        <div class="mb-3">
          <label class="form-label">Payment Method</label>
          <select class="form-select" name="method" required>
            <option selected disabled>Select Payment Option</option>
            <option value="COD" >Cash on Delivery</option>
            <option value="Card">Credit / Debit Card</option>
          </select>
        </div>

        <button type="submit" class="btn btn-primary w-100">Confirm Purchase</button>
      </form>
    </div>
  </div>

<%
    } else {
%>
  <div class="container text-center mt-5">
    <h3>❌ Product Not Found</h3>
  </div>
<%
    }
%>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
