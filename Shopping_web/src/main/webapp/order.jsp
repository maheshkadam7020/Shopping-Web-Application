<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.assest.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
User us = (User) session.getAttribute("us");

// Admin check
if (us == null || !"admin".equals(us.getRole())) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Orders - MyShop</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
      body {
          background-color: #f8f9fa;
          font-family: "Poppins", sans-serif;
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
  <h2 class="mb-4 text-center">All Orders</h2>
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
        String query = "SELECT o.order_id, o.product_id, p.image, p.name AS pname, " +
                       "o.quantity, o.total_price, o.order_date, o.order_status " +
                       "FROM orders o " +
                       "INNER JOIN products p ON o.product_id = p.product_id " +
                       "ORDER BY o.order_date DESC";

        try (Connection conn = DBconnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            String[] statuses = {"Processing", "Cancelled", "Shipped", "Delivered"};

            while(rs.next()){
                String currentStatus = rs.getString("order_status");
      %>
        <tr>
          <td>#200<%= rs.getInt("order_id") %></td>
          <td><img src="image1?id=<%= rs.getInt("product_id") %>" class="product-img"></td>
          <td><%= rs.getString("pname") %></td>
          <td><%= rs.getInt("quantity") %></td>
          <td>₹<%= rs.getInt("total_price") %></td>
          <td><%= rs.getTimestamp("order_date") %></td>
          <td>
            <form action="UpdateOrder" method="post" class="d-flex">
              <input type="hidden" name="order_id" value="<%= rs.getInt("order_id") %>">
              <select name="order_status" class="form-select form-select-sm me-2">
                <%
                  for(String status : statuses) {
                      String selected = status.equalsIgnoreCase(currentStatus) ? "selected" : "";
                %>
                  <option value="<%=status%>" <%=selected%> ><%=status%></option>
                <%
                  }
                %>
              </select>
              <button type="submit" class="btn btn-sm btn-primary">Update</button>
            </form>
          </td>
        </tr>
      <%
            }
        } catch(Exception e){
            e.printStackTrace();
        }
      %>
      </tbody>
    </table>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
