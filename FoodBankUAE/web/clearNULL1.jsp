<%-- 
    Document   : clearNULL1
    Created on : 5 Dec, 2018, 4:17:14 AM
    Author     : Sajid
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: black;
}

* {
    box-sizing: border-box;
}

/* Add padding to containers */
.container {
    padding: 16px;
    background-color: white;
}

               input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 20%;
    opacity: 0.9;
}
input[type=submit],button:hover {
    opacity: 1;
}


table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>
    </head>
    <body>
        <form action="clearNULL1a">
        <%
    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st1 = conn.createStatement();
	
	ResultSet rs1 = st1.executeQuery("SELECT count(*) FROM FDA.RECEIVE WHERE SUPPLIER IS NULL OR BRANCH IS NULL  OR F_ID IS NULL OR CATEGORY IS NULL OR PRODUCT IS NULL OR BRAND IS NULL OR MFD IS NULL OR EXP IS NULL OR QTY IS NULL OR UNIT IS NULL OR FB_LOC IS NULL OR SIGNEE IS NULL OR CALENDER IS NULL OR SIGNATURE IS NULL");    
                while(rs1.next())
                {
                   out.println("<h1 style='color: white'>CURRENTLY THERE ARE "+rs1.getInt("1") +"  RECORDS</h1>");
                }
                %>
                
                 <div class="container">
      <div style="overflow-x:auto;"> 
          <table>
    <tr>
      <th>SUPPLIER</th>
      <th>BRANCH</th>
      <th>CATEGORY</th>
      <th>PRODUCT</th>
      <th>BRAND</th>
      <th>MFD</th>
      <th>EXP</th>
      <th>QUANTITY</th>
      <th>UNIT</th>
      <th>FB LOCATION</th>
      <th>CALENDER</th>
      
    </tr>
        <%
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("SELECT * FROM FDA.RECEIVE WHERE SUPPLIER IS NULL OR BRANCH IS NULL  OR F_ID IS NULL OR CATEGORY IS NULL OR PRODUCT IS NULL OR BRAND IS NULL OR MFD IS NULL OR EXP IS NULL OR QTY IS NULL OR UNIT IS NULL OR FB_LOC IS NULL OR SIGNEE IS NULL OR CALENDER IS NULL OR SIGNATURE IS NULL");
	
	ResultSet rs = st.executeQuery();  

        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>");
            out.println(""+rs.getString("SUPPLIER")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("BRANCH")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("CATEGORY")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("product")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("BRAND")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("mfd")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("exp")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getInt("qty")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("unit")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("FB_LOC")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("CALENDER")+"");
            out.println("</td>");
            out.println("</tr>");
        }
        %>
          </table>
      </div>
          <input type="submit" value="CLEAR ALL">
                 </div>
          </form>
    </body>
</html>
