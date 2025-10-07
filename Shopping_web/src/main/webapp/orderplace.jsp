<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
</head>
<body>
<%
    String message = (String) request.getAttribute("message");
    if (message != null) {
%>
    <script>
        alert("<%=message%>");
        // Optionally redirect to homepage or products page
        window.location.href = "index.jsp";
    </script>
<%
    }
%>
</body>
</html>
