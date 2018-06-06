<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body>
<ul>
    <li><a  href="index.jsp">Home</a></li>
    <li><a href="search.jsp">Search</a></li>
    <li><a  class="active" href="Notifications.jsp">Notifications</a></li>
</ul>
<p align="center" >Notifications From Management</p>
<table align="center">
<form action="Notifications.jsp" method="post">
    <tr><td><label>
        Enter Notification:</label></td><td><input type="text" placeholder="Enter Notification" name="notification"></td></tr>
    <tr><td rowspan="2"><input type="submit" value="Send Notification" name="Send"></td></tr>
</form>
</table>
<table>
<%
    try{

        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/course","root","root");
        PreparedStatement po = con.prepareStatement("select * from notifications");
        ResultSet rw = po.executeQuery();
        while(rw.next())
        {%><tr><td><%
            out.println(rw.getString("admin"));%></td><td><%
    out.println("--------");%></td><td><%
            out.println(rw.getString("message"));%></td></tr><%
        }
        String vall = request.getParameter("Send");
        String val=request.getParameter("notification");
        if(vall!=null  && "Send Notification".equals(vall)) {
            if (val.isEmpty()) {
                out.println("Enter AnYthing But Not Empty");
            } else
            {
                PreparedStatement pp = con.prepareStatement("insert into notifications VALUES (?,?)");
                pp.setString(1, "admin");
                pp.setString(2, val);
                int r = pp.executeUpdate();
                if (r > 0) {
                    out.println("Notification Successfully Sent");
                    response.setIntHeader("Refresh", 0);
                } else {
                    out.println("SomeThing Went Wrong");
                }



            }
        }

        con.close();
        out.close();
    }catch(Exception e){ out.println(e);}
%>
</table>
</body>
</html>
