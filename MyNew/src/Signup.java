import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Signup extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/proj","root","root");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String gender=request.getParameter("gender");
            String dob=request.getParameter("dob");
            String address=request.getParameter("address");
            PreparedStatement stmt=con.prepareStatement("insert into profile values(?,?,?,?,?,?,?)");
            stmt.setString(1,username);
            stmt.setString(2,password);
            stmt.setString(3,email);
            stmt.setString(4,phone);
            stmt.setString(5,gender);
            stmt.setString(6,dob);
            stmt.setString(7,address);
            int rs=stmt.executeUpdate();
            if(rs>0) {
                out.println("Registered Successfully "+username);
                RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
                rd.forward(request,response);
            }
            else
            {
                out.println("Wrong");
            }
            con.close();
            out.close();
        }catch(Exception e){ out.println(e);}






    }


}