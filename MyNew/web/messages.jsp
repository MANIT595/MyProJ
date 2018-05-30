<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inbox</title>
    <link rel="stylesheet" href="Stylee.css">
</head>
<body>
<ul>
    <li><a href="welcome.jsp">Home</a></li>
    <li><a  href="profile.jsp">My Profile</a></li>
    <li><a href="friends.jsp">Friends</a></li>
    <li><a href="request.jsp">Requests</a></li>
    <li><a class="active" href="messages.jsp">Notifications</a></li>
    <li><a href="search.jsp">Search</a></li>
    <li><a href="index.jsp">Log Out</a></li>
</ul>
<form method="post" action="messages.jsp">
    <input type="text" placeholder="Enter Notification" name="notification" required>
    <input type="submit" value="Send" name="Sendd">
</form>
<%

    try{

        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/proj","root","root");
        PreparedStatement se = con.prepareStatement("SELECT * from notification");
        ResultSet s = se.executeQuery();
        while (s.next())
        {
            out.println(s.getString("username")); out.println("--------------");  out.println(s.getString("notification"));%><BR><Br><%
        }
        String nn = request.getParameter("Sendd");
        if(nn.equals("Send")) {
            HttpSession ss = request.getSession();
            String username = (String) ss.getAttribute("user");
            String notification = request.getParameter("notification");
            PreparedStatement sss = con.prepareStatement("insert into notification VALUES (?,?)");
            sss.setString(1, username);
            sss.setString(2, notification);
            int es = sss.executeUpdate();
            if (es > 0) {
                response.setIntHeader("Refresh", 1);
            }

        }

        con.close();
        out.close();
    }catch(Exception e){ //out.println(e);
    }
%>
</body>
</html>
