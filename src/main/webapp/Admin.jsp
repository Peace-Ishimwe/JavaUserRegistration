<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome, Admin!</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: left;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }

        .feature {
            border-top: 1px solid #ddd;
            padding-top: 20px;
        }

        .feature h2 {
            color: #333;
            margin-bottom: 10px;
        }

        .feature p {
            color: #555;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #45a049;
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<div class="container">
    <a href="logout.jsp">Logout</a>
    <h1>Welcome, Admin!</h1>
    <p>We're thrilled to have you on board. As an admin, you have access to a wide range of features and functionalities to manage the system efficiently.</p>

    <div class="feature">
        <h2>User Management</h2>
        <p>Manage user accounts, permissions, and roles effortlessly with our intuitive user management tools.</p>
    </div>

    <a href="addStudent.jsp" class="button">Add student</a>

    <!-- List of students -->
    <div class="students">
        <h2>List of Students</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Class</th>
            </tr>
            <%
                try {
                    // Establish connection to the database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String url = "jdbc:mysql://localhost:3306/javaUserDb";
                    String user = "root";
                    String password = "";
                    Connection connection = DriverManager.getConnection(url, user, password);

                    // Query to retrieve students from the database
                    String query = "SELECT id, name, class FROM students";
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    ResultSet resultSet = preparedStatement.executeQuery();

                    // Iterate over the result set and display students in table rows
                    while (resultSet.next()) {
                        int studentId = resultSet.getInt("id");
                        String studentName = resultSet.getString("name");
                        String studentClass = resultSet.getString("class");
            %>
            <tr>
                <td><%= studentId %></td>
                <td><%= studentName %></td>
                <td><%= studentClass %></td>
            </tr>
            <%
                    }

                    // Close resources
                    resultSet.close();
                    preparedStatement.close();
                    connection.close();
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>
</div>
</body>
</html>
