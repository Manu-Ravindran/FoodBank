<%-- 
    Document   : signUpVendorA
    Created on : 6 Dec, 2018, 12:18:20 AM
    Author     : Sajid
--%>



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
        <%
            String no=request.getParameter("count"); 
    String buffer="<select name='product'><option value='-1'>Select a Vendor Location</option>";
     
    try
    {  
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = con.createStatement();
	 
	ResultSet r2 = st.executeQuery("SELECT * FROM FDA.supplier where s_name='"+no+"'");
        
        while(r2.next())
        {
            buffer=buffer+"<option value='"+r2.getString("s_branch")+"'>"+r2.getString("s_branch")+"</option>";
            
        }
        buffer=buffer+"</select>";
        response.getWriter().println(buffer);
    con.close();  
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
        %>
    </body>
</html>
