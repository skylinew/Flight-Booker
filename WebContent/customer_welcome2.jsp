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
<title>Insert title here</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();


			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			Statement stmt = con.createStatement();
			
			String userName = "'" + session.getAttribute("user") + "'";
			
				
				
				out.print("Welcome " + session.getAttribute("user"));%>
				<br><br>
				<form method="post" action="log-out.jsp">
					<input type="submit" value="Log out" >
					</form>
					<br>
					
			<form method="post" action="customer_waiting_list.jsp">
					<input type="submit" value="Waiting List" >
					</form>
					<br>
			
			<form method="post" action="pastFlights.jsp">
				<input  type="hidden" name="customer_id" value="<%=session.getAttribute("user")%>">
				<input type="submit" value="View past flights">
			</form>
			<br>
			
			<form method="post" action="upcomingFlights.jsp">
				<input  type="hidden" name="customer_id" value="<%=session.getAttribute("user")%>">
				<input type="submit" value="View upcoming flights">
			</form>
			
				<br>
				
				<form method="post" action="customer_cancel_reservation.jsp">
				<input  type="hidden" name="customer_id" value="<%=session.getAttribute("user")%>">
				<input type="submit" value="Cancel Reservation">
			</form>
			
			
				<form method="post">
				  	<br><br><input type="submit" value="Search flights"  onclick="form.action='customer_search-flights.jsp'">  
				</form> 

			
			<% con.close();

		

		
	%>

</body>
</html>