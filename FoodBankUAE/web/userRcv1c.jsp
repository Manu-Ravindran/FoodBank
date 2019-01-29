<%-- 
    Document   : userRcv1c
    Created on : 8 Dec, 2018, 6:10:17 AM
    Author     : Sajid
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String bh = (String) session.getAttribute("vnm");
            String bl = (String) session.getAttribute("sloc");
            
            Integer rid = (Integer) session.getAttribute("idnm");
            String id=Integer.toString(rid);
            
            String cat=request.getParameter("category");
            String prod=request.getParameter("product");
            
            double qy=Double.parseDouble(request.getParameter("qt"));
            
            String brand=request.getParameter("brand");
            String unit=request.getParameter("unit");
            String mfd=request.getParameter("mfd");
            String exp=request.getParameter("exp");
            String date=request.getParameter("date");
            
            
            
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                    Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                    PreparedStatement st = connection.prepareStatement("INSERT INTO FDA.TEMP (SUPPLIER, BRANCH, F_ID, CATEGORY, PRODUCT, BRAND, MFD, EXP, QTY, UNIT, CALENDER) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
                    st.setString(1, bh);
                    st.setString(2, bl);
                    st.setString(3, id);
                    st.setString(4, cat);
                    st.setString(5, prod);
                    st.setString(6, brand);
                    st.setString(7, mfd);
                    st.setString(8, exp);
                    st.setDouble(9, qy);
                    st.setString(10, unit);
                    st.setString(11, date);
                    int rs = st.executeUpdate();  

                    if(rs>0)
                    {
                         System.out.println("Success");
                    }
                    RequestDispatcher r=request.getRequestDispatcher("print3.jsp");
                    r.forward(request, response);
        %>
    </body>
</html>
