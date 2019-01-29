<%-- 
    Document   : delUser
    Created on : 8 Dec, 2018, 11:23:52 AM
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
            <form action="delUser1.jsp" enctype="multipart/form-data">
                <label for="cat"><b>SELECT ENTRY TO DELETE</b></label>
                <div style="overflow-x:auto;"> 
          <table>
    <tr>
      <th>FIRST NAME</th>
      <th>LAST NAME</th>
      <th>COMPANY</th>
      <th>BRANCH</th>
      <th>USERNAME</th>
      <th>CONTACT</th>
      <th>EMAIL</th>
      <th>&nbsp;&nbsp;&nbsp;</th>
    </tr>
        <%
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("SELECT * FROM FDA.USERS where SCOPE='user' or SCOPE='store' or SCOPE='charity'  ");
	
	ResultSet rs = st.executeQuery();  

        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>");
            out.println(""+rs.getString("firstname")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("lastname")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("company")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("branch")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("username")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("tel")+"");
            out.println("</td>");
            out.println("<td>");
            out.println(""+rs.getString("email")+"");
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
   </br></br>
   </br></br>
                
            </form>
        </div>
    </body>
</html>
