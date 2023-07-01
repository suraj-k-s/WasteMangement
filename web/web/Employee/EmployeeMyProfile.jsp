<%-- 
    Document   : EmployeeMyProfile
    Created on : 27 Jan, 2023, 11:50:13 AM
    Author     : ardra
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP EmployeeMyProfile</title>
    </head>
    <body>
           <%
            
                String sel="select * from tbl_employee where employee_id='"+session.getAttribute("empid")+"'";
                //out.print(sel);
                ResultSet rs=con.selectCommand(sel);
                rs.next();
            
                %>
           <form method="post">
            <table border="1" align="center" cellpadding="10" >
                <tr>
                
                 <td colspan="2"><img src="../Assets/Files/EmployeePhoto/<%=rs.getString("employee_photo")%>" width="120" height="120"/></td>
    
               </tr>  
                <tr>
                    <td>Name</td>
                <td><%=rs.getString("employee_name")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                <td><%=rs.getString("employee_email")%></td>
                </tr>
                 <tr>
                    <td>Contact</td>
                <td><%=rs.getString("employee_contact")%></td>
                </tr>
                  <tr>
                    <td>Address</td>
                <td><%=rs.getString("employee_address")%></td>
                </tr>
                </table> 
                      </form>
    </body>
</html>