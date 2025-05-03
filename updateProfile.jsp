<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = Integer.parseInt(request.getParameter("email"));
    String password = request.getParameter("password");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/MEDI";
    String dbUser = "root";
    String dbPassword = "root@123";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Connect to the database
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        // Update user profile
        String sql = "UPDATE signup SET id = ?, pass = ? WHERE name = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, email);
        pstmt.setString(2, password);
        pstmt.setString(3, username);

        int rowsUpdated = pstmt.executeUpdate();

        if (rowsUpdated > 0) {
            out.println("Profile updated successfully.");
        } else {
            out.println("Error updating profile.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
