<%-- 
    Document   : show
    Created on : 7 Dec, 2018, 4:52:17 PM
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
            if(no.equals("cat"))
            {
                out.println("<label for='cat'><b>SELECT CATEGORY</b></label>");
                out.println("<select name='category' id='category' onchange='showProd(this.value)'>");
                out.println("<option value='-1'>Select a CATEGORY</option>");
                out.println("</select>");
                out.println("<label for='prod'><b>SELECT PRODUCT</b></label>");
                out.println("<select id='product' name='product' id='product' onchange='showBrand(this.value)'>");
                out.println("<option value='-1'>Select a Product</option>");
                out.println("</select>");
                out.println("<label for='brand'><b>SELECT BRAND</b></label>");
                out.println("<select id='brand' name='brand' >");
                out.println("<option value='-1'>Select a Brand</option>");
                out.println("</select>");
            }
            else if(no.equals("mfd"))
            {
                out.println("<label for='mfd'><b>ENTER MANUFACTURING DATE</b></label>");
                out.println("<input type='date' id='mfd' name='mfd'/>");
            }
            else if(no.equals("exp"))
            {
                out.println("<label for='exp'><b>ENTER EXPIRY DATE</b></label>");
                out.println("<input type='date' id='exp' name='exp'/>");
            }
            else if(no.equals("qty"))
            {
                out.println("<label for='qty'><b>ENTER QTY</b></label>");
                out.println("<input type='text' id='qt' name='qt'/>");
            }
            else if(no.equals("wt"))
            {
                out.println("<label for='wt'><b>ENTER WEIGHT PER QTY</b></label>");
                out.println("<input type='text' id='wt' name='wt'/>");
            }
            else if(no.equals("rj"))
            {
                out.println("<label for='qty1'><b>ENTER QTY</b></label>");
                out.println("<input type='text' id='qt1' name='qt1'/>");
                out.println("<label for='rj'><b>REASON</b></label>");
                out.println("<input type='text' id='cmt' name='cmt'/>");
            }
        %>
    </body>
</html>
