<%-- 
    Document   : EmpChangePassword
    Created on : 27 Jan, 2023, 12:18:58 PM
    Author     : ardra
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Employee Change Password</title>
    </head>
         <%
        if(request.getParameter("btnsave")!=null)
        {
            String cPassword=request.getParameter("txtcpwd");
            String nPassword=request.getParameter("txtnpwd");
            String ccPassword=request.getParameter("txtcnpwd");
            
            String selQry="select * from tbl_employee where employee_id='"+session.getAttribute("empid")+"'";
            ResultSet rs = con.selectCommand(selQry);
            rs.next();
            String currentPassword=rs.getString("employee_password");
            
            if(cPassword.equals(currentPassword))
            {
                if(nPassword.equals(ccPassword))
                {
                    String upQry = "update tbl_employee set employee_password='"+nPassword+"' where employee_id='"+session.getAttribute("empid")+"'";
                    out.println(upQry);
                   if(con.executeCommand(upQry))
                       
               {
                     response.sendRedirect("../Employee/Home5.jsp");
                  }
                   
                }
                
            }
            
            
        }
    %>
    <body>
        <form method="post">
            <table border="1" align="center" cellpadding="10" >

                <tr>
                    <td>Current Password</td>
                <td><input type="password" name="txtcpwd" required="required"></td>
                </tr>
                <tr>
                    <td>New Password</td>
                <td><input type="password" name="txtnpwd" required="required" title="Must not match with 'Current Password'"></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                <td><input type="password" name="txtcnpwd" required="required" title="Must match with 'New Password'"></td>
                </tr>
                 <tr>
                    <td colspan="4" align="center">
                        <input type="submit" value="Change" name="btnsave">
                         <input type="reset" value="Cancel" name="btn_reset">
                    </td>  
                </tr> 
                
                </table> 
                      </form>
    </body>
</html>

