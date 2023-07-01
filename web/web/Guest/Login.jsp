<%-- 
    Document   : Login
    Created on : 27 Dec, 2022, 1:56:44 PM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Login</title>
    </head>
    <body>
        <%
            if(request.getParameter("btnsave")!=null)
            {
                String sel="select * from tbl_admin where admin_email='"+request.getParameter("txtemail")+"' and admin_password='"+request.getParameter("txtpwd")+"'";
                ResultSet rs=con.selectCommand(sel);
                
                
               
                String sele="select * from tbl_agency where agency_email='"+request.getParameter("txtemail")+"'  and agency_password='"+request.getParameter("txtpwd")+"' and agency_vstatus=1 ";
                ResultSet res=con.selectCommand(sele);
                
                String selec="select * from tbl_user where user_email='"+request.getParameter("txtemail")+"'  and user_password='"+request.getParameter("txtpwd")+"'";
                ResultSet resu=con.selectCommand(selec);
                
                
                 
                String select="select * from tbl_supervisor where supervisor_email='"+request.getParameter("txtemail")+"'  and supervisor_password='"+request.getParameter("txtpwd")+"'";
                ResultSet resul=con.selectCommand(select);
             
                String selecc="select * from tbl_employee where employee_email='"+request.getParameter("txtemail")+"'  and employee_password='"+request.getParameter("txtpwd")+"'";
                ResultSet result=con.selectCommand(selecc);
            if(rs.next())
            {
                session.setAttribute("aid", rs.getString("admin_id"));
                 session.setAttribute("aname", rs.getString("admin_name"));
                 response.sendRedirect("../Admin/Home.jsp");
            }
            else if(res.next())
            {
                session.setAttribute("agid", res.getString("agency_id"));
                 session.setAttribute("agname", res.getString("agency_name"));
              
      
                 response.sendRedirect("../Agency/Home2.jsp");
            
            }
            else if(resu.next())
            {
                session.setAttribute("usid", resu.getString("user_id"));
                 session.setAttribute("usname", resu.getString("user_name"));
              
      
                 response.sendRedirect("../User/Home3.jsp");
            
            }
            else if(resul.next())
            {
                session.setAttribute("supid", resul.getString("supervisor_id"));
                 session.setAttribute("supname", resul.getString("supervisor_name"));
              
      
                 response.sendRedirect("../Supervisor/Home4.jsp");
            
            }
             else if(result.next())
            {
                session.setAttribute("empid", result.getString("employee_id"));
                 session.setAttribute("empname", result.getString("employee_name"));
              
      
                 response.sendRedirect("../Employee/Home5.jsp");
            
            }
            }  
           
            
            
            %>
         <form method="post">
            <table border="1" align="center" cellpadding="10" >

                <tr>
                    <td>Email</td>
                <td><input type="email" name="txtemail" required="required"></td>
                </tr>
                <tr>
                    <td>Password</td>
                <td><input type="password" name="txtpwd" required="required"></td>
                </tr>
                 <tr>
                    <td colspan="4" align="center">
                        <input type="submit" value="Login" name="btnsave">
                        <input type="reset" value="Reset" name="btnres">
                    </td>  
                </tr> 
                </table> 
                      </form>

 </body>
</html>

    