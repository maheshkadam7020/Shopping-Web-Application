<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%  User us1=(User)session.getAttribute("us");
		if(us1==null)
		{
			response.sendRedirect("login.jsp");
		}

%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>My Orders - MyShop</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #ffffff;
    }
    .product-img {
      width: 60px;
      height: 60px;
      object-fit: cover;
      border-radius: 6px;
      border: 1px solid #ddd;
    }
    .table {
      background-color: #fff;
    }
    .badge {
      font-size: 0.85rem;
      padding: 0.5em 0.7em;
    }
  </style>
</head>
<body>

<%@ include file="include/navbar.jsp" %>

<div class="container py-5">
  <h2 class="mb-4 text-center">My Orders</h2>
		
  <div class="table-responsive shadow-sm rounded">
    <table class="table table-hover align-middle mb-0">
      <thead class="table-primary">
        <tr>
          <th>Order ID</th>
          <th>Product Image</th>
          <th>Product Name</th>
          <th>Quantity</th>
          <th>Price</th>
          <th>Order Date</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
      <%

if(user != null) {

    String query = "SELECT o.order_id,o.product_id, p.image, p.name AS pname, o.quantity, o.total_price, o.order_date, o.order_status " +
                   "FROM orders o " +
                   "INNER JOIN products p ON o.product_id = p.product_id " +
                   "WHERE o.user_id = ? " +
                   "ORDER BY o.order_date DESC";

    try (Connection conn = DBconnect.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {

        ps.setInt(1, user.getId());
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
%>
<tr>
    <td>#200<%=rs.getInt("order_id") %></td>
    <td><img src="image1?id=<%=rs.getInt("product_id") %>" class="product-img"></td>
    <td><%=rs.getString("pname") %></td>
    <td><%=rs.getInt("quantity") %></td>
    <td><%=rs.getInt("total_price") %></td>
    <td><%=rs.getTimestamp("order_date") %></td>
    <%
        String status = rs.getString("order_status");
        String badgeClass = "bg-secondary";
        if(status.equalsIgnoreCase("Pending")) badgeClass = "bg-warning";
        else if(status.equalsIgnoreCase("Delivered")) badgeClass = "bg-success";
        else if(status.equalsIgnoreCase("Cancelled")) badgeClass = "bg-danger";
    %>
    <td><span class="badge <%=badgeClass%>"><%=status%></span></td>
</tr>
<%
        }
    } catch(Exception e){
        e.printStackTrace();
    }
}
%>

      </tbody>
    </table>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
