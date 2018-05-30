<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Message</title>
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
<form method="post" action="Messages">
    <input type="hidden" name="messagess" value="<%request.getParameter("hello");%>
<% HttpSession session1 = request.getSession();
session1.setAttribute("ree",request.getParameter("hello"));%>
">
    <input type="text" placeholder="Enter Message" name="message" required>
    <input type="submit" value="Send" name="Sendd">
</form>
<%
    try{

        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/proj","root","root");
        HttpSession ss =  request.getSession();
        String username= (String) ss.getAttribute("user");
        String reciever= (String) ss.getAttribute("ree");
        ss.setAttribute("rey",reciever);
        PreparedStatement sss = con.prepareStatement("select * from messages where (reciever=? and username=?) or (reciever=? and username=?)");
        sss.setString(1,username);
        sss.setString(2,reciever);
        sss.setString(3,reciever);
        sss.setString(4,username);
        ResultSet es = sss.executeQuery();
        while(es.next())
        {
            out.println(es.getString("username"));

%> ----- <% out.println(es.getString("message")); %><br> <br><%
        }
        con.close();
        out.close();
    }catch(Exception e){ //out.println(e);
    }
%>
</body>
</html>