
<%@page import="java.sql.PreparedStatement"%>
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

<form action="deliver002.jsp">
  <div class="container">
    <hr>

    <label for="name"><b>TO Charity Name</b></label>
    
    <select name="cname">
        <option>TO Charity Name</option>
        <%
            Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement statement = connection.createStatement();
	 
	ResultSet rs = statement.executeQuery("SELECT distinct cname FROM FDA.charity");  

        while(rs.next())
        {
            out.println("<option value='"+rs.getString("cname")+"'>"+rs.getString("cname")+"</option>");
        }
        %>
    </select>

    <hr>
    <%
        Class.forName("org.apache.derby.jdbc.ClientDriver");  
        Connection conn=DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
        PreparedStatement ps=conn.prepareStatement("INSERT INTO FDA.IDEN (NIL) VALUES ('gen')"); 
        
        int rss=ps.executeUpdate();  
    %>
    <input type="submit" value= "next" class="next">
  </div>
  
</form>

</body>
</html>
