

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class mdfy3 extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String ch=request.getParameter("upd");
            String id=request.getParameter("idVal");
            
            if(ch.equals("cat"))
            {
                String cat=request.getParameter("category");
                String prod=request.getParameter("product");
                String brd=request.getParameter("brand");
                
                upd1 a=new upd1();
                a.upd1(cat, prod, brd, id);
            }
            else if(ch.equals("mfd"))
            {
                String mfd=request.getParameter("mfd");
                upd2 b=new upd2();
                b.upd2(mfd, id);
            }
            else if(ch.equals("exp"))
            {
                String exp=request.getParameter("exp");
                upd3 c=new upd3();
                c.upd3(exp, id); 
            }
            else if(ch.equals("qty"))
            {
                double qty=Double.parseDouble(request.getParameter("qt"));
                upd4 d=new upd4();
                d.upd4(qty, id);
            }
            
            RequestDispatcher rv=request.getRequestDispatcher("userRcvMdfy.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.TEMP SET CATEGORY = ?, PRODUCT = ?, BRAND = ? WHERE ID = ?");
                    
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
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.TEMP SET MFD = ? WHERE ID = ?");
                    
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
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.TEMP SET EXP = ? WHERE ID = ?");
                    
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
public void upd4(double qty,String rid)
{
    int rs=0;
             int no1=Integer.parseInt(rid);
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("UPDATE FDA.TEMP SET QTY = ? WHERE ID = ?");
                    
                    st.setDouble(1, qty);
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
  





}
