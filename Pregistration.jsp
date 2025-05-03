
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body bgcolor="clay">
    <%

   String name = request.getParameter("name");
   String email = request.getParameter("email");
   String phone = request.getParameter("phone");
   int age = Integer.parseInt(request.getParameter("age"));
   String password = request.getParameter("pass");
   String gender = request.getParameter("gender");

    try {   
            
        Class.forName("com.mysql.cj.jdbc.Driver");
        out.println("ok");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MEDI", "root", "root@123");

        PreparedStatement pst = con.prepareStatement("insert into Patient(email , password , name , age, gender, phone) values(?,?,?,?,?,?)");
        pst.setString(1, email);
        pst.setString(2, password);
        pst.setString(3, name);
        pst.setInt(4, age);
        pst.setString(5, gender);
        pst.setString(6, phone);
        int result = pst.executeUpdate();

       if(result > 0)
       {
        response.sendRedirect("Plogin.html");
       } else {
        out.print("unseccussfully");
       }
    
    } catch (ClassNotFoundException e) {
        out.println("Driver problem");
    } catch (SQLException e) {
        out.println("Empid already exits " + e);
    }

    
    %>
   
</body>
</html>