<%-- 
    Document   : show1
    Created on : 8 Dec, 2018, 3:55:31 AM
    Author     : Sajid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
        <%
            String no=request.getParameter("count"); 
            if(no.equals("fnm"))
            {
                out.println("<label for='fnm'><b>ENTER FIRST NAME</b></label>");
                out.println("<input type='text' id='fnm' name='fnm'/>");
            }
            else if(no.equals("lnm"))
            {
                out.println("<label for='lnm'><b>ENTER LAST NAME</b></label>");
                out.println("<input type='text' id='lnm' name='lnm'/>");
            }
            else if(no.equals("dob"))
            {
                out.println("<label for='dob'><b>ENTER DOB</b></label>");
                out.println("<input type='date' id='dob' name='dob'/>");
            }
            else if(no.equals("ct"))
            {
                out.println("<label for='tel'><b>ENTER CONTACT</b></label>");
                out.println("<input type='text' id='tel' name='tel'/>");
            }
            else if(no.equals("em"))
            {
                out.println("<label for='eml'><b>ENTER EMAIL</b></label>");
                out.println("<input type='text' id='eml' name='eml'/>");
            }
            else if(no.equals("pass"))
            {
                out.println("<label for='pass'><b>ENTER PASSWORD</b></label>");
                out.println("<input type='password' id='pwd1' name='pwd1'/>");
                out.println("<input type='password' id='pwd2' name='pwd2' onkeyup='check()'/>");
                
                out.println("<span id='message'> </span>");
            }
        %>
    </body>
</html>
