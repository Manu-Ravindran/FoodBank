<%-- 
    Document   : deleteSupplier
    Created on : 5 Dec, 2018, 1:30:11 AM
    Author     : Sajid
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>

               label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}
               input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 30%;
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
        <form action="deleteCharityA.jsp">
                <label for="cat"><b>ENTRY DELETE</b></label>
                <div style="overflow-x:auto;"> 
          <table>
    <tr>
      <th>CHARITY NAME</th>
      <th></th>
    </tr>
        <%
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("SELECT * from FDA.charity  ");
	ResultSet rs = st.executeQuery();  

        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>");
            out.println(""+rs.getString("CNAME")+"");
            out.println("</td>");
            out.println("<td>");
            out.println("<input type='checkbox' name='idValue' value='"+rs.getInt("id")+"'>");
            
            out.println("</td>");
            out.println("</tr>");
        }
        %>
          </table>
          <input type="submit" value="DELETE">
               
        </div>
        </form>
    </body>
</html>
