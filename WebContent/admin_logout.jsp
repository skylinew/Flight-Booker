<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>cs336Group11</title>
</head>

<body>
<% out.print("You are logged out"); 

String href = "<a href = \"";
String link = "admin_home.jsp\">";
String closehref = "</a>";
out.print(href + link + closehref);
%>	

<br>
<br>
<form method="post" action="index.jsp">
	<input type="submit" value="Go back to the main page" >
	</form>
	
</body>
</html>