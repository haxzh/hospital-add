<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
if (session.getAttribute("user") == null) {
    // If not logged in, redirect to login page
    response.sendRedirect("Index.html");
    return;
}%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dropdown Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-danger fixed-top ">
        <div class="container-fluid">
          <a class="navbar-brand navbar-danger fs-3" href="#">Hospital+</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse  navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav fs-4">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa-solid fa-user-doctor"></i>
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="pProfile.jsp">Profile</a>
                        <a class="dropdown-item" href="logout.jsp">Logout</a>
                      </div>
                    </li>
                  </ul>
            </div>
          </div>
        </div>
      </nav>



      <h1 style="position: absolute; top: 80px;">Welcome  <%=session.getAttribute("user")%></h1>
    <div class="form-container">
        <form action="submitSymptoms.jsp" method="get">
            <div class="dropdown">
                <h3>Patient Health</h3>
                <input class="form-control form-control" type="text" placeholder="Enter your name" name="name" aria-label=".form-control-lg example" style="margin-bottom: 20px;">
                <input class="form-control form-control" type="text" placeholder="Enter your age" name="age" aria-label=".form-control-lg example" style="margin-bottom: 20px;">
                <select class="form-select" aria-label="Default select example" name="sy1">
                    <option value="null">select a value</option>
                    <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MEDI", "root", "root@123");
                            stmt = conn.createStatement();
                            String sql = "SELECT symtons_1 FROM disease";
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                String symptom = rs.getString("symtons_1");
                                out.println("<option value='" + symptom + "'>" + symptom + "</option>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                  </select>
            
            <div class="dropdown">
                <select class="form-select" aria-label="Default select example" name="sy2">
                    <option value="null">select a value</option>
                    <%
                        

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MEDI", "root", "root@123");
                            stmt = conn.createStatement();
                            String sql = "SELECT symtons_2 FROM disease";
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                String symptom = rs.getString("symtons_2");
                                out.println("<option value='" + symptom + "'>" + symptom + "</option>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                  </select>
            <div class="dropdown">
                <select class="form-select" aria-label="Default select example" name="sy3">
                    <option value="null">select a value</option>
                    <%
                        

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MEDI", "root", "root@123");
                            stmt = conn.createStatement();
                            String sql = "SELECT symtons_3 FROM disease";
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                String symptom = rs.getString("symtons_3");
                                out.println("<option value='" + symptom + "'>" + symptom + "</option>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } 
                    %>
                  </select>
            </div>
             <input type="submit" value="submit">
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html> 