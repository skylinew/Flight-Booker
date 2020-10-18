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
	
	
	String month0 = request.getParameter("Month");
	int i = month0.indexOf("/");
	int l = month0.length();
	String month = month0.substring(0,i);
	String year = month0.substring(i+1,l);
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
	
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String queryBookingFee = "SELECT SUM(booking_fee) as sumbf FROM R_buys_relates_customer_ticket WHERE MONTH(date_of_purchase) = " + month + " AND YEAR(date_of_purchase) = " + year + ";";
			String queryTicketFare = "SELECT SUM(total_fare) as sumtf FROM  Flight f JOIN R_buys_relates_customer_ticket b ON f.flight_id = b.flight_id WHERE MONTH(b.date_of_purchase) = " + month + " AND YEAR(b.date_of_purchase) = " + year +  ";";

			
			ResultSet resultFee = stmt.executeQuery(queryBookingFee);
			if (resultFee.next()){
				if(resultFee.getString("sumbf")==null) {
					out.print("Total revenue from booking fees (dollars): $0");

				}
				else{
				out.print("Total revenue from booking fees (dollars): " + resultFee.getString("sumbf"));
			}
			}
			out.print("<br>");
			out.print("<br>");
			
			
			
			ResultSet resultFare = stmt.executeQuery(queryTicketFare);
			if (resultFare.next()){
				
				if(resultFare.getString("sumtf")==null) {
					out.print("Total revenue from booking fees (dollars): $0");

				}
				else{
					out.print("Total Revenue in ticket fares (dollars): " + resultFare.getString("sumtf"));
			}
			}
			
		
			/* out.print("<br>");
			out.print("<br>"); */
			
			
	
			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>