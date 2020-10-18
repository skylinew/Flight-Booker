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

	<%
	

	
		out.print("List of Most Active Flights (Tickets Sold)");
    	out.print("<br>");
    	out.print("<br>");
	    
		try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
	
			String query = "SELECT flight_id, COUNT(ticket_num)  FROM R_buys_relates_customer_ticket GROUP BY flight_id ORDER BY COUNT(ticket_num) DESC;";
			ResultSet resultMostActive= stmt.executeQuery(query);
	
			
			//customers table sorted from greatest to least revenue generated
			out.print("<table>");
				out.print("<tr>");
					out.print("<th> Flight ID </th>");
					out.print("<th> Number of Tickets Sold Per Flight </th>");
				out.print("</tr>");
				
				while (resultMostActive.next()){
					out.print("<tr>");
						out.print("<td>");
							out.print(resultMostActive.getInt("flight_id"));
						out.print("</td>");
						
						out.print("<td>");
							out.print(resultMostActive.getInt("COUNT(ticket_num)"));
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