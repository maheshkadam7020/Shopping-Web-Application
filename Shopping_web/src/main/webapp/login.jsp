<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Login - MyShop</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #ffffff;
      min-height: 100vh;
      margin: 0;
      color: #212529;
    }
    .main-content {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: calc(100vh - 70px); /* Adjust based on navbar height */
      padding-top: 70px;
    }
    .form-container {
      background-color: #f8f9fa;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 400px;
    }
    .form-control {
      background-color: #ffffff;
      border: 1px solid #ced4da;
      color: #212529;
    }
    .form-control::placeholder {
      color: #6c757d;
    }
    .btn-login {
      background-color: #00d4ff;
      font-weight: 600;
      color: black;
    }
    .btn-login:hover {
      background-color: #00aacc;
      color: white;
    }
  </style>
</head>
<body>

<%@ include file="include/navbar.jsp" %>

<div class="main-content">
  <div class="form-container">
    <h3 class="text-center mb-4">Login to MyShop</h3>
    <% 
      String msg = (String) session.getAttribute("msg");
      if(msg != null) { 
    %>
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= msg %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    <%
        session.removeAttribute("msg"); // remove after showing
      }
    %>
    <form method="post" action="login">
      <div class="mb-3">
        <label for="role" class="form-label">Login as</label>
        <select class="form-select" id="role" name="role" required>
          <option value="user"  selected>User</option>
          <option value="admin">Admin</option>
        </select>
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Email address</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
      </div>
      <div class="mb-4">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="••••••••" required>
      </div>
      <div class="d-grid">
        <button type="submit" class="btn btn-login">Login</button>
      </div>
      <div class="mt-3 text-center">
        <small>Don't have an account? <a href="register.jsp" class="text-info">Register</a></small>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
