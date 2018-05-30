import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Signin extends HttpServlet {
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
            PreparedStatement stmt=con.prepareStatement("select password from profile where username=? and password=?");
            stmt.setString(1,username);
            stmt.setString(2,password);
            ResultSet rs=stmt.executeQuery();
            if(rs.next()) {
                HttpSession session=request.getSession();
                session.setAttribute("user",username);
                session=request.getSession(false);
                if(session!=null){
                   response.sendRedirect("welcome.jsp");
                }
                else{
                    out.print("Please login first");
                    request.getRequestDispatcher("index.jsp").include(request, response);
                }


            }
                else {
                PreparedStatement stm = con.prepareStatement("select password from profile where username=?");
                stm.setString(1, username);
                ResultSet rss = stm.executeQuery();
                if (rss.next()) {
                    out.println("Please Recheck Your Password " + username);
                  request.getRequestDispatcher("index.jsp").include(request,response);
                } else {
                    out.println("Please Register First");
                    request.getRequestDispatcher("signup.jsp").include(request,response);

                }
            }
            con.close();
            out.close();
        }catch(Exception e){ out.println(e);}






    }


}