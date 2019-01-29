<%-- 
    Document   : adminSend01
    Created on : 15 Dec, 2018, 9:36:10 PM
    Author     : Sajid
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script src="js/jquery.tokeninput.js" type="text/javascript"></script>
         
    <style>
        /* Example tokeninput style #1: Token vertical list*/
ul.token-input-list {
    overflow: hidden; 
    height: auto !important; 
    height: 1%;
    width: 400px;
    border: 1px solid #999;
    cursor: text;
    font-size: 12px;
    font-family: Verdana;
    z-index: 999;
    margin: 0;
    padding: 0;
    background-color: #fff;
    list-style-type: none;
    clear: left;
}

ul.token-input-list li {
    list-style-type: none;
}

ul.token-input-list li input {
    border: 0;
    width: 350px;
    padding: 3px 8px;
    background-color: white;
    -webkit-appearance: caret;
}

li.token-input-token {
    overflow: hidden; 
    height: auto !important; 
    height: 1%;
    margin: 3px;
    padding: 3px 5px;
    background-color: #d0efa0;
    color: #000;
    font-weight: bold;
    cursor: default;
    display: block;
}

li.token-input-token p {
    float: left;
    padding: 0;
    margin: 0;
}

li.token-input-token span {
    float: right;
    color: #777;
    cursor: pointer;
}

li.token-input-selected-token {
    background-color: #08844e;
    color: #fff;
}

li.token-input-selected-token span {
    color: #bbb;
}

div.token-input-dropdown {
    position: absolute;
    width: 400px;
    background-color: #fff;
    overflow: hidden;
    border-left: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    cursor: default;
    font-size: 12px;
    font-family: Verdana;
    z-index: 1;
}

div.token-input-dropdown p {
    margin: 0;
    padding: 5px;
    font-weight: bold;
    color: #777;
}

div.token-input-dropdown ul {
    margin: 0;
    padding: 0;
}

div.token-input-dropdown ul li {
    background-color: #fff;
    padding: 3px;
    list-style-type: none;
}

div.token-input-dropdown ul li.token-input-dropdown-item {
    background-color: #fafafa;
}

div.token-input-dropdown ul li.token-input-dropdown-item2 {
    background-color: #fff;
}

div.token-input-dropdown ul li em {
    font-weight: bold;
    font-style: normal;
}

div.token-input-dropdown ul li.token-input-selected-dropdown-item {
    background-color: #d0efa0;
}
    </style>
    </head>
    <body>
        <form action="adminSend01a.jsp">
            <%
            
Calendar cal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
out.println("<input type='hidden'  name='time' value='"+sdf.format(cal.getTime())+"'>");

java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
out.println("<input type='hidden'  name='date' value='"+sqlDate+"'>");
%>
            </br>
            </br>
            </br>
            <div>
            <table>
                <tr>
                <td>TO:</td>
                <td>
                <input type="text" id="demo-input-local" name="send" />
                
        <script type="text/javascript">
        $(document).ready(function() {
            $("#demo-input-local").tokenInput([
                <%
                    Class.forName("org.apache.derby.jdbc.ClientDriver"); 
	Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/fda","fda","fda");
	Statement st = con.createStatement();
	 
	ResultSet r2 = st.executeQuery("SELECT *  FROM FDA.users");
        
        while(r2.next())
        {
        out.println("{id: '"+r2.getString("USERNAME")+"', name: '"+r2.getString("USERNAME")+"'},");
        }
                %>
            ]);
        });
        </script>
        </td>
                </tr>
                <tr>
                <td>SUBJECT:</td>
                <td><input type="text" name="sub"></td>
                </tr>
                <tr>
                <td>MESSAGE:</td>
                <td><textarea name="msg" rows="20" cols="70"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2"><center><input type="submit" value="SEND"></center></td>
                </tr>
            </table>
            </div>
        
        </form>
    </body>
</html>
