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
<form action="admin.jsp" method="post">
<table>
    <tr><td><label>To Add Course</label></td></tr>
    <tr><td><input type="text" name="courseinsert"  placeholder="Name of the Course To Add"></td> <td><input type="number" name="numberinsert" placeholder="Number of the Seats To Add"></td> <td><input type="submit" name="insert" value="Add Course"></td></tr>
    <tr><td><label>To Add Course</label></td></tr>
    <tr><td><input type="text" name="coursedelete" placeholder="Name of the Course To delete"></td> <td><input type="submit" name="delete" value="Delete Course"></td></tr>
    <tr><td><label>To Add Course</label></td></tr>
    <tr><td><input type="text" name="courseupdate" placeholder="Name of the Course To Decrease Seats"></td>  <td><input type="text" name="numberremove" placeholder="Number of the Seats To Delete"></td> <td><input type="submit" name="update" value="Update Course"></td></tr>
</table>
</form>
<%
    try{

        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/course","root","root");
        String val=request.getParameter("insert");
        String val1 = request.getParameter("delete");
        String val2 = request.getParameter("update");
        if(val!=null && "Add Course".equals(val))
        {
            String name =  request.getParameter("courseinsert");
            String number = request.getParameter("numberinsert");
            PreparedStatement pp = con.prepareStatement("insert into courses VALUES (?,?)");
            pp.setString(1,name);
            pp.setString(2,number);
            int r = pp.executeUpdate();
            if(r>0)
            {
                System.out.println(name+" Is Successfully Added");
            }
            else
            {
                out.println("SomeThing Went Wrong");
            }
        }
        else if(val1!=null && "Delete Course".equals(val1))
        {
            String name = request.getParameter("coursedelete");
            PreparedStatement ps = con.prepareStatement("delete from courses where cname =?");
            ps.setString(1,name);
            int r = ps.executeUpdate();
            if(r>0)
            {
                System.out.println(name+" Is Deleted Successfully");
            }
            else
            {
                out.println("SomeThing Went Wrong");
            }
        }
        else if( val2!=null && "Update Course".equals(val2))
        {

            String name = request.getParameter("courseupdate");
            String number = request.getParameter("numberremove");
            PreparedStatement ps = con.prepareStatement("Update courses set cnumber=? where cname =?");
            ps.setString(1,number);
            ps.setString(2,name);
            int r = ps.executeUpdate();
            if(r>0)
            {
                System.out.println(name+" Is Deleted Successfully");
            }
            else
            {
                out.println("SomeThing Went Wrong");
            }
        }

        con.close();
        out.close();
    }catch(Exception e){ out.println(e);}
%>
</body>
</html>
