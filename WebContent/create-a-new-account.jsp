<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();

		String newBar = request.getParameter("username");
		String newBeer = request.getParameter("password");


		String insert = "INSERT INTO Account(username, password)"
				+ "VALUES (?, ?)";
		PreparedStatement ps = con.prepareStatement(insert);

		ps.setString(1, newBar);
		ps.setString(2, newBeer);
		ps.executeUpdate();

		con.close();

		out.print("Congratulations! Your account has been created.");
		%>
		<br>
		<br>
		<form method="post" action="log-out.jsp">
			<input type="submit" value="Log out" >
			</form>
		<% 
		
	} catch (Exception ex) {
		out.print("An account with this username already exists");%>
		<br>
		<br>
		<form method="post" action="index.jsp">
			<input type="submit" value="Go back to the main page" >
			</form>
		<% 
	}
%>
</body>
</html>