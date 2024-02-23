package com.rca.app.userregistration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Pattern;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // No implementation for now
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        String userName = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Hashing the password
        String hashedPassword = PasswordHasher.hashPassword(password);

        String role = req.getParameter("role");

        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        if (!pattern.matcher(email).matches()) {
            // Email format is incorrect, send error response
            req.setAttribute("errorMessage", "Invalid email format");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        try {
            // Use try-with-resources to automatically close resources
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/javaUserDb";
            String userN = "root";
            String pass = "";

            try (Connection con = DriverManager.getConnection(url, userN, pass)) {
                // Check if the username or email already exists
                String checkSql = "SELECT * FROM users WHERE userName = ? OR email = ?";
                try (PreparedStatement checkPs = con.prepareStatement(checkSql)) {
                    checkPs.setString(1, userName);
                    checkPs.setString(2, email);
                    try (ResultSet rs = checkPs.executeQuery()) {
                        if (rs.next()) {
                            // Username or email already exists, send error response
                            req.setAttribute("errorMessage", "Username or email already exists");
                            req.getRequestDispatcher("register.jsp").forward(req, resp);
                            return;
                        }
                    }
                }

                // No existing user with the same username or email, proceed with registration
                String insertSql = "INSERT INTO users (userName, email, password, role) VALUES (?, ?, ?, ?)";
                try (PreparedStatement ps = con.prepareStatement(insertSql)) {
                    ps.setString(1, userName);
                    ps.setString(2, email);
                    ps.setString(3, hashedPassword);
                    ps.setString(4, role);

                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected > 0) {
                        System.out.println("Data inserted successfully!");
                        resp.sendRedirect("login.jsp");
                    } else {
                        System.out.println("Failed to insert data.");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Log the exception or handle it appropriately
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        }
    }
}