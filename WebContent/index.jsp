<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>cs336Group11</title>
</head>

<body>

<br>

	<table>
	<tr>
<!-- 	<td width="11800"></td>
 -->	<td>Sign in as</td>
	</tr>
	</table>
	
		
	<form method="post" action="customer_enter_credentials.jsp">
					<input type="submit" value="a Customer" >
					</form>
					
					
	<form method="post" action="cust-rep-login.jsp">
					<input type="submit" value="a Customer Representative" >
					</form>
					
	<form method="post" action="admin_index.jsp">
					<input type="submit" value="an admin" >
					</form>
						
		
	
<br>
	
	
</body>
</html>