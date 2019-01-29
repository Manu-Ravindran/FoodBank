<%-- 
    Document   : adminDash
    Created on : 29 Dec, 2018, 1:37:30 PM
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
<div style="overflow-x:auto;">
  <table>
      <tr>
          <th colspan="8"><center>RECEIVABLES TO BE COLLECTED</center></th>
      </tr>
      <tr>
         <th>ID</th>
         <th>FROM VENDOR</th>
         <th>VENDOR LOCATION</th>
         <th>QTY</th>
         <th>DATE</th>
         <th>BY</th>
         <th>STATUS</th>
      </tr>
    
<%

            

                    
                    Class.forName("org.apache.derby.jdbc.ClientDriver");

                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                        
                    PreparedStatement ps = con.prepareStatement("SELECT  F_ID,SUPPLIER,BRANCH,sum(QTY) as x,EMP,CALENDER FROM FDA.RECEIVE  where STATUS='pending' group by F_ID,SUPPLIER,BRANCH,EMP,CALENDER");

                    

                 ResultSet rs = ps.executeQuery();   
                while(rs.next())
                 {
                     
                       
                       out.println("<tr>");
                       out.println("<td><font color='red'>"+rs.getString("F_ID")+"</font></td>");
                       out.println("<td><font color='red'>"+rs.getString("SUPPLIER")+"</font></td>");
                       out.println("<td><font color='red'>"+rs.getString("BRANCH")+"</font></td>");
                       out.println("<td><font color='red'>"+rs.getDouble("x")+"</font></td>");
                       out.println("<td><font color='red'>"+rs.getString("CALENDER")+"</font></td>");
                       out.println("<td><font color='red'>"+rs.getString("EMP")+"</font></td>");
                       out.println("<td><font color='red'>READY FOR COLLECTION</font></td>");
                       out.println("</tr>");
                     
                             
                 }

            
            %> 
  </table>
  </br>
  </br>
  
  <table>
      <tr>
          <th colspan="8"><center>AWAITING CHECK-OUT FROM F.I</center></th>
      </tr>
      <tr>
         <th>ID</th>
         <th>FROM VENDOR</th>
         <th>VENDOR LOCATION</th>
         <th>QTY</th>
         <th>DATE</th>
         <th>BY</th>
         <th>STATUS</th>
      </tr>
    
<%

            

                    
                    Class.forName("org.apache.derby.jdbc.ClientDriver");

                    Connection con1 = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                        
                    PreparedStatement ps1 = con1.prepareStatement("SELECT  F_ID,SUPPLIER,BRANCH,sum(QTY) as x,EMP,CALENDER FROM FDA.RECEIVE  where STATUS='ACTIVE' group by F_ID,SUPPLIER,BRANCH,EMP,CALENDER");

                    

                 ResultSet rs1 = ps1.executeQuery();   
                while(rs1.next())
                 {
                     
                       
                       out.println("<tr>");
                       out.println("<td><font color='red'>"+rs1.getString("F_ID")+"</font></td>");
                       out.println("<td><font color='red'>"+rs1.getString("SUPPLIER")+"</font></td>");
                       out.println("<td><font color='red'>"+rs1.getString("BRANCH")+"</font></td>");
                       out.println("<td><font color='red'>"+rs1.getDouble("x")+"</font></td>");
                       out.println("<td><font color='red'>"+rs1.getString("CALENDER")+"</font></td>");
                       out.println("<td><font color='red'>"+rs1.getString("EMP")+"</font></td>");
                       out.println("<td><font color='red'>TO BE DISPERSED</font></td>");
                       out.println("</tr>");
                     
                             
                 }

            
            %> 
  </table>
   </br>
  </br>
  
  <table>
      <tr>
          <th colspan="8"><center>PENDING DELIVERY</center></th>
      </tr>
      <tr>
         <th>ID</th>
         <th>CHARITY ORG</th>
         <th>EMPLOYEE</th>
         <th>FROM FB LOC</th>
         <th>TIME</th>
         <th>DATE</th>
         <th>CONTACT</th>
         <th>STATUS</th>
      </tr>
    
<%

            

                    
                    Class.forName("org.apache.derby.jdbc.ClientDriver");

                    Connection con2 = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
                        
                    PreparedStatement ps2 = con2.prepareStatement("SELECT  distinct D.F_ID,D.CHARITY_NAME,D.SIGNEE,D.FB_LOC,D.TIME,D.CALENDER,U.TEL FROM FDA.DELIVERED D  INNER JOIN FDA.USERS U ON D.SIGNEE=U.USERNAME where D.STATUS='pending'");

                    

                 ResultSet rs2 = ps2.executeQuery();   
                while(rs2.next())
                 {
                     
                       
                       out.println("<tr>");
                       out.println("<td><font color='red'>"+rs2.getString("F_ID")+"</font></td>");
                       out.println("<td><font color='red'>"+rs2.getString("CHARITY_NAME")+"</font></td>");
                       out.println("<td><font color='red'>"+rs2.getString("SIGNEE")+"</font></td>");
                       out.println("<td><font color='red'>"+rs2.getString("FB_LOC")+"</font></td>");
                       out.println("<td><font color='red'>"+rs2.getString("TIME")+"</font></td>");
                       out.println("<td><font color='red'>"+rs2.getString("CALENDER")+"</font></td>");
                       out.println("<td><font color='red'>"+rs2.getString("TEL")+"</font></td>");
                       out.println("<td><font color='red'>NOT DELIVERED</font></td>");
                       out.println("</tr>");
                     
                             
                 }

            
            %> 
  </table>
  
</div>
  


</body>
</html>
