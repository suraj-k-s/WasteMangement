<%-- 
    Document   : TrackRequest
    Created on : 27 May, 2023, 10:28:46 AM
    Author     : ardra
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include  file="Head.jsp" %>
        <br><br><br>
        <div id="tab" align="center">
            <table border="1" align="center">
                <tr>
                    <th>Sl. No.</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Request date</th>
                    <th>Pickup date</th>
                    <th>Waste material</th>

              </tr>
                <%//out.print(session.getAttribute("usid"));
                    String select = "select * from tbl_wasterequest r inner join tbl_user u on r.user_id=u.user_id where u.user_id='"+session.getAttribute("usid")+"'";
                    ResultSet rs = con.selectCommand(select);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("user_name")%></td>
                    <td><%=rs.getString("user_address")%></td>
                    <td><%=rs.getString("wastereq_date")%></td>
                    <td><%=rs.getString("wastereq_pickupdate")%></td>
                    <td>
                        <% 
                        String selec = "select * from tbl_wasterequestbody u inner join tbl_wastematerial s on u.wastematerial_id = s.wastematerial_id where wasterequest_id =" + rs.getString("wastereq_id") + "";
                            
                        ResultSet res = con.selectCommand(selec);
                        ResultSet res2 = con.selectCommand(selec);
                        res2.next();
                        while (res.next()) {
                       
                       if(res2.next())
                       {
                          %>
                       
                        <%=res.getString("wastematerial_type")%>,
                       <%
                       }
                       else
                       {
                        %>
                        <%=res.getString("wastematerial_type")%>

                        <%
                        }
                       
                       
                        }
                       %>

                    </td>


                </tr>
                <%
                    }
 
%>
            </table>
        </div>
    </body>
</html>

