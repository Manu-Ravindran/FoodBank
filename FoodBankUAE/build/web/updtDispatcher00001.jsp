<%-- 
    Document   : updtDispatcher00001
    Created on : 14 Dec, 2018, 7:09:23 PM
    Author     : Sajid
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String ch=request.getParameter("upd1");
            String id1=request.getParameter("idVal");
            int id=Integer.parseInt(id1);
            
            HttpSession v=request.getSession();
            v.setAttribute("id1", id);
            
            if(ch.equals("fnm"))
            {
                String fnm=request.getParameter("fnm");
                v.setAttribute("first", fnm);
                RequestDispatcher a=request.getRequestDispatcher("updt00001.jsp");
                a.forward(request, response);
                
            }
            else if(ch.equals("lnm"))
            {
                String lnm=request.getParameter("lnm");
                v.setAttribute("last", lnm);
                RequestDispatcher b=request.getRequestDispatcher("updt00002.jsp");
                b.forward(request, response);
            }
            else if(ch.equals("dob"))
            {
                String dt=request.getParameter("dob");
                v.setAttribute("dob", dt);
                RequestDispatcher c=request.getRequestDispatcher("updt00003.jsp");
                c.forward(request, response);
            }
            else if(ch.equals("ct"))
            {
                String tel=request.getParameter("tel");
                v.setAttribute("tel", tel);
                RequestDispatcher e=request.getRequestDispatcher("updt00004.jsp");
                e.forward(request, response);
            }
            else if(ch.equals("em"))
            {
                String eml=request.getParameter("eml");
                v.setAttribute("mail", eml);
                RequestDispatcher f=request.getRequestDispatcher("updt00005.jsp");
                f.forward(request, response);
            }
            else if(ch.equals("pass"))
            {
                String pwd=request.getParameter("pwd1");
                v.setAttribute("pass", pwd);
                RequestDispatcher g=request.getRequestDispatcher("updt00006.jsp");
                g.forward(request, response);
            }
        %>
    </body>
</html>
