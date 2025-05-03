<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    <style>
        .form {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

.container {
    width: 50%;
    margin: auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(15, 13, 13, 0);
    margin-top: 50px;
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"],
input[type="email"],
input[type="password"],
input[type="tel"],
input[type="number"] {
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="submit"] {
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

    </style>
</head>
<body>

    <%
        String email = (String)session.getAttribute("email");
         
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
        <h2>Update Profile</h2>
        <form action="DupdateProfile.jsp" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= name %>" required><br>

            <label for="email">Email:</label>
            <input type="text" id="email" name="email" value="<%= email %>" required><br>

            <label for="password">Password:</label>
            <input type="text" id="password" name="password" value="<%= password %>" required><br>

            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" value="<%= phone %>" required><br>

            <label for="age">Age:</label>
            <input type="text" id="age" name="age" value="<%= Age %>" required><br>

            <label for="experience">Experience (years):</label>
            <input type="text" id="experience" name="Experiance"value="<%= Experiance %>"  required><br>

            <input type="submit" value="Update">
        </form>
    </div>
</div>
    <%
        } else {
            out.println("User profile not found.");
        }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } 
    %>
</body>
</html>
