<%-- 
    Document   : changeStatusA
    Created on : 8 Dec, 2018, 12:39:57 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
body {
    font-family: Arial, Helvetica, sans-serif;
}

* {
    box-sizing: border-box;
}
select {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}
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

/* Add padding to containers */
.container {
    padding: 16px;
    background-color: white;
}




table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: none;
}

th, td {
    text-align: left;
    padding: 8px;
}

</style>
    </head>
    <body>
        <form action="changeStatus1">
        <div class="container" >
                <table>
        <%
            
            String a = (String) session.getAttribute("f_id");
    out.println("<input type='hidden' name='idVal2' value='"+a+"'>");
    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st1 = conn.createStatement();
	
	ResultSet rs1 = st1.executeQuery("select  distinct SUPPLIER,BRANCH,CALENDER,FB_LOC from FDA.RECEIVE where f_id='"+a+"'");    
                while(rs1.next())
                {
                    out.println("<tr>");
                    out.println("<td colspan='2'>");
                    out.println("FROM  : ");
                    out.println("</td>");
                    out.println("<td colspan='6'>");
                    out.println(""+rs1.getString("supplier")+"");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='2'>");
                    out.println("BRANCH  : ");
                    out.println("</td>");
                    out.println("<td colspan='6'>");
                    out.println(""+rs1.getString("branch")+"");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='2'>");
                    out.println("DATE  :  ");
                    out.println("</td>");
                    out.println("<td colspan='6'>");
                    out.println(""+rs1.getString("calender")+" ");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='8'>");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='8'>");
                    out.println("</td>");
                    out.println("</tr>");
                    
                }
%>
        
            <tr>
                <th>
                    CATEGORY
                </th>
                <th>
                    PRODUCT
                </th>
                <th>
                    BRAND
                </th>
                <th>
                    MFD
                </th>
                <th>
                    EXPIRY
                </th>
                <th>
                    QTY
                </th>
                <th>
                    WT
                </th>
                <th>
                    Tt. KG
                </th>
            </tr>
            <%
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("select CATEGORY,PRODUCT,BRAND,MFD,EXP,QTY,NOS,WT from FDA.RECEIVE where f_id='"+a+"'");    
                while(rs.next())
                      {
                          out.println("<tr>");
                          out.println("<td>");
                          out.println(""+rs.getString("category")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("product")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("brand")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("mfd")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getString("exp")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getDouble("nos")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getDouble("wt")+"");
                          out.println("</td>");
                          out.println("<td>");
                          out.println(""+rs.getDouble("qty")+"");
                          out.println("</td>");
                          out.println("</tr>");
                        }
            
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                Statement st2 = con1.createStatement();
	
                ResultSet rs2 = st2.executeQuery("select  distinct SIGNEE from FDA.RECEIVE where f_id='"+a+"'");    
                while(rs2.next())
                {
                    out.println("<tr>");
                    out.println("<td colspan='8'>");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='8'>");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='8'>");
                    out.println("</td>");
                    out.println("</tr>");
                    out.println("<tr>");
                    out.println("<td colspan='2'>");
                    out.println("Done BY  : ");
                    out.println("</td>");
                    out.println("<td colspan='6'>");
                    out.println(""+rs2.getString("signee")+"");
                    out.println("</td>");
                    out.println("</tr>");
                    
                }
%>
        </table>
        
        
        
        </br></br>
   
   <input type="submit" value="CONFIRM"/>
   </div>
        </form>
    <form action="userModify.jsp">
        <input type="submit" value="EDIT"/>
    </form>
    </body>
</html>
