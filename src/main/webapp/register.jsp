<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Now!</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<div class="container">
    <h2>User Registration</h2>
    <%-- Check if there's an error message and display it --%>
    <% String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null && !errorMessage.isEmpty()) { %>
    <p class="error-message"><%= errorMessage %></p>
    <% } %>
    <form action="register" method="post">
        <label for="username">Username:</label> <input type="text"
                                                       id="username" name="username" required><br> <label
            for="email">Email:</label> <input type="email" id="email"
                                              name="email" required><br> <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <label for="role">Role:</label> <select id="role" name="role"
                                                required>
        <option value="guest">Guest</option>
        <option value="admin">Admin</option>
    </select><br> <input type="submit" value="Register">
    </form>
    <p>
        Already have an account? <a href="login.jsp">Login</a>
    </p>
</div>

</body>
</html>