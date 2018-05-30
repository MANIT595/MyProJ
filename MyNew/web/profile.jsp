<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>My Profile</title>
    <link rel="stylesheet" href="Stylee.css">
</head>
<body>
<ul>
    <li><a href="welcome.jsp">Home</a></li>
    <li><a class="active" href="profile.jsp">My Profile</a></li>
    <li><a href="friends.jsp">Friends</a></li>
    <li><a href="request.jsp">Requests</a></li>
    <li><a href="messages.jsp">Notifications</a></li>
    <li><a href="search.jsp">Search</a></li>
    <li><a href="index.jsp">Log Out</a></li>
</ul>
<%
    String id = request.getParameter("userId");
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/proj";
    String dbName ="proj";
    String userId = "root";
    String password = "root";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    ResultSet resultSet = null;
%>
<table align="center">
    <tr>

    </tr>
    <%
        try{
            connection = DriverManager.getConnection(connectionUrl, userId, password);
            PreparedStatement stmt= connection.prepareStatement("SELECT * from profile WHERE username=?");
            String username = (String) session.getAttribute("user");
            stmt.setString(1,username);
            resultSet = stmt.executeQuery();
            if(resultSet.next()){
    %>
    <tr>
        <td><b>Username</b></td>
        <td><%=resultSet.getString("username") %></td>
    </tr>
    <tr>
        <td><b>Name</b></td>
        <td><%=resultSet.getString("password") %></td>
    </tr>
    <tr>
        <td><b>email</b></td>
        <td><%=resultSet.getString("email") %></td>
    </tr>
    <tr>
        <td><b>phone</b></td>
        <td><%=resultSet.getString("phone") %></td>
    </tr>
    <tr>
        <td><b>gender</b></td>
        <td><%=resultSet.getString("gender") %></td>
    </tr>
    <tr>
        <td><b>dob</b></td>
        <td><%=resultSet.getString("dob") %></td>
    </tr>
    <tr>
        <td><b>address</b></td>
        <td><%=resultSet.getString("address") %></td>
    </tr>



    <%
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
