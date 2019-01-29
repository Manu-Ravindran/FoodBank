

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


public class changeStatus1 extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
        String rid = request.getParameter("idVal2");
        add a=new add();
        in b=new in();
        
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery("select * from fda.receive where F_ID='"+rid+"'");  
        
        
        while(rs.next())
        {
        b.in(rs.getString("product"), rs.getDouble("qty"),rs.getString("fb_loc") ,rs.getString("category"));
        }
        
        a.add( rid);
        
        RequestDispatcher rv=request.getRequestDispatcher("fdi.jsp");
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
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(changeStatus1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(changeStatus1.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(changeStatus1.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(changeStatus1.class.getName()).log(Level.SEVERE, null, ex);
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
public void add(String id)
{
    int rs=0;
                   
            try
            {
                    java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.RECEIVE SET STATUS = 'ACTIVE' WHERE F_ID = ?");
                    
                    st.setString(1, id);
                    
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
    
    
    
public class in
{
public void in(String prod,double qy,String fbloc,String cat)
{
    int rs=0;
                   
            try
            {
                    java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    Statement str = con.createStatement();
	 
                    ResultSet r2 = str.executeQuery("SELECT bal_kg FROM FDA.INVENTORY where product='"+prod+"' and fbloc='"+fbloc+"'");

                    if(r2.next())
                    {
                         double s=r2.getDouble("bal_kg")+qy;
                         PreparedStatement st = con.prepareStatement("update FDA.INVENTORY set BAL_KG=?, MODIFIED_DATE=? where  product=? and fbloc=?");
                         st.setDouble(1, s);
                         st.setDate(2, sqlDate);
                         st.setString(3, prod);
                         st.setString(4, fbloc);
                         rs = st.executeUpdate(); 
                    }
                    else
                    {
                        PreparedStatement st = con.prepareStatement("INSERT INTO FDA.INVENTORY ( PRODUCT, BAL_KG, MODIFIED_DATE,CATEGORY, FBLOC) VALUES (?,?,?,?,?)");
                         
                         st.setString(1, prod);
                         st.setDouble(2, qy);
                         st.setDate(3, sqlDate);
                         st.setString(4, cat);
                         st.setString(5, fbloc);
                         rs = st.executeUpdate(); 
                    }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
}
}  



}
