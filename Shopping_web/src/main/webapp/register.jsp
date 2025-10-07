<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Register - MyShop</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f0f2f5; /* soft background */
      min-height: 100vh;
      margin: 0;
      color: #212529;
    }
    .main-content {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: calc(100vh - 70px);
      padding-top: 70px;
    }
    .form-container {
      background-color: #ffffff;
      padding: 2.5rem;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 420px;
    }
    .form-control {
      border-radius: 8px;
    }
    .btn-register {
      background: linear-gradient(90deg, #00d4ff, #00aacc);
      color: white;
      font-weight: 600;
      border-radius: 8px;
    }
    .btn-register:hover {
      background: linear-gradient(90deg, #00aacc, #0077aa);
      color: white;
    }
  </style>
</head>
<body>

<%@ include file="include/navbar.jsp" %>

<div class="main-content">
  <div class="form-container">
    
    <h3 class="text-center mb-4">Create an Account</h3>

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

    <form action="register" method="post">
      <div class="mb-3">
        <label for="name" class="form-label">Full Name</label>
        <input type="text" class="form-control" id="name" name="name" placeholder="John Doe" required>
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Email address</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Create a password" required>
      </div>

      <div class="d-grid">
        <button type="submit" class="btn btn-register">Register</button>
      </div>

      <div class="mt-3 text-center">
        <small>Already have an account? <a href="login.jsp" class="text-info">Login</a></small>
      </div>
    </form>

  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
