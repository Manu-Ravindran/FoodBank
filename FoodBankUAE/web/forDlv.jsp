<%-- 
    Document   : forDlv
    Created on : 28 Nov, 2018, 4:08:15 AM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String no=request.getParameter("count"); 
    String buffer="<select name='product'><option value='-1'>Select Product</option>";
     
    try
    {  
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = con.createStatement();
	 
	ResultSet r2 = st.executeQuery("SELECT * FROM FDA.inventory where category='"+no+"'");
        
        while(r2.next())
        {
            buffer=buffer+"<option value='"+r2.getString("product")+"'>"+r2.getString("product")+"</option>";
            
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
