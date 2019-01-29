

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177216)
public class forDrv extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            HttpSession session = request.getSession();
            Integer rid = (Integer)session.getAttribute("did");
            String cname = (String) session.getAttribute("cname");
            
            int rs=0;
            String dst=request.getParameter("nm");
            String time=request.getParameter("time");
            
            String date=request.getParameter("date");
            Part img=request.getPart("file");
            
            InputStream is=img.getInputStream();
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");  
            Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
            
            PreparedStatement ps=con.prepareStatement("update fda.delivered set status='delivered',dst=?,dtime=?,ddate=? where did =?"); 
            
            ps.setString(1, dst);
            ps.setString(2, time);
            ps.setString(3, date);
            ps.setInt(4, rid);
            
            PreparedStatement ps1=con.prepareStatement("insert into FDA.IMAGE(pic,did,signee,dst,ddate,dtime) values(?,?,?,?,?,?) "); 
            ps1.setBlob(1, is);
            ps1.setInt(2, rid);
            ps1.setString(3, cname);
            ps1.setString(4, dst);
            ps1.setString(5, date);
            ps1.setString(6, time);
            
            rs=ps.executeUpdate();  
            int rs1=ps1.executeUpdate();
            
            if(rs>0&&rs1>0)
            {
                RequestDispatcher rv=request.getRequestDispatcher("charity.jsp");
            rv.forward(request, response);
            }
            con.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(forDrv.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(forDrv.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(forDrv.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(forDrv.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
