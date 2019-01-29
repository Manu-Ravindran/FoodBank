<%-- 
    Document   : addProduct
    Created on : 5 Dec, 2018, 2:27:07 AM
    Author     : Sajid
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    width: 20%;
    opacity: 0.9;
}
input[type=submit],button:hover {
    opacity: 1;
}
        </style>
    </head>
    <body>
        <form action="addBrandA.jsp">
        <div class="flex">
            <label><b>BRAND NAME</b></label> <input type="text" name="brand">
            <label><b>CATEGORY  </b></label>
            <select name="category">
        <option>Select a Category</option>
        <%
        Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	PreparedStatement st = connection.prepareStatement("SELECT distinct product FROM FDA.PRODUCT  ");
	
	ResultSet rs = st.executeQuery();  

        while(rs.next())
        {
            out.println("<option value='"+rs.getString("product")+"'>"+rs.getString("product")+"</option>");
        }
        %>
    </select>
            </br>
            <input type="submit" value="SUBMIT">
        </div>
        </form>
    </body>
</html>

