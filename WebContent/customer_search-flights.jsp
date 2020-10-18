<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Fligths</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			Statement stmt = con.createStatement();
			String userName = session.getAttribute("user") + "";

		
				%>
				<br><br>
				<form method="post" action="log-out.jsp">
					<input type="submit" value="Log out" >
					</form>
					<br>
			
			
				<form method="post">
				<strong>Find Cheap Tickets - Save Big!</strong> 
				<br><br>
				  <input type="radio" name="round_trip" value="0" > One Way
				  <input type="radio" name="round_trip" value="1"> Round Trip
				<br><br>
				
				From :<input type="text" name="from"> 
				To :<input type="text" name="to"> 
				 
				  <br><br>
				  
				  
				  Depart: <input type="date" name="dDate">
				  Return: <input type="date" name="rDate">
				    <br><br>
				  
				
				  <input type="radio" name="flexible" value="true" > flexible date
				  <input type="radio" name="flexible" value="false" > No flexible date
				  
				  	<br><br><input type="submit" value="Search Now"  onclick="form.action='customer_search-flights-results.jsp'">  
				</form> 

				<br><br>

				<form method="post" action="customer_welcome2.jsp">
					<input type="submit" value="Go back to the main page" >
					</form>
				<% 
			
			
			con.close();

		} catch (Exception e) {
			out.print("Oops");%>
			<br>
			<br>
			<form method="post" action="customer_welcome2.jsp">
				<input type="submit" value="Go back to the main page" >
				</form>
			<% 

		}
	%>

</body>
</html>