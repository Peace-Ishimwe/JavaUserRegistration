<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="javax.servlet.http.*, java.io.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
<%
    // Invalidate the current session
    HttpSession sessionToInvalidate = request.getSession(false); // Do not create a new session if one doesn't exist
    if (sessionToInvalidate != null) {
        sessionToInvalidate.invalidate(); // Invalidate the session
    }

    // Redirect the user to the login page after logout
    try {
        response.sendRedirect("login.jsp");
    } catch (IOException e) {
        e.printStackTrace(); // Handle the IOException
    }
%>
</body>
</html>
