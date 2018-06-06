<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Welcome</title>
    <link rel="stylesheet" type="text/css" href="mystyle.css">
  </head>
  <body>
  <ul>
    <li><a class="active" href="index.jsp">Home</a></li>
    <li><a href="search.jsp">Search</a></li>
    <li><a href="Notifications.jsp">Notifications</a></li>
  </ul>
  <div id = "display">
    <p align="center">Available Seats In Respective Courses</p>
  <table align="center">
    <tr>
  <%
    try{

      Class.forName("com.mysql.jdbc.Driver");
      Connection con= DriverManager.getConnection(
              "jdbc:mysql://localhost:3306/course","root","root");
      PreparedStatement pp = con.prepareStatement("SELECT  * from courses");
      ResultSet rss = pp.executeQuery();
      while (rss.next())
      {

  %><td><%out.println(rss.getString("cname"));%></td><td><%
      out.println(rss.getString("cnumber"));%></td></tr><%

    }
  %>
  </table>
  </div>
  <form action="index.jsp" method="post">
    <table align="center">
      <tr><td>Full Name :</td><td><input type="text" name="name" placeholder="Enter Your Name"></td></tr>
      <tr><td>Email :</td><td><input type="email" name="email" placeholder="Enter Your Email"></td></tr>
      <tr><td>Id No :</td><td><input type="number" pattern="[0-9]{5}" name="id" placeholder="Enter Your Id Number"></td></tr>
      <tr><td>Phone :</td><td><input type="number" name="phone" placeholder="Enter Your Phone Number"></td></tr>
      <tr><td>DOB :</td><td><input type="date" name="dob" placeholder="Enter Your Dob"></td></tr>
      <tr><td>Gender :</td><td><select name="gender"><option>Male</option><option>Female</option></select></td></tr>
      <tr><td>Course :</td><td><select name="course">
        <option>IOT</option>
        <option>Cyber Security</option>
        <option>CCNA</option>
        <option>ORACLE</option>
        <option>JAVA</option>
        <option>BIG DATA</option>
      </select></td></tr>
      <tr><td rowspan="2"><input type="submit" name="submit" value="Submit"></td></tr>
    </table>
  </form>
  <%
      String hello = request.getParameter("submit");
      if(hello!=null && "Submit".equals(hello)) {
        String username = request.getParameter("name");
        String password = request.getParameter("email");
        String email = request.getParameter("id");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String course = request.getParameter("course");
        PreparedStatement stmt = con.prepareStatement("insert into profile values(?,?,?,?,?,?,?)");
        stmt.setString(1, username);
        stmt.setString(2, password);
        stmt.setString(3, email);
        stmt.setString(4, phone);
        stmt.setString(5, dob);
        stmt.setString(6, gender);
        stmt.setString(7, course);
        int rs = stmt.executeUpdate();
        if (rs > 0) {
          PreparedStatement stm = con.prepareStatement("SELECT * from courses WHERE cname =?");
          stm.setString(1,course);
          ResultSet rrr = stm.executeQuery();
          if(rrr.next())
          {
              int number = (Integer.parseInt(rrr.getString("cnumber")));
              number--;
              String kk = String.valueOf(number);
            PreparedStatement st = con.prepareStatement("update courses set cnumber=? WHERE cname =?");
            st.setString(1,kk);
            st.setString(2,course);
            int rre = st.executeUpdate();
            if(rre>0)
            {

            }
          }%>
  <script>alert("You Have Successfully Registered")</script><%
            response.setIntHeader("Refresh", 0);
        } else {
          out.println("Wrong");
        }
        con.close();
        out.close();
      }
    }catch(Exception e){ %>
  <script>alert("You Have Already Registered")</script><%
          response.setIntHeader("Refresh", 0);}
  %>
  </body>
</html>
