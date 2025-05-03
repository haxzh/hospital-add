<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    <style>
     .reg {
    background-color: #f2f2f2;
    height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
}
.container{
    max-width: 700px;
    width: 100%;
    background-color: #fff;
    padding: 25px 30px;
    border-radius: 5px;
    box-shadow: 0 5px 10px rgba(0,0,0,0.15);
  }
  .container .title{
    font-size: 25px;
    font-weight: 500;
    position: relative;
    margin-bottom: 50px;
    text-align: center;
  }

  .content form .user-details{
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    margin: 20px 0 12px 0;
  }
  form .user-details .input-box{
    margin-bottom: 15px;
    width: calc(100% / 2 - 20px);
  }
  form .input-box span.details{
    display: block;
    font-weight: 500;
    margin-bottom: 5px;
  }
  .user-details .input-box input{
    height: 45px;
    width: 100%;
    outline: none;
    font-size: 16px;
    border-radius: 5px;
    padding-left: 15px;
    border: 1px solid #ccc;
    border-bottom-width: 2px;
    transition: all 0.3s ease;
  }
  
  label {
    display: block;
    font-weight: 500;
    margin-bottom: 5px;
  }
   #selection {
    /* margin-top: 25px; */
    position: relative;
    display: inline-block;
    height: 45px;
    width: 100%;
    outline: none;
    font-size: 16px;
    border-radius: 5px;
    padding-left: 15px;
    border: 1px solid #ccc;
    border-bottom-width: 2px;
    transition: all 0.3s ease;
  }
    </style>
</head>
<body>

    <%
        String email = (String)session.getAttribute("pemail");
         
        String url = "jdbc:mysql://localhost:3306/MEDI";
        String dbUser = "root";
        String dbPassword = "root@123";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(url, dbUser, dbPassword);

            String sql = "SELECT * FROM patient WHERE email = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String password = rs.getString("password");
                String name = rs.getString("name");
                String Age = rs.getString("age");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");

    %>
    <div class="reg">

        <div class="container">
          <div class="title">Update Profile</div>
          <div class="content">
            <form action="PupdateProfile.jsp" method="get">
              <div class="user-details">
                <div class="input-box">
                  <span class="details">Full Name</span>
                  <input type="text" name="name" placeholder="Enter your name" value="<%= name %>" required>
                </div>
                <div class="input-box">
                  <span class="details">Email</span>
                  <input type="email" name="email" placeholder="Enter your email" value="<%= email %>" required>
                </div>
                <div class="input-box">
                  <span class="details">Phone Number</span>
                  <input type="text" name="phone" placeholder="Enter your number" value="<%= phone %>" required>
                </div>
                <div class="input-box">
                  <span class="details">Age</span>
                  <input type="text" name="age" placeholder="Enter your age" value="<%= Age %>" required>
                </div>
                <div class="input-box">
                  <span class="details">Password</span>
                  <input type="text" name="password" placeholder="Enter your password" value="<%= password %>" required>
                </div>
                <div class="input-box">
               <span class="details">Chosse option:</span>
              <select id="selection" name="gender" value="<%= gender %>">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
              </select>
            </div>
            <div class="button">
            <button type="submit" value="submit"
            style="background-color: rgb(136, 136, 241); color: white; padding: 15px 25px; border: none; margin-left: 20%; font-weight: 600; border-radius: 20px; "><a href="fetchSymptoms.jsp" style="text-decoration: none; color: white;">Back</a></button>
            </form>
          </div>
            <div class="button">
            <button type="submit" value="Update"
            style="background-color: rgb(136, 136, 241); color: white; padding: 15px 25px; border: none; margin-left: 20%; font-weight: 600; border-radius: 20px; ">Update</button>
            </form>
          </div>
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