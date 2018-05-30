import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Request extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/proj","root","root");
            String op = request.getParameter("Acceptt");
            String opp = request.getParameter("Rejectt");
            if(op.equals("Accept")) {
                PreparedStatement st = con.prepareStatement("UPDATE  friends set flag=? WHERE username=? and friend=?");
                HttpSession session = request.getSession();
                String usernam = (String) session.getAttribute("user");
                HttpSession sessi = request.getSession();
                String sear = request.getParameter("friendd");
                int d = 1;
                st.setInt(1, d);
                st.setString(2, sear);
                st.setString(3, usernam);
                int rq = st.executeUpdate();
                if (rq > 0) {
                    request.getRequestDispatcher("friends.jsp").include(request, response);
                }
            }
            con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

    }


}