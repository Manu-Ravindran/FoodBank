<%-- 
    Document   : viewPhotosA
    Created on : 8 Dec, 2018, 10:48:02 AM
    Author     : Sajid
--%>


<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
     
    String s=request.getParameter("pid"); 
    
    int d=Integer.parseInt(s); 
    try
    {  
    Class.forName("org.apache.derby.jdbc.ClientDriver");  
    Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");  
    PreparedStatement ps=con.prepareStatement("select pic from fda.image where did=?");  
    ps.setInt(1,d);
    
    ResultSet rs=ps.executeQuery();  
    if(rs.next())
    {  
   
    
    byte[] byteArray=rs.getBytes("pic");
    System.out.println(byteArray);
    response.setContentType("image/jpg");
    OutputStream os=response.getOutputStream();
    os.write(byteArray);
    os.flush();
    os.close();
    
    }  
    con.close(); 
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }  
    %>  