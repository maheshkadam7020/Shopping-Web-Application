<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.assest.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
User us1 = (User) session.getAttribute("us");
if (us1 == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Cart - MyShop</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    .product-img {
      width: 60px;
      height: 60px;
      object-fit: cover;
      border-radius: 6px;
      border: 1px solid #ddd;
    }
  </style>
</head>

<body class="bg-light">
<%@ include file="include/navbar.jsp" %>

<div class="container py-5">
  <h2 class="mb-4 text-center">My Cart</h2>

  <div class="table-responsive shadow-sm bg-white rounded">
    <table class="table table-hover align-middle mb-0">
      <thead class="table-primary">
        <tr>
          <th>Cart ID</th>
          <th>Product Image</th>
          <th>Product Name</th>
          <th>Quantity</th>
          <th>Price</th>
          <th>Total</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
      <%
      String query = "SELECT c.cart_id, c.product_id, p.name AS product_name, c.quantity, p.price " +
                     "FROM cart c INNER JOIN products p ON c.product_id = p.product_id " +
                     "WHERE c.uid = ?";

      try (Connection conn = DBconnect.getConnection();
           PreparedStatement ps = conn.prepareStatement(query)) {

          ps.setInt(1, us1.getId());
          ResultSet rs = ps.executeQuery();

          while (rs.next()) {
              int total = rs.getInt("quantity") * rs.getInt("price");
      %>
          <tr>
            <td><%= rs.getInt("cart_id") %></td>
            <td><img src="image1?id=<%= rs.getInt("product_id") %>" alt="Product" class="product-img" /></td>
            <td><%= rs.getString("product_name") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td>₹<%= rs.getInt("price") %></td>
            <td>₹<%= total %></td>
            <td>
              <a href="BuyNowServlet?cart_id=<%= rs.getInt("cart_id") %>&product_id=<%= rs.getInt("product_id") %>" 
   				class="btn btn-sm btn-primary">Buy Now</a>

            </td>
          </tr>
      <%
          }
      } catch (Exception ex) {
          ex.printStackTrace();
      }
      %>
      </tbody>
    </table>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
