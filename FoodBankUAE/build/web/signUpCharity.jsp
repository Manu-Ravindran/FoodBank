<%-- 
    Document   : signUpCharity
    Created on : 6 Dec, 2018, 12:49:19 AM
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
input[type=text],input[type=date], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

select {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}


input[type=text]:focus,input[type=date]:focus, input[type=password]:focus,select:focus {
    background-color: #ddd;
    outline: none;
}

/* Overwrite default styles of hr */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

.registerbtn:hover {
    opacity: 1;
}

/* Add a blue text color to links */
a {
    color: dodgerblue;
}


</style>
</head>
<body>

    <form action="addCharityEmp.jsp">
  <div class="container">
    <h1>Charity Employee Registration</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>
    
    <label for="nm1"><b>First Name</b></label>
    <input type="text" placeholder="Enter Name" name="nm1" required>
    
    <label for="nm2"><b>Last Name</b></label>
    <input type="text" placeholder="Enter Name" name="nm2" required>
    
    <label for="dob"><b>Date of Birth</b></label>
    <input type="date"  name="dob" required>
    
    <label for="tel"><b>Contact Number</b></label>
    <input type="text" placeholder="Enter Your Number with Area code" name="tel" required>

    <label for="email"><b>Email  (This will also be the USERNAME)</b></label>
    <input type="text" placeholder="Enter Email" name="email" required> 
    
    <label for="cname"><b>Charity Organization</b></label>
    <select name="cname" >
        <option>Select Charity Organization</option>
        <%
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement statement = connection.createStatement();
	 
	ResultSet rs = statement.executeQuery("SELECT * FROM FDA.CHARITY");  

        while(rs.next())
        {
            out.println("<option value='"+rs.getString("cname")+"'>"+rs.getString("cname")+"</option>");
        }
        %>
    </select>
    
    
    
    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <label for="psw2"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw2" required>
    <hr>

    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  
</form>

</body>
</html>
