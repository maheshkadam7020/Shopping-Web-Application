<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Orders - MyShop</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Navbar */
    .navbar {
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
    }
    .nav-link {
      color: white !important;
      font-size: 18px;
      font-weight: 500;
      transition: all 0.3s ease;
    }
    .nav-link:hover {
      color: #00d4ff !important;
    }
    .navbar-brand {
      font-weight: bold;
      color: #00d4ff !important;
      font-size: 25px;
    }

    body {
      background-color: #f8f9fa;
      min-height: 100vh;
    }

    /* Orders Table Container */
    .container-orders {
      max-width: 1000px;
      margin: 50px auto;
      background: #fff;
      padding: 2rem;
      border-radius: 12px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
      color: #212529;
    }

    h2 {
      text-align: center;
      margin-bottom: 1.5rem;
      font-weight: 600;
      color: #212529;
    }

    table thead {
      background-color: #007bff;
      color: #fff;
    }

    tbody tr:hover {
      background-color: #f1f1f1;
    }

    select.status-dropdown {
      border-radius: 5px;
      padding: 5px;
      border: 1px solid #ced4da;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg shadow-sm">
  <div class="container">
    <a class="navbar-brand me-auto" href="#">Admin Panel</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mainNavbar">
      <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
        <li class="nav-item px-3">
          <a class="nav-link" href="dashboard.jsp">Dashboard</a>
        </li>
        <li class="nav-item px-3">
          <a class="nav-link" href="products.jsp">Products</a>
        </li>
        <li class="nav-item px-3">
          <a class="nav-link active" href="admin-orders.jsp">Orders</a>
        </li>
        <li class="nav-item px-3">
          <a class="nav-link" href="users.jsp">Users</a>
        </li>
      </ul>
      <form class="d-flex ms-auto">
        <a href="logout.jsp" class="btn btn-login">Logout</a>
      </form>
    </div>
  </div>
</nav>

<!-- Orders Table -->
<div class="container-orders">
  <h2>All Orders</h2>
  <div class="table-responsive">
    <table class="table table-hover align-middle">
      <thead>
        <tr>
          <th>Order ID</th>
          <th>User</th>
          <th>Products</th>
          <th>Total Amount</th>
          <th>Order Date</th>
          <th>Status</th>
        </tr>
      </thead>
      <tbody>
        <%-- Example static data, replace with database loop --%>
        <tr>
          <td>#1001</td>
          <td>Mahesh Kadam</td>
          <td>Wireless Headphones x1, Smart Watch x2</td>
          <td>₹179.98</td>
          <td>2025-10-04</td>
          <td>
            <select class="status-dropdown">
              <option value="Processing" selected>Processing</option>
              <option value="Shipped">Shipped</option>
              <option value="Delivered">Delivered</option>
              <option value="Cancelled">Cancelled</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>#1002</td>
          <td>Ravi Kumar</td>
          <td>Bluetooth Speaker x1</td>
          <td>₹29.99</td>
          <td>2025-10-03</td>
          <td>
            <select class="status-dropdown">
              <option value="Processing" selected>Processing</option>
              <option value="Shipped">Shipped</option>
              <option value="Delivered">Delivered</option>
              <option value="Cancelled">Cancelled</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>#1003</td>
          <td>Anita Sharma</td>
          <td>Smart Watch x1</td>
          <td>₹89.99</td>
          <td>2025-10-02</td>
          <td>
            <select class="status-dropdown">
              <option value="Processing">Processing</option>
              <option value="Shipped">Shipped</option>
              <option value="Delivered">Delivered</option>
              <option value="Cancelled" selected>Cancelled</option>
            </select>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
