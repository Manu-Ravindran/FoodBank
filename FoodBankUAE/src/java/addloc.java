

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
public class addloc extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            
            int rs=0;
            String floc=request.getParameter("floc");
            String st=request.getParameter("st");
            
            String log=request.getParameter("log");
            String lat=request.getParameter("lat");
            
            
            String date=request.getParameter("date");
            String time=request.getParameter("time");
            String usr=request.getParameter("usr");
            
            Part img=request.getPart("file1");

            Part img2=request.getPart("file2");
            Part img3=request.getPart("file3");
            InputStream is=img.getInputStream();
            InputStream is2=img2.getInputStream();
            InputStream is3=img3.getInputStream();
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");  
            Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
            
            PreparedStatement ps=con.prepareStatement("insert into FDA.FR_REP(IDNO,STATUS,LOG,LAT,PIC,PIC2,PIC3,DATEIN,TIMEIN,USERID) values(?,?,?,?,?,?,?,?,?,?)"); 
            
            ps.setString(1, floc);
            ps.setString(2, st);
            ps.setString(3, log);
            ps.setString(4, lat);
            ps.setBlob(5, is);
            ps.setBlob(6, is2);
            ps.setBlob(7, is3);
            ps.setString(8, date);
            ps.setString(9, time);
            ps.setString(10, usr);
            
            rs=ps.executeUpdate();  
            
            if(rs>0)
            {
               RequestDispatcher rv=request.getRequestDispatcher("fdi.jsp");
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
            Logger.getLogger(addloc.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addloc.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(addloc.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(addloc.class.getName()).log(Level.SEVERE, null, ex);
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
