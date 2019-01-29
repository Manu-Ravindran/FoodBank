
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class loginA extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String un=request.getParameter("uname");
            String pass=request.getParameter("psw");
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = connection.createStatement();
	
	ResultSet rs = st.executeQuery("SELECT ID,USERNAME,COMPANY,BRANCH,SCOPE FROM FDA.USERS where USERNAME='"+un+"' and PASSWORD='"+pass+"' ");  
        
        if(rs.next())
        {
            String iden=rs.getString("scope");
            
            switch(iden)
           {
                
               case "admin":
                            int id=rs.getInt("id");
                            HttpSession u=request.getSession();
                            u.setAttribute("ids", id);
                   
                   
                            RequestDispatcher p=request.getRequestDispatcher("admin.jsp");
                            p.forward(request, response);
                            
                            
                            break;
                            
               case "user": String unm=rs.getString("username");
                            String fbloc=rs.getString("branch");
                            int id1=rs.getInt("id");
                            
                            HttpSession v=request.getSession();
                            v.setAttribute("uname", unm);
                            v.setAttribute("fbloc", fbloc);
                            v.setAttribute("ids", id1);
                   
                           RequestDispatcher q=request.getRequestDispatcher("fdi.jsp");
                           q.forward(request, response);
                            break;
                            
               case "store":String snm=rs.getString("username");
                            String sven=rs.getString("company");
                            String sloc=rs.getString("branch");
                            int id2=rs.getInt("id");
                            
                            HttpSession x=request.getSession();
                            x.setAttribute("sname", snm);
                            x.setAttribute("vnm", sven);
                            x.setAttribute("sloc", sloc);
                            x.setAttribute("ids", id2);
                   
                   
                            RequestDispatcher r=request.getRequestDispatcher("store.jsp");
                            r.forward(request, response);
                            break;
                            
             case "charity":String cnm=rs.getString("username");
                            int id3=rs.getInt("id");
                            
                            HttpSession y=request.getSession();
                            y.setAttribute("cname", cnm);
                            y.setAttribute("ids", id3);
             
                            RequestDispatcher s=request.getRequestDispatcher("charity.jsp");
                            s.forward(request, response);
                            break;
               default:out.println("INVALID CREDENTIALS");
                        break;
                
           }
        }
        else
        {
            RequestDispatcher s1=request.getRequestDispatcher("login2.jsp");
             s1.forward(request, response);
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
            Logger.getLogger(loginA.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginA.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(loginA.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginA.class.getName()).log(Level.SEVERE, null, ex);
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
