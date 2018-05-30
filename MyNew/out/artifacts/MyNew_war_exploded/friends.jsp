<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Friends</title>
    <link rel="stylesheet" href="Stylee.css">
</head>
<body>
<ul>
    <li><a href="welcome.jsp">Home</a></li>
    <li><a  href="profile.jsp">My Profile</a></li>
    <li><a class="active" href="friends.jsp">Friends</a></li>
    <li><a href="request.jsp">Requests</a></li>
    <li><a href="messages.jsp">Notifications</a></li>
    <li><a href="search.jsp">Search</a></li>
    <li><a href="index.jsp">Log Out</a></li>
</ul>
<table>
    <%
        String driverName = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/proj";
        String userId = "root";
        String password = "root";
        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection connection = null;
    %>
    <%
        try {
            connection = DriverManager.getConnection(connectionUrl, userId, password);
            PreparedStatement stmt= connection.prepareStatement("SELECT * from friends where friend=? and flag=?");
            String username = (String) session.getAttribute("user");
            int m = 1;
            stmt.setString(1,username);
            stmt.setInt(2,m);
            ResultSet rs=stmt.executeQuery();
            while(rs.next()) {
    %>
    <tr>
        <td><%=rs.getString("username") %></td>
        <form method="post" action="message.jsp">
        <input type="hidden" name="hello" value="<%=rs.getString("username")%>" readonly>
        <td><input type="submit" value="Send message" ></form></td>
    </tr>

    <%
            }
connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
