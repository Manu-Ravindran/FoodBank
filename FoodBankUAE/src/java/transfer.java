

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
import javax.servlet.http.HttpSession;


public class transfer extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
            HttpSession session = request.getSession();
            Integer rid = (Integer)session.getAttribute("did");
            
            String uname = (String) session.getAttribute("uname");
            String fbloc = (String) session.getAttribute("fbloc");
            
            String date=request.getParameter("date");
            String name=request.getParameter("nm");
            String charity=request.getParameter("charity");
            String time=request.getParameter("time");
            add a=new add();
            in b=new in();
            updt c=new updt();
            
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection con3 = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    Statement str2 = con3.createStatement();
	 
                    ResultSet r3 = str2.executeQuery("SELECT  BRAND,CATEGORY,PRODUCT,sum(NOS)as x,sum(wt) as y,sum(QTY) as z  FROM FDA.RECEIVE where DID='"+rid+"' group by PRODUCT,CATEGORY,BRAND");
                    
                    while(r3.next())
                    {
                    
                            a.add(charity,fbloc,date,rid,r3.getString("CATEGORY"),r3.getString("PRODUCT"),r3.getString("BRAND"),r3.getDouble("z"),name,time,r3.getDouble("x"),r3.getDouble("y"));
                            b.in( r3.getString("product"), r3.getDouble("z"),fbloc);
                        
                        
                    }
                 
               c.updt(rid);
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
            Logger.getLogger(transfer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(transfer.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(transfer.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(transfer.class.getName()).log(Level.SEVERE, null, ex);
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
public void add(String charity,String fbloc,String date,int rid,String cat,String prod,String brand,double qt,String name,String time,double nos,double wt)
{
    int rs=0;
             String id=Integer.toString(rid);
                   
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("INSERT INTO FDA.DELIVERED (CHARITY_NAME, FB_LOC, CALENDER, F_ID, CATEGORY, PRODUCT, BRAND, QTY, UNIT, SIGNEE, TIME, NOS, WT) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'KG', ?, ?, ?, ?)");
                    st.setString(1, charity);
                    st.setString(2, fbloc);
                    st.setString(3, date);
                    st.setString(4, id);
                    st.setString(5, cat);
                    st.setString(6, prod);
                    st.setString(7, brand);
                    st.setDouble(8, qt);
                    st.setString(9, name);
                    st.setString(10, time);
                    st.setDouble(11, nos);
                    st.setDouble(12, wt);
                    
                    
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
public void in(String prod,double qt,String fbloc)
{
    int rs=0;
                   
            try
            {
                    java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    Statement str = con.createStatement();
	 
                    ResultSet r2 = str.executeQuery("SELECT bal_kg FROM FDA.INVENTORY where  product='"+prod+"' and fbloc='"+fbloc+"'");

                    if(r2.next())
                    {
                         double s=r2.getDouble("bal_kg")-qt;
                         PreparedStatement st = con.prepareStatement("update FDA.INVENTORY set BAL_KG=?, MODIFIED_DATE=? where  product=? and fbloc=?");
                         st.setDouble(1, s);
                         st.setDate(2, sqlDate);
                         st.setString(3, prod);
                         st.setString(4, fbloc);
                         rs = st.executeUpdate(); 
                    }
                    else
                    {
                        
                    }
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
}
}        



public class updt
{
public void updt(int rid)
{
    int rs=0;
                   
            try
            {
                    java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    
                         
                         PreparedStatement st = con.prepareStatement("UPDATE FDA.RECEIVE SET status='passive' where DID = ?");
                         st.setInt(1, rid);
                         rs = st.executeUpdate(); 
                    
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
}
}  


    
}
