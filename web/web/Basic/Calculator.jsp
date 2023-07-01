<%-- 
    Document   : Calculator
    Created on : 20 Nov, 2022, 1:11:35 PM
    Author     : ardra
--%>

<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> CALCULATOR JSP Page</title>
    </head>
   
        

<body>
    <%
        int n1,n2,c=0;
        if(request.getParameter("btnadd")!=null)
        {
            n1=Integer.parseInt(request.getParameter("txtnum1"));
            n2=Integer.parseInt(request.getParameter("txtnum2"));
            c=n1+n2;
        }
        if(request.getParameter("btnsub")!=null)
        {
        n1=Integer.parseInt(request.getParameter("txtnum1"));
            n2=Integer.parseInt(request.getParameter("txtnum2"));
            c=n1-n2;    
        }
        if(request.getParameter("btnmul")!=null)
        {
        n1=Integer.parseInt(request.getParameter("txtnum1"));
            n2=Integer.parseInt(request.getParameter("txtnum2"));
            c=n1*n2;    
        }
        if(request.getParameter("btndiv")!=null)
        {
        n1=Integer.parseInt(request.getParameter("txtnum1"));
            n2=Integer.parseInt(request.getParameter("txtnum2"));
            c=n1/n2;    
        }
        
    %>
<p>Calculator</p>

<form method="post">

    <table border="1" align="center" cellpadding="10" style="border-collapse: collapse">

	<tr>
 		<td>Enter Number 1</td>
 		<td><input type="text" name="txtnum1" required="required"></td>
	</tr>

	<tr>
 		<td>Enter Number 2</td>
 		<td><input type="text" name="txtnum2" required="required"></td>
	</tr>

	<tr>
 <td colspan="2" align="center">
     <input type="submit" value="+" name="btnadd">
     <input type="submit" value="-" name="btnsub">
     <input type="submit" value="*" name="btnmul">
     <input type="submit" value="/" name="btndiv">
 </td>
</tr>
	<tr>
 		<td>Result</td>
                <td><%=c%></td>
	</tr>

</table>

</form>

</body>

</html>