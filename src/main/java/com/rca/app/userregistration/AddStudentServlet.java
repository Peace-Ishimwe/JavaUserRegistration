package com.rca.app.userregistration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "AddStudentServlet", value = "/addStudent")
public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Pass false to avoid creating a new session if one doesn't exist
        String role = null;
        // Check if session is not null and contains the "role" attribute
        if (session != null) {
            role = (String) session.getAttribute("role");
            if (role != null) {
                // Use the role as needed
                System.out.println("User role: " + role);
            } else {
                // Handle case where "role" attribute is not found in the session
                System.out.println("Role attribute not found in session");
            }
        } else {
            // Handle case where session is not available
            System.out.println("Session not available");
        }
        // Check if user is authorized
        if (!role.equalsIgnoreCase("admin")) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String name = request.getParameter("name");
        String studentClass = request.getParameter("class");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/javaUserDb";
            String userN = "root";
            String pass = "";

            try (Connection con = DriverManager.getConnection(url, userN, pass)) {
                // Insert the student into the students table
                String insertSql = "INSERT INTO students (name, class) VALUES (?, ?)";
                try (PreparedStatement ps = con.prepareStatement(insertSql)) {
                    ps.setString(1, name);
                    ps.setString(2, studentClass);

                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected > 0) {
                        response.sendRedirect("Admin.jsp"); // Redirect back to admin page
                    } else {
                        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to add student.");
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        }
    }
}
