<%@ page import = "java.sql.*"%>
<%
if (session.getAttribute("user") == null) {
    // If not logged in, redirect to login page
    response.sendRedirect("login.jsp");
    return;
}%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital+</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        * {
            font-family: Georgia, 'Times New Roman', Times, serif;
        }

        .main {
            text-align: center;
            padding-top: 70px;
        }
        
        .form {
           
            font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
        }

        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 50px;
        }
        .container form label {
            text-align: left;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 80%;
        }

        button:hover {
            background-color: #218838;
        }

        table {
            margin-bottom: 50px;
            margin-left: 10%;
            width: 80%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-danger">
        <a class="navbar-brand fs-3" href="#" >Hospital+</a>
        <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse fs-4" id="navbarNavDropdown">
          <ul class="navbar-nav">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa-solid fa-user-doctor"></i>
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <a class="dropdown-item" href="Dprofile.jsp">Profile</a>
                <a class="dropdown-item" href="logout.jsp">Logout</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>

    <div class="main">
        <h1>Welcome Doctor</h1>
        <h3><%=session.getAttribute("user")%></h3>

    </div>

    <h1 style="margin-top: 10px; text-align: left; padding-top: 20px;">Diseases List</h1>
    <button type="submit" style="justify-content: left;"><a href="AddMore.html" style="color: white; text-decoration: none;">Add More</a></button>
    <table>
        <tr>
            <th>Disease</th>
            <th>symtoms_1</th>
            <th>symtoms_2</th>
            <th>symtoms_3</th>
            <th>medicine</th>
            <th>Treatment</th>
            <th>notes</th>
        </tr>
        <%
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
           
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MEDI", "root", "root@123");
       
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM disease");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String disease = rs.getString(2);
                String symtoms_1 = rs.getString(3);
                String symtoms_2 = rs.getString(4);
                String symtoms_3 = rs.getString(5);
                String medicine = rs.getString(6);
                String treatement = rs.getString(7);
                String notes = rs.getString(8);
    %>
    <tr>
        <td><%= disease %></td>
        <td><%= symtoms_1 %></td>
        <td><%= symtoms_2 %></td>
        <td><%= symtoms_3 %></td>
        <td><%= medicine %></td>
        <td><%= treatement %></td>
        <td><%= notes %></td>
    </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
    %>
    </table>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>