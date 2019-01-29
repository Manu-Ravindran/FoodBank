<%-- 
    Document   : print3
    Created on : 8 Dec, 2018, 6:10:59 AM
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
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

button {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 20%;
    opacity: 0.9;
}

button:hover {
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
  <div class="container">
      <div style="overflow-x:auto;"> 
          <table>
    <tr>
      <th>CATEGORY</th>
      <th>PRODUCT</th>
      <th>QUANTITY</th>
      <th>UNIT</th>
    </tr>
        <%
        Integer rid = (Integer) session.getAttribute("idnm");
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("SELECT * from FDA.temp where f_id=?  ");
	st.setInt(1, rid);
	ResultSet rs = st.executeQuery();  

        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>");
            out.println(""+rs.getString("category")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("product")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getDouble("qty")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("unit")+"");
            out.println("</td>");
            out.println("</tr>");
        }
        %>
          </table>
          <button type="button" onclick="window.location.replace('userRcvMdfy.jsp')"> CHANGE</button>&nbsp;&nbsp;
              <button type="button" onclick="window.location.replace('userRcvDel.jsp')"> DELETE</button>&nbsp;&nbsp;
              <button type="button" onclick="window.location.replace('userRcv1b.jsp')"> ADD MORE</button>&nbsp;&nbsp;
              <form action="db2">
              <button type="submit" > CONFIRM</button>
              </form>
         </div>
      </div>
    </body>
</html>
