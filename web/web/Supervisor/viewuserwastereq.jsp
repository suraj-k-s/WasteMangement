<%-- 
    Document   : AgencyVerification
    Created on : 17 Dec, 2022, 1:48:52 PM
    Author     : ardra
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP View User Waste Request</title>
    </head>
    <body>
        <%@include  file="Headu.jsp" %>
        <br>
        <div id="tab" align="center">
       
        <table border="1" align="center">
                
            <tr>
                <th>Sl. No.</th>
                <th>Name</th>
                <th>Request date</th>
                <th>Pickup date</th>
                <th>Address</th>
                <th>Contact</th>
                <th>Action</th>
                
           
            </tr>
            <%
                String select = "select * from tbl_wasterequest s inner join tbl_user p on p.user_id = s.user_id  inner join tbl_supervisor t on p.place_id = t.place_id where wastereq_status='0' and supervisor_id = '"+session.getAttribute("supid")+"'";;
//out.print(select);
                ResultSet rs = con.selectCommand(select);
                int i = 0;
                while (rs.next()) {
                    i++;
            %>


            <tr>
                <td><%=i%></td>
                <td><%=rs.getString("user_name")%></td>
                <td><%=rs.getString("wastereq_date")%></td>
                <td><%=rs.getString("wastereq_pickupdate")%></td>
                <td><%=rs.getString("user_address")%></td>
                <td><%=rs.getString("user_contact")%></td>
                <td><a href="AssignEmployee.jsp?wid=<%=rs.getString("wastereq_id")%>">Assign Employee</a></td>
                
            </tr>
            <%
                }
            %>




        </table>
        </div>
    </body>
     <%@include file="Footu.jsp" %>
</html>
