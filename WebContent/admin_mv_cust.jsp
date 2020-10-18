<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<a href="admin_home.jsp"><b>Home</b></a>
<br>
<br>
<br>
<br>
	<%
	
	
		out.print("Revenue by Customer (Greatest to Least)");
		out.print("<br>");
		out.print("<br>");
		
    	
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
	

			String query = "SELECT b.customer_id, SUM(b.booking_fee) AS total FROM R_buys_relates_customer_ticket b JOIN Flight f ON f.flight_id = b.flight_id GROUP BY b.customer_id ORDER BY total DESC";
			ResultSet mvpResult= stmt.executeQuery(query);
			//customers table sorted from greatest to least revenue generated
		
			out.print("<table>");
				out.print("<tr>");
					out.print("<th> Customer ID </th>");
					out.print("<th>Sum of Booking Fees </th>");
				out.print("</tr>");
				
		
				
			while (mvpResult.next()){
				out.print("<tr>");
					out.print("<td>");
						out.print( mvpResult.getString("customer_id"));
					out.print("</td>");
						
					out.print("<td>");
						out.print("$" + mvpResult.getString("total"));
					out.print("</td>");
				out.print("</tr>");
				
			}
			out.print("</table>");
	
			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>