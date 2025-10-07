<%@ page import="com.assest.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Modern Navbar</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.navbar {
    background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
}

.nav-link {
    color: white !important;
    font-size: 20px !important;
    font-weight: 500;
    transition: all 0.3s ease;
}

.nav-link:hover {
    color: #00d4ff !important;
}

.navbar-brand {
    font-weight: bold;
    color: #00d4ff !important;
    font-size: 25px !important;
}

.btn-login, .btn-logout {
    background-color: #00d4ff;
    color: #000;
    font-weight: 600;
    margin-left: 10px; /* spacing from nav items */
}

.btn-login:hover, .btn-logout:hover {
    background-color: #00aacc;
    color: white;
}

/* Remove focus outline from dropdown toggle */
.nav-item.dropdown .dropdown-toggle:focus,
.nav-item.dropdown .dropdown-toggle:active,
.nav-item.dropdown .dropdown-toggle:focus-visible {
    box-shadow: none !important;
    outline: none !important;
}

@media (min-width: 992px) {
    .navbar-collapse {
        justify-content: center;
    }
    .navbar-nav {
        flex-direction: row;
    }
}

.nav-item.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
</style>
</head>
<body>

<%
User user = (User) session.getAttribute("us");
String role = (user != null) ? user.getRole() : null;
%>

<nav class="navbar navbar-expand-lg shadow-sm">
    <div class="container">
        <a class="navbar-brand me-auto" href="#">MyShop</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNavbar">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <li class="nav-item px-3">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>

                <% if ("user".equals(role)) { %>
                <li class="nav-item px-3">
                    <a class="nav-link" href="myorder.jsp"> My Order</a>
                </li>
                <% } %>

                <% if ("admin".equals(role)) { %>
                <li class="nav-item px-3">
                    <a class="nav-link" href="addproduct.jsp">Add Product</a>
                </li>
                <li class="nav-item px-3">
                    <a class="nav-link" href="order.jsp">Orders</a>
                </li>
                <% } %>

                <% if (user == null || "user".equals(role)) { %>
                <li class="nav-item px-3">
                    <a class="nav-link" href="card.jsp">Cart</a>
                </li>
                <% } %>
            </ul>

            <div class="d-flex ms-auto">
                <% if (user != null) { %>
                <a href="logout" class="btn btn-primary">Logout</a>
                <% } else { %>
                <a href="login.jsp" class="btn btn-primary">Login</a>
                <% } %>
            </div>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
