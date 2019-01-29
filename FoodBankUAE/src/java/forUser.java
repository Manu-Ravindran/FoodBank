

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177216)
public class forUser extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
            
            String nm1=request.getParameter("nm1");
            String nm2=request.getParameter("nm2");
            String dob=request.getParameter("dob");
            String tel=request.getParameter("tel");
            String email=request.getParameter("email");
            String fbloc=request.getParameter("fbloc");
            String pass1=request.getParameter("psw");
            String pass2=request.getParameter("psw2");
            
            Part img=request.getPart("file");
            
            InputStream is=img.getInputStream();
            
            
        if(pass1.equals(pass2))
        {
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("INSERT INTO FDA.USERS (FIRSTNAME, LASTNAME, DOB, TEL, EMAIL, COMPANY, BRANCH, USERNAME, PASSWORD, SCOPE, PIC) VALUES (?, ?,?,?,?, 'FDA', ?, ?,?, 'user',?)");
	st.setString(1, nm1);
        st.setString(2, nm2);
        st.setString(3, dob);
        st.setString(4, tel);
        st.setString(5, email);
        st.setString(6, fbloc);
        st.setString(7, email);
        st.setString(8, pass1);
        st.setBlob(9, is);
	int rs = st.executeUpdate();  

        if(rs>0)
        {
            out.println("SUCCESS");
        }
        }
        else
        {
            out.println("UNMATCHED PASSWORD ENTERED ");
        }
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
            Logger.getLogger(forUser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(forUser.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(forUser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(forUser.class.getName()).log(Level.SEVERE, null, ex);
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
