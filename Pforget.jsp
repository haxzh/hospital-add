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
    <form action="Pforget.jsp" method="get">
        <label for="email">Enter your email</label>
        <input type="text" id="email" name="email" >
        <button type="submit" value="submit">Submit</button>
        <button type="submit"><a href="Plogin.html" style="text-decoration: none; color: white;">Back</a></button>
    </form>



<%
    String s1 = request.getParameter("email");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Change if using a different database
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/medi", "root", "root@123");

        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Patient WHERE email=?");
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

<!-- <%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Recovery</title>
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
            width: 400px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
        }
        .container input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        button {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button[type="submit"] {
            background-color: #4CAF50;
            color: white;
        }
        .back-btn {
            background-color: #6c757d;
            color: white;
            text-decoration: none;
        }
        .message {
            margin-top: 15px;
            padding: 10px;
            border-radius: 5px;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="form">
        <div class="container">
            <h2>Password Recovery</h2>
            <form action="Pforget.jsp" method="post">
                <label for="email">Enter your email address:</label>
                <input type="email" id="email" name="email" required>
                
                <div class="button-group">
                    <button type="submit">Submit</button>
                    <a href="Plogin.html" class="back-btn">Back to Login</a>
                </div>
            </form>

            <%
                String email = request.getParameter("email");
                if (email != null && !email.isEmpty()) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Vineet@098");

                        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Patient WHERE email=?");
                        pstmt.setString(1, email);
                        
                        ResultSet rs = pstmt.executeQuery();
                        if (rs.next()) {
                            // In a real application, you would:
                            // 1. Generate a reset token
                            // 2. Send an email with reset link
                            // 3. Never show the password
                            
                            // This is just for demonstration:
                            String maskedPassword = "******"; // Mask the actual password
            %>
                            <div class="message success">
                                Password reset instructions have been sent to your email.
                                <br><br>
                                <strong>Note: In a real application, we would never display passwords.</strong>
                            </div>
            <%
                        } else {
            %>
                            <div class="message error">
                                No account found with that email address.
                            </div>
            <%
                        }
                        conn.close();
                    } catch (Exception e) {
            %>
                        <div class="message error">
                            An error occurred. Please try again later.
                        </div>
            <%
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </div>
</body>
</html> -->