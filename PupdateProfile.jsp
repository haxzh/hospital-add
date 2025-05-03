<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");


    String url = "jdbc:mysql://localhost:3306/MEDI";
    String dbUser = "root";
    String dbPassword = "root@123";

    Connection conn = null;

    try {

        Class.forName("com.mysql.cj.jdbc.Driver");

        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "UPDATE patient SET password = ?, name = ?, phone = ?, age = ?, gender = ? WHERE email = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(3, name);
        pstmt.setString(1, email);
        pstmt.setString(6, phone);
        pstmt.setString(4, age);
        pstmt.setString(2, password);
        pstmt.setString(5, gender);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.println("Profile updated successfully.");
            response.sendRedirect("pProfile.jsp");
        } else {
            out.println("Error updating profile.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%> 