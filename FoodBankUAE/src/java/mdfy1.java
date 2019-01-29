
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

public class mdfy1 extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String[] id = request.getParameterValues("idVal");
            
            String n=request.getParameter("qt");
            String unit=request.getParameter("unit");
            String mfd=request.getParameter("mfd");
            String exp=request.getParameter("exp");
            
            add a=new add(); 
            
            for (int i = 0; i < id.length; i++) {
            
                String[] spl = id[i].split(",");
                String rid=spl[0];
                String prod=spl[1];
                String qt=spl[2];
                
                a.add(rid,mfd,exp,n,unit);
            }
            
            
            RequestDispatcher rv=request.getRequestDispatcher("drvModify.jsp");
            rv.forward(request, response);
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
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(mdfy1.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(mdfy1.class.getName()).log(Level.SEVERE, null, ex);
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
            try {
                processRequest(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(mdfy1.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(mdfy1.class.getName()).log(Level.SEVERE, null, ex);
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

    
    
    
public class add
{
public void add(String rid,String mfd,String exp,String n,String unit)
{
    int rs=0;
             int sr=Integer.parseInt(n);
             int no1=Integer.parseInt(rid);
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.temp SET  MFD = ?, EXP = ?, QTY = ?, UNIT = ? WHERE ID = ?");
                    
                    st.setString(1, mfd);
                    st.setString(2, exp);
                    st.setInt(3, sr);
                    st.setString(4, unit);
                    st.setInt(5, no1);
                    rs = st.executeUpdate();  

                    if(rs>0)
                    {
                         System.out.println("Success");
                    }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
}
}
    
    
    

    
    
    
    
    
}
