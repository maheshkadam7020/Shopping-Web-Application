<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.assest.User" %>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Add Product - Admin Panel</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: white;
      min-height: 100vh;
    }
    .container-form {
      max-width: 600px;
      margin: 50px auto;
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      padding: 2rem;
      border-radius: 15px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
      color: black;
    }
    h3 { text-align: center; margin-bottom: 1.5rem; font-weight: 600; }
    .form-group { width: 70%; margin: 0 auto 15px; }
    .form-control {
      border: none; border-radius: 8px; padding: 10px;
      transition: all 0.3s ease;
    }
    .form-control:focus { box-shadow: 0 0 10px rgba(13,110,253,0.6); }
    .btn-submit {
      width: 70%; background: linear-gradient(90deg, #007bff, #00c6ff);
      color: white; font-weight: 600; border: none; border-radius: 8px;
      padding: 12px; transition: 0.3s; display: block; margin: 20px auto 0;
    }
    .btn-submit:hover { background: linear-gradient(90deg, #0056b3, #0099cc); transform: translateY(-2px); }
  </style>
</head>
<body>

<%@ include file="include/navbar.jsp"%>
<%
User us = (User) session.getAttribute("us");

if (us == null || !"admin".equals(us.getRole())) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<div class="container-form">
  <h3 class="py-4">Add New Product</h3>
  
  <% 
  String msg = (String) session.getAttribute("msg"); 
  if (msg != null) {
  %>
    <div class="alert alert-success" role="alert">
      <%= msg %>
    </div>
  <% } session.removeAttribute("msg"); %>

  <form action="addproduct" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="name">Product Name</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="Enter product name" required>
    </div>

    <div class="form-group">
      <label for="description">Description</label>
      <textarea class="form-control" id="description" name="description" rows="3" placeholder="Enter product description"></textarea>
    </div>

    <div class="form-group">
      <label for="price">Price (₹)</label>
      <input type="number" class="form-control" id="price" name="price" step="0.01" placeholder="Enter price" required>
    </div>

    <div class="form-group">
      <label for="stock">Stock Quantity</label>
      <input type="number" class="form-control" id="stock" name="stock" placeholder="Enter stock quantity" required>
    </div>

    <div class="form-group">
      <label for="image">Upload Product Image</label>
      <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
    </div>

    <button type="submit" class="btn-submit">Add Product</button>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
