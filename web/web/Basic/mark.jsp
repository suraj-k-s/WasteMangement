<%-- 
    Document   : mark
    Created on : 20 Nov, 2022, 2:10:14 PM
    Author     : ardra
--%>


<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> MARK JSP Page</title>
    </head>
   
        

<body>
   <%
       String name="",contact="",email="",grade="",c="";
       int total=0,m1=0,m2=0,m3=0;
       double per='0';
       if(request.getParameter("btnsave")!=null)
       {
           name=(request.getParameter("txtname"));
          
           contact=(request.getParameter("txtcontact"));
          
       
           email=(request.getParameter("txtemail"));
           m1=Integer.parseInt(request.getParameter("txtmark1"));
           m2=Integer.parseInt(request.getParameter("txtmark2"));
           m3=Integer.parseInt(request.getParameter("txtmark3"));
       
           total=m1+m2+m3;
           per=(total*100)/300; 
     //out.print(total*100/300);
            if(per>=90)
                grade="A+";
            else if(per>=80)
                grade="A";
            else if(per>=60)
                grade="B+";
            else
                grade="fail";
       }
   %>
<form method="post">

    <table border="1" align="center" cellpadding="10" >

	<tr>
 		<td>Name</td>
 		<td><input type="text" name="txtname" required="required"></td>
	</tr>

	<tr>
 		<td>Contact</td>
 		<td><input type="text" name="txtcontact" required="required"></td>
	</tr>
        <tr>
 		<td>Email</td>
 		<td><input type="email" name="txtemail" required="required"></td>
	</tr>

	<tr>
 		<td>Mark 1</td>
 		<td><input type="text" name="txtmark1" required="required"></td>
	</tr>
        <tr>
 		<td>Mark 2</td>
 		<td><input type="text" name="txtmark2" required="required"></td>
	</tr>
        <tr>
 		<td>Mark 3</td>
 		<td><input type="text" name="txtmark3" required="required"></td>
	</tr>
        <tr>
        <td colspan="2" align="center">
            <input type="submit" value="Total" name="btnsave">
        </td>
        
        </tr>
         <tr>
 		<td>Name</td>
 		<td><%=name%></td>
	</tr>
         <tr>
 		<td>Contact</td>
 		<td><%=contact%></td>
	</tr>
         <tr>
 		<td>Email</td>
 		<td><%=email%></td>
	</tr>
         <tr>
 		<td>Total</td>
 		<td><%=total%></td>
	</tr>
         <tr>
 		<td>Percentage</td>
 		<td><%=per%></td>
	</tr>
         <tr>
 		<td>Grade</td>
 		<td><%=grade%></td>
	</tr>
        

</table>

</form>

</body>

</html>