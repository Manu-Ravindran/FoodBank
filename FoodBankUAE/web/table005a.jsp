<%-- 
    Document   : table005a
    Created on : 28 Nov, 2018, 9:28:15 PM
    Author     : Sajid
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .flex{
                    display: flex;
                    justify-content: center;
                    flex-flow: column;
                    align-items: center;
                    height: 100vh;
               }
        </style>
    </head>
    <body>
        
        <form action="table005b.jsp">
        <div class="flex">
            <label for="cat"><b>SELECT a D.O </b></label>
                <select name="fid" >
        <option>Select </option>
       <%
        String a=request.getParameter("date1");
    String b=request.getParameter("date2");
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("select distinct f_id, CHARITY_NAME,FB_LOC from FDA.delivered where calender>='"+a+"' and calender<='"+b+"'");
	
	ResultSet rs = st.executeQuery();  
        
        while(rs.next())
        {
             
             out.println("<option value='"+rs.getString("f_id")+"' >"+rs.getString("charity_name")+"--"+rs.getString("fb_loc")+"</option>");

             
        }
        %>
                </select>
            <input type="submit" value="GO">
        </div>
        </form>
    </body>
</html>
