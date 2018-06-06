<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
</head>
<body>
<ul>
    <li><a  href="index.jsp">Home</a></li>
    <li><a  class="active" href="search.jsp">Search</a></li>
    <li><a href="Notifications.jsp">Notifications</a></li>
</ul>
<form action="search.jsp" method="post">
    <p align="center">To Check Whether You Have Registered Any Course Or Not</p>
    <table align="center">
        <tr><td><label>Enter Name</label>
        </td><td><input type="text" name="name" placeholder="Enter Name" ></td></tr>
        <tr><td> <label>Enter ID Number</label></td><td><input type="text" name="number" placeholder="Enter Id No"></td></tr>
        <tr><td rowspan="2"><input type="submit" name="check" value="Check"></td></tr>
    </table>
</form>
<%
    try{

        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/course","root","root");
        String che = request.getParameter("check");
        if("Check".equals(che) && che!=null)
        {
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        PreparedStatement pp = con.prepareStatement("SELECT * from profile WHERE name =? and id=?");
        pp.setString(1,name);
        pp.setString(2,number);
            ResultSet rrt = pp.executeQuery();
            if(rrt.next())
            {%><p><%
    out.println("You Have Registered Successfully To "+rrt.getString("cours")+" with Id Number "+number);%></p><%
            }
            else {
%><p><%
    out.println("You Have Not Registered Any Course Till Now");%></p><%
            }
        }
        con.close();
        out.close();
    }catch(Exception e){ out.println(e);}
%>
</body>
</html>

