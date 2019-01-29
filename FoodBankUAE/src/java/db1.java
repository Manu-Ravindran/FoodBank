

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
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


public class db1 extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String fbloc=request.getParameter("fbloc");
            
            add a=new add();
            
            HttpSession session = request.getSession();
            
            String sname = (String) session.getAttribute("sname");
            String vendor = (String) session.getAttribute("vnm");
            String sloc = (String) session.getAttribute("sloc");
            Integer rid = (Integer) session.getAttribute("idnm");
            String id=Integer.toString(rid);
            
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
            PreparedStatement st = connection.prepareStatement("SELECT * from FDA.temp where f_id=?  ");
            st.setString(1, id);
            ResultSet rs = st.executeQuery();  

            while(rs.next())
            {
            
            a.add(vendor,sloc,id,rs.getString("category"),rs.getString("product"),rs.getString("brand"),rs.getString("mfd"),rs.getString("exp"),rs.getDouble("qty"),rs.getString("unit"),rs.getString("calender"),sname,rs.getDouble("nos"),rs.getDouble("wt"),fbloc);
            }
            
            
            RequestDispatcher s=request.getRequestDispatcher("store.jsp");
            s.forward(request, response);
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
                Logger.getLogger(db1.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(db1.class.getName()).log(Level.SEVERE, null, ex);
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
                Logger.getLogger(db1.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(db1.class.getName()).log(Level.SEVERE, null, ex);
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
public void add(String bh,String bl,String id,String cat,String prod,String brand,String mfd,String exp,double qt,String unit,String date,String emp,double nos,double wt,String fbloc)
{
    int rs=0;
             
                   
            try
            {
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("INSERT INTO FDA.RECEIVE (SUPPLIER, BRANCH, F_ID, CATEGORY, PRODUCT, BRAND, MFD, EXP, QTY, UNIT, CALENDER, SIGNEE,EMP, NOS, WT, FB_LOC) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                    st.setString(1, bh);
                    st.setString(2, bl);
                    st.setString(3, id);
                    st.setString(4, cat);
                    st.setString(5, prod);
                    st.setString(6, brand);
                    st.setString(7, mfd);
                    st.setString(8, exp);
                    st.setDouble(9, qt);
                    st.setString(10, unit);
                    st.setString(11, date);
                    st.setString(12, emp);
                    st.setString(13, emp);
                    st.setDouble(14, nos);
                    st.setDouble(15, wt);
                    st.setString(16, fbloc);
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
