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
    <li><a href="profile.jsp">My Profile</a></li>
    <li><a href="friends.jsp">Friends</a></li>
    <li><a class="active" href="request.jsp">Requests</a></li>
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
            PreparedStatement stmt= connection.prepareStatement("SELECT username from friends where friend=? and flag=?");
            String username = (String) session.getAttribute("user");
            stmt.setString(1,username);
            int iny = 0;
            stmt.setInt(2,iny);
            String name;
            ResultSet rs=stmt.executeQuery();
            while(rs.next()) {
                name = rs.getString("username");
                HttpSession sessi=request.getSession();
                sessi.setAttribute("req",name);
                %>
    <tr>
        <td><%=rs.getString("username") %></td>
        <td><form method="post" action="Request"><input type="hidden" readonly value="<%=rs.getString("username")%>" name="friendd" hidden><input type="submit" name="Acceptt" value="Accept"></form></td> <td>
        <form method="post" action="Reject"><input type="hidden" readonly value="<%=rs.getString("username")%>" name="frienddd" hidden><input type="submit" name="Rejectt" value="Reject"></form></td>
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
