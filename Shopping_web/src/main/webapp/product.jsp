<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Products</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { background-color: #f8f9fa; }

/* Use Bootstrap 5 cards with grid equal heights */
.products-row {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 20px;
}

.card {
    display: flex;
    flex-direction: column;
    height: 100%;
    transition: transform 0.3s;
}

.card:hover { transform: translateY(-5px); }

.card-img-top { 
    height: 200px; 
    object-fit: cover; 
}

.card-body {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex: 1;
}

.card-title {
    font-size: 1.2rem;
    font-weight: 600;
    margin-bottom: 10px;
}

.card-text {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3; /* max 3 lines */
    -webkit-box-orient: vertical;
    margin-bottom: 10px;
}

.btn-cart { background-color: #007bff; color: white; width: 48%; }
.btn-buy { background-color: #28a745; color: white; width: 48%; }
.btn-cart:hover { background-color: #0056b3; }
.btn-buy:hover { background-color: #1e7e34; }
</style>
</head>
<body>

<div class="container my-5">
    <div class="products-row">
        <%
            try (Connection conn = DBconnect.getConnection();
                 PreparedStatement ps = conn.prepareStatement("SELECT * FROM products");
                 ResultSet rs = ps.executeQuery()) {

                while(rs.next()) {
        %>
        <div class="card shadow-sm">
            <img src="image1?id=<%=rs.getInt("product_id") %>" class="card-img-top" alt="<%=rs.getString("name")%>">
            <div class="card-body">
                <h5 class="card-title"><%=rs.getString("name")%></h5>
                <p class="card-text"><%=rs.getString("description") %></p>
                <p class="card-text fs-3"><strong>₹ <%=rs.getInt("price") %></strong></p>
                <div class="d-flex justify-content-between">
                    <a href="addcart?id=<%=rs.getInt("product_id") %>" class="btn btn-cart">Add to Cart</a>
                    <a href="buy.jsp?id=<%=rs.getInt("product_id") %>" class="btn btn-buy">Buy Now</a>
                </div>
            </div>
        </div>
        <% 
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
