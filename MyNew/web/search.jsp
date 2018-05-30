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
    <li><a  href="profile.jsp">My Profile</a></li>
    <li><a href="friends.jsp">Friends</a></li>
    <li><a href="request.jsp">Requests</a></li>
    <li><a href="messages.jsp">Notifications</a></li>
    <li><a class="active" href="search.jsp">Search</a></li>
    <li><a href="index.jsp">Log Out</a></li>
</ul>
<form action="search.jsp" method="post">
    <label>Search Profile</label>
    <input type="text" name="search" required placeholder="Search...">
    <input type="submit" value="Search">
</form>
<%
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
            PreparedStatement stmt= connection.prepareStatement("INSERT into friends VALUES(?,?,'0') ");
            String username = (String) session.getAttribute("user");
            String friend = (String) session.getAttribute("search");
            stmt.setString(1,username);
            stmt.setString(2,friend);
            int rs=stmt.executeUpdate();
            if(rs>0) { }
            else {
                out.println("NOT INSERTED");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    %>
    <%
        try{
            connection = DriverManager.getConnection(connectionUrl, userId, password);
            String search = request.getParameter("search");
            HttpSession sessions=request.getSession();
            int ss =100;
            sessions.setAttribute("search",search);
            PreparedStatement statement = connection.prepareStatement("SELECT * from friends WHERE (username=? and friend=?) or (username=? and friend=?)");
            String username = (String) session.getAttribute("user");
            statement.setString(1,username);
            statement.setString(2,search);
            statement.setString(4,username);
            statement.setString(3,search);
            ResultSet ree = statement.executeQuery();
            if(ree.next())
            {
                int kk = ree.getInt("flag");
                if(kk==1){
                    ss=kk;
                }
                else if(kk==0)
                {
                    ss=kk;
                }
            }

            PreparedStatement stmt= connection.prepareStatement("SELECT * from profile WHERE username=?");
            stmt.setString(1,search);
            resultSet = stmt.executeQuery();
            if(resultSet.next()){
    %>
    <tr bgcolor="#fff">
        <td><b>Username</b></td>
        <td><%=resultSet.getString("username") %></td>
    </tr>
    <tr bgcolor="#fff">
        <td><b>Name</b></td>
        <td><%=resultSet.getString("password") %></td>
    </tr>
    <tr bgcolor="#fff">
        <td><b>email</b></td>
        <td><%=resultSet.getString("email") %></td>
    </tr>
    <tr bgcolor="#fff">
        <td><b>phone</b></td>
        <td><%=resultSet.getString("phone") %></td>
    </tr>
    <tr bgcolor="#fff">
        <td><b>gender</b></td>
        <td><%=resultSet.getString("gender") %></td>
    </tr>
    <tr bgcolor="#fff">
        <td><b>dob</b></td>
        <td><%=resultSet.getString("dob") %></td>
    </tr>
    <tr bgcolor="#fff">
        <td><b>address</b></td>
        <td><%=resultSet.getString("address") %></td>
    </tr>
    <%if(ss==0) {
        out.println("REQUEST ALREADY SEND");
    }
    else if(ss==1)
    {
        out.println("Your Friend");
    }
    else{%>
    <form action="search.jsp" method="post">
    <input type="Submit" value="Send Friend Request">
    </form>
    <%

                }   }
            else
                {
                    out.println("User Not Found");
                }
connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
