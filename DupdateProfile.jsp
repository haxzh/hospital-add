<!-- <%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");
    String age = request.getParameter("age");
    String Experiance = request.getParameter("Experiance");


    String url = "jdbc:mysql://localhost:3306/MEDI";
    String dbUser = "root";
    String dbPassword = "root@123";

    Connection conn = null;

    try {

        Class.forName("com.mysql.cj.jdbc.Driver");

        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "UPDATE doctor SET password = ?, name = ?, phone = ?, Age = ?, Experiance = ? WHERE email = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, password);
        pstmt.setString(2, name);
        pstmt.setString(3, phone);
        pstmt.setString(4, age);
        pstmt.setString(5, Experiance);
        pstmt.setString(6, email);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.println("Profile updated successfully.");
            response.sendRedirect("AfterD.jsp");
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
%> -->

<%
    // Handle form submission
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String age = request.getParameter("age");
        String experience = request.getParameter("Experiance");

        String url = "jdbc:mysql://localhost:3306/MEDI";
        String dbUser = "root";
        String dbPassword = "root@123";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPassword);

            String sql = "UPDATE doctor SET password=?, name=?, phone=?, Age=?, Experiance=? WHERE email=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, password);
            pstmt.setString(2, name);
            pstmt.setString(3, phone);
            pstmt.setString(4, age);
            pstmt.setString(5, experience);
            pstmt.setString(6, email);

            int result = pstmt.executeUpdate();

            if (result > 0) {
                out.println("<div class='message success'>Profile updated successfully. Redirecting...</div>");
                response.setHeader("Refresh", "2; URL=AfterD.jsp");
            } else {
                out.println("<div class='message error'>Error updating profile. No changes made.</div>");
            }
        } catch (Exception e) {
            out.println("<div class='message error'>Error: " + e.getMessage() + "</div>");
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

    // Display the form
    email = (String)session.getAttribute("email");
    if (email != null) {
        String url = "jdbc:mysql://localhost:3306/MEDI";
        String dbUser = "root";
        String dbPassword = "root@123";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPassword);

            String sql = "SELECT * FROM doctor WHERE email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String password = rs.getString("password");
                String name = rs.getString("name");
                String phone = rs.getString("phone");
                String Age = rs.getString("Age");
                String Experiance = rs.getString("Experiance");
%>

<div class="form">
    <div class="container">
        <h2>Update Doctor Profile</h2>
        <form method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= name %>" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= email %>" required readonly>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= password %>" required>

            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" value="<%= phone %>" required>

            <label for="age">Age:</label>
            <input type="number" id="age" name="age" value="<%= Age %>" required min="25" max="80">

            <label for="experience">Experience (years):</label>
            <input type="number" id="experience" name="Experiance" value="<%= Experiance %>" required min="0" max="50">

            <input type="submit" value="Update Profile">
        </form>
    </div>
</div>

<%
            } else {
                out.println("<div class='message error'>Doctor profile not found.</div>");
            }
        } catch (Exception e) {
            out.println("<div class='message error'>Error: " + e.getMessage() + "</div>");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else {
        out.println("<div class='message error'>Please login first.</div>");
    }
%>

</body>
</html>
