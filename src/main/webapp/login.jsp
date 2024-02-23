<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>

<div class="container">
    <h2>Login</h2>

    <%-- Check if there's an error message and display it --%>
    <% String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null && !errorMessage.isEmpty()) { %>
    <p class="error-message"><%= errorMessage %></p>
    <% } %>

    <form action="login" method="post">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <input type="submit" value="Login">
    </form>

    <p>Don't have an account? <a href="register.jsp">Register</a></p>
</div>

</body>
</html>
