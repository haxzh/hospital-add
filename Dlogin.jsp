<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String username = request.getParameter("email");
    String password = request.getParameter("password");

    boolean isValidUser = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Change if using a different database
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MEDI", "root", "root@123");

        PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM doctor WHERE email=? AND password=?");
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            isValidUser = true;
            String p1 = rs.getString(4);
            session.setAttribute("user" , p1);
            String p2 = rs.getString(1);
            session.setAttribute("email" , p2);
            
        }
    } catch (Exception e) {
        e.printStackTrace();
    } 

    if (isValidUser) {
       response.sendRedirect("AfterD.jsp");
    } else {
        out.println("Invalid username or password.");
        //response.sendRedirect("login.html");
    }
%>
<a href="Dlogin.html">Go to Home Page</a>
