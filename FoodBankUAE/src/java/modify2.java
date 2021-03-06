

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


public class modify2 extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String ch=request.getParameter("upd");
            String id=request.getParameter("idVal");
            
            int ids=Integer.parseInt(id);
            
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
            Statement st = connection.createStatement();
            
            ResultSet rs = st.executeQuery("SELECT * FROM FDA.RECEIVE WHERE ID="+ids+" ");  
            
            while(rs.next())
            {
            switch (ch) {
                case "cat":
                    String cat=request.getParameter("category");
                    String prod=request.getParameter("product");
                    String brd=request.getParameter("brand");
                    upd1 a=new upd1();
                    a.upd1(cat, prod, brd, id);
                    break;
                case "mfd":
                    String mfd=request.getParameter("mfd");
                    upd2 b=new upd2();
                    b.upd2(mfd, id);
                    break;
                case "exp":
                    String exp=request.getParameter("exp");
                    upd3 c=new upd3();
                    c.upd3(exp, id);
                    break;
                case "qty":
                        
                            double qty=Double.parseDouble(request.getParameter("qt"));
                            upd4 d=new upd4();
                            d.upd4(qty, id,rs.getDouble("wt"));
                            break;
                        
                case "wt":
                        
                            double wt=Double.parseDouble(request.getParameter("wt"));
                            upd5 e=new upd5();
                            e.upd5(wt, id,rs.getDouble("nos"));
                            break;
                case "rj":
                        
                            double qt1=Double.parseDouble(request.getParameter("qt1"));
                            String cmt=request.getParameter("cmt");
                            double q=rs.getDouble("nos")-qt1;
                            upd6 f=new upd6();
                            f.upd6(qt1, id,rs.getDouble("wt"));
                            upd7 g=new upd7();
                            g.upd7(rs.getString("SUPPLIER"),rs.getString("BRANCH"),rs.getString("CALENDER"),rs.getString("FB_LOC"),rs.getString("CATEGORY"),rs.getString("PRODUCT"),rs.getString("BRAND"),rs.getString("MFD"),rs.getString("EXP"),q,rs.getDouble("wt"),cmt);
                            break;
                     
                default:
                    break;
            }
            }
            
            RequestDispatcher rv=request.getRequestDispatcher("userModify.jsp");
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
            Logger.getLogger(modify2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(modify2.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(modify2.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(modify2.class.getName()).log(Level.SEVERE, null, ex);
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

    
    
   
public class upd1
{
public void upd1(String cat,String prod,String brd,String rid)
{
    int rs=0;
             int no1=Integer.parseInt(rid);
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.RECEIVE SET CATEGORY = ?, PRODUCT = ?, BRAND = ? WHERE ID = ?");
                    
                    st.setString(1, cat);
                    st.setString(2, prod);
                    st.setString(3, brd);
                    st.setInt(4, no1);
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
    
public class upd2
{
public void upd2(String mfd,String rid)
{
    int rs=0;
             int no1=Integer.parseInt(rid);
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.RECEIVE SET MFD = ? WHERE ID = ?");
                    
                    st.setString(1, mfd);
                    st.setInt(2, no1);
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
 

public class upd3
{
public void upd3(String exp,String rid)
{
    int rs=0;
             int no1=Integer.parseInt(rid);
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.RECEIVE SET EXP = ? WHERE ID = ?");
                    
                    st.setString(1, exp);
                    st.setInt(2, no1);
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
    
public class upd4
{
public void upd4(double qty,String rid,double wt)
{
    int rs=0;
             int no1=Integer.parseInt(rid);
             double qt=qty*wt;
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.RECEIVE SET NOS = ?, QTY = ? WHERE ID = ?");
                    
                    st.setDouble(1, qty);
                    st.setDouble(2, qt);
                    st.setInt(3, no1);
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

public class upd5
{
public void upd5(double wt,String rid,double qty)
{
    int rs=0;
             int no1=Integer.parseInt(rid);
             double qt=qty*wt;
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.RECEIVE SET WT = ?, QTY = ? WHERE ID = ?");
                    
                    st.setDouble(1, wt);
                    st.setDouble(2, qt);
                    st.setInt(3, no1);
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

public class upd6
{
public void upd6(double qty,String rid,double wt)
{
    int rs=0;
             int no1=Integer.parseInt(rid);
             double qt=qty*wt;
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.RECEIVE SET NOS = ?, QTY = ? WHERE ID = ?");
                    
                    st.setDouble(1, qty);
                    st.setDouble(2, qt);
                    st.setInt(3, no1);
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

public class upd7
{
public void upd7(String sup,String loc,String date,String fbloc,String cat,String prod,String br,String mfd,String exp,double nos,double wt,String cmt)
{
    int rs=0;
             double qt=nos*wt;
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("INSERT INTO FDA.REJECT (VENDOR, V_LOC, RDATE, FBLOC, CATEGORY, PRODUCT, BRAND, MFD, EXP, QTY, NOS, WT, COMMENT) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                    
                    st.setString(1, sup);
                    st.setString(2, loc);
                    st.setString(3, date);
                    st.setString(4, fbloc);
                    st.setString(5, cat);
                    st.setString(6, prod);
                    st.setString(7, br);
                    st.setString(8, mfd);
                    st.setString(9, exp);
                    st.setDouble(10, qt);
                    st.setDouble(11, nos);
                    st.setDouble(12, wt);
                    st.setString(13, cmt);
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
