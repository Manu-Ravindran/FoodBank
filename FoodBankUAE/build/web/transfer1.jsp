<%-- 
    Document   : deliverDelete
    Created on : 28 Nov, 2018, 6:17:18 AM
    Author     : Sajid
--%>

<%@page import="java.sql.Statement"%>
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
/* Full-width input fields */
select {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}
input {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}
input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

/* Overwrite default styles of hr */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for the submit button */
input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

input[type=submit]:hover {
    opacity: 1;
}

/* Add a blue text color to links */
a {
    color: dodgerblue;
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
            <form action="transfer1b.jsp">
                <label for="cat"><b>SELECT AN ENTRY</b></label>
                <div style="overflow-x:auto;"> 
          <table>
    <tr>
      <th>ID</th>
      <th>SUPPLIER</th>
      <th>BRANCH</th>
      <th>QTY</th>
      <th></th>
    </tr>
       <%
           String loc = (String) session.getAttribute("fbloc");
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("SELECT f_id,SUPPLIER,BRANCH,sum(qty) as x from FDA.receive where status='ACTIVE' and FB_LOC='"+loc+"' group by F_ID,SUPPLIER,BRANCH");

	ResultSet rs = st.executeQuery();  
        
        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>");
            out.println(""+rs.getString("F_ID")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("SUPPLIER")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("BRANCH")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getDouble("x")+"");
            out.println("</td>");
            out.println("<td>");
            out.println("<input type='checkbox' name='idVal2' value='"+rs.getString("F_ID")+"'>");
            
            out.println("</td>");
            out.println("</tr>");
        }
       
        %>
              </table>  
        
              <%

        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st1 = con.createStatement();
	 
	ResultSet r2 = st1.executeQuery("SELECT max(id) as x FROM FDA.IDEN2");
        
        while(r2.next())
        {
        int num=r2.getInt("x");
        HttpSession q=request.getSession();
        q.setAttribute("did", num);
        }
    %>
   
   </br></br>
   <input type="submit" value="NEXT"/>
   </br></br>
                
            </form>
        </div>
    </body>
</html>

