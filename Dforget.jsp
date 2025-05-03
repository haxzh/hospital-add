<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .form {
    font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
}
.container {
    background-color: white;
    padding: 30px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
         label {
    display: block;
    margin-bottom: 5px;
    font-weight: 600;
}
.container input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
 button[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    
}
    </style>
</head>
<body>
    <div class="form">
        <div class="container">
    <form action="Dforget.jsp" method="get">
        <label for="email">Enter your email</label>
        <input type="text" id="email" name="email" >
        <button type="submit" value="submit">Search</button>
        <button type="submit"><a href="Dlogin.html" style="text-decoration: none; color: white;">Back</a></button>
    </form>



<%
    String s1 = request.getParameter("email");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Change if using a different database
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medi", "root", "Harsh@123");

        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM doctor WHERE email=?");
        pstmt.setString(1, s1);
        
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            
           %>
           <strong>Password : <%= rs.getString("password")%></strong>
           <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } 

%>
</div>
</div>
</body>
</html>