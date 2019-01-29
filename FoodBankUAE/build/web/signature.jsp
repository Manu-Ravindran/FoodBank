<%-- 
    Document   : sign
    Created on : 16 Nov, 2018, 4:32:03 PM
    Author     : Sajid
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  


  <title>CONFIRM</title>

  <style>
body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: black;
}

* {
    box-sizing: border-box;
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

select:focus {
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

input[type=submit] :hover {
    opacity: 1;
}


</style>
  
</head>

<body onselectstart="return false">
    
<form action="db1" method="POST"> 
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
<input type="submit" value="submit"/>

</form>





</body>

</html>
