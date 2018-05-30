import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Messages extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/proj","root","root");
            HttpSession s =  request.getSession();
            String username= (String) s.getAttribute("user");
            String reciever= (String) s.getAttribute("ree");
            String message = request.getParameter("message");
            PreparedStatement stmt=con.prepareStatement("insert into messages values(?,?,?)");
            stmt.setString(1,username);
            stmt.setString(2,reciever);
            stmt.setString(3,message);
            int rs=stmt.executeUpdate();
            if(rs>0) {
                out.println("Message Sent");
                RequestDispatcher rd=request.getRequestDispatcher("friends.jsp");
                rd.include(request,response);
            }


            con.close();
            out.close();
        }catch(Exception e){
            out.println(e);}






    }


}