<%-- 
    Document   : DriverBt2
    Created on : 20 Nov, 2018, 8:34:05 PM
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
.next {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

.next:hover {
    opacity: 1;
}

/* Add a blue text color to links */
a {
    color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
    background-color: #f1f1f1;
    text-align: center;
}
</style>
</head>
<body>
<%
    String a=request.getParameter("bname");
    HttpSession v=request.getSession();
    v.setAttribute("branch", a);
%>
    
<%
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = con.createStatement();
	 
	ResultSet r2 = st.executeQuery("SELECT max(id) as x FROM FDA.IDEN");
        
        while(r2.next())
        {
        int num=r2.getInt("x");
        HttpSession q=request.getSession();
        q.setAttribute("idnm", num);
        }
        
        
    %>
<form action="session1.jsp">
  <div class="container">

    <hr>

        <label for="email"><b>SELECT BRANCH LOCATION</b></label>
    
    <select name="bloc">
        <option>Select a Location</option>
        <%
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement statement = connection.createStatement();
	 
	ResultSet rs = statement.executeQuery("SELECT * FROM FDA.supplier where s_name='"+a+"'");  

        while(rs.next())
        {
            out.println("<option value='"+rs.getString("s_branch")+"'>"+rs.getString("s_branch")+"</option>");
        
        
        
        }
        
        %>
    </select>
  
    
    <hr>

        <label for="fb"><b>TO FOOD BANK LOCATION</b></label>
    
    <select name="fbloc">
        <option>Select a Location</option>
        <%
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st1 = con1.createStatement();
	 
	ResultSet rs1 = st1.executeQuery("SELECT * FROM FDA.FBLOC ");  

        while(rs1.next())
        {
            out.println("<option value='"+rs1.getString("fb_name")+"'>"+rs1.getString("fb_name")+"</option>");
            
 
        
        }
        
        %>
    </select>
    <hr>
    <button type="submit" class="next">NEXT</button>
  </div>
  
</form>

</body>
</html>
