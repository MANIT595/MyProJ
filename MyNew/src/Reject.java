import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Reject extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/proj","root","root");
            String opp = request.getParameter("Rejectt");
            if(opp.equals("Reject"))
            {
                PreparedStatement st = con.prepareStatement("delete from  friends WHERE friend=? and username=? and flag=?");
                HttpSession session = request.getSession();
                String usernam = (String) session.getAttribute("user");
                int nn =0;
                String sear = request.getParameter("frienddd");
                st.setString(1, usernam);
                st.setString(2, sear);
                st.setInt(3, nn);
                int rq = st.executeUpdate();
                if (rq > 0) {
                    request.getRequestDispatcher("request.jsp").include(request, response);
                }

            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}