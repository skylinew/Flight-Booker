<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import ="java.lang.*"%>

<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.time.LocalDateTime"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Filtered Fligths</title>
</head>
</head>
<body>
<% 
  try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();

		String price = "'" + request.getParameter("price") + "'";	
		String airline = "'" + request.getParameter("airline") + "'";		
		String noofstops = "'" + request.getParameter("noofstops") + "'";		
		String ppdep_airport =  request.getParameter("pdep_airport") ;		
		String pparr_airport =  request.getParameter("parr_airport") ;	
	
		String st = request.getParameter("str");
		String st2 = request.getParameter("str2");
		String temp = st.substring(94);
		String temp2;
		if (!st2.equals("")){
			temp2 = st2.substring(94); }
		else{temp2 = "";}

		String new_st, new_st2;

		if(price.equals("''") && airline.equals("''") && noofstops.equals("''")){
			out.print("Please go back and choose any of the filteration parameters");%>
			<br><br>
			<%
			new_st = "";
			new_st2 = "";
		}
		else if(price.equals("''") && airline.equals("''")){
			if (noofstops.equals("'0'")){
				new_st = st;
				new_st2 = "";
			}
			else{
				new_st = "";
				new_st2 = st2;
			}
		
		}
		else if(price.equals("''") && noofstops.equals("''")){
			new_st = st + " and Flight.airline_id = " + airline;
			if (!st2.equals("")){
				new_st2 = st2 + " and Flight.airline_id = " + airline;
		}
			else{
				new_st2 = "";
			}
		}
			
		else if(noofstops.equals("''") && airline.equals("''")){
			new_st = st + " and Flight.price < " + price;
			if (!st2.equals("")){
				new_st2 = st2 + " and Flight.price < " + price;
		}
			else{
				new_st2 = "";
			}
		}
		else if(price.equals("''")){
			if (noofstops.equals("'0'")){
				new_st = st + " and Flight.airline_id = " + airline;
				new_st2 = "";
			}
			else{

				new_st = "";
				if (!st2.equals("")){
					new_st2 = st2 + " and Flight.airline_id = " + airline;
			}
				else{
					new_st2 = "";
				}
			
			}
		
		
		
		}
		else if(airline.equals("''")){
			if (noofstops.equals("'0'")){
				new_st = st + " and Flight.price < " + price;
				new_st2 = "";
			}
			else{

				new_st = "";
				if (!st2.equals("")){
					new_st2 = st2 + " and Flight.price < " + price;
			}
				else{
					new_st2 = "";
				}
			}
			}
		
		else if(noofstops.equals("''")){
			new_st = st + " and Flight.price < " + price + " and Flight.airline_id = " + airline;
			if (!st2.equals("")){
				new_st2 = st2 + " and Flight.price < " + price + " and Flight.airline_id = " + airline;
		}
			else{
				new_st2 = "";
			}
		
		}
		else{
			if (noofstops.equals("'0'")){
				new_st = st + " and Flight.price < " + price + " and Flight.airline_id = " + airline;
				new_st2 = "";
			}
			else{

				new_st = "";
				if (!st2.equals("")){
					new_st2 = st2 + " and Flight.price < " + price + " and Flight.airline_id = " + airline;
			}
				else{
					new_st2 = "";
				}
			}
		}

				
		%>
		
		<table>
		  					<tr>
		  						<td width =80>	Flight ID </td>
		  						<td width =130>  Departure Airport </td>
		  						<td width =130>  Arrival Airport </td>
		  						<td width =80>	Airline </td>
		  						<td width =130>	Departure Date </td>
		  						<td width =130>	Arrival Date </td>
		  						<td width =130>	Departure Time </td>
		  						<td width =130>	Arrival Time </td>
		  						<td width =80>	Price </td>
		  						 					
		  					</tr>
		  				</table>

		<% 
		%>
		First Flight
		<% 
		if (!new_st.equals("")){
			ResultSet rs = stmt.executeQuery(new_st);
			while (rs.next()){ %>
					<table>
						<tr>
							<td width =80>	<%  out.print(rs.getString("flight_id")); %> </td>
							<td width =130> <%  out.print(rs.getString("dept_airpt_id"));%> </td>
							<td width =130> <%  out.print(rs.getString("arriv_airpt_id"));%> </td>
							<td width =80>	<%  out.print(rs.getString("airline_id")); %> </td>
							<td width =130>	<%  out.print(rs.getString("depart_date")); %> </td>
							<td width =130>	<%  out.print(rs.getString("arrival_date")); %> </td>
							<td width =130>	<%  out.print(rs.getString("depart_time")); %></td>
							<td width =130>	<%  out.print(rs.getString("arrival_time")); %> </td>
							<td width =80>	<%  out.print(rs.getString("price")); %> </td>
						</tr>
					</table>
				
				<%  }
		}
		%>
		<br><br>
		Second Flight
		<br>
		<% 
		if (!new_st2.equals("")){
			ResultSet rs2 = stmt.executeQuery(new_st2);
		
			while (rs2.next()){ %>
					<table>
						<tr>
							<td width =80>	<%  out.print(rs2.getString("flight_id")); %> </td>
							<td width =130> <%  out.print(rs2.getString("dept_airpt_id"));%> </td>
							<td width =130> <%  out.print(rs2.getString("arriv_airpt_id"));%> </td>
							<td width =80>	<%  out.print(rs2.getString("airline_id")); %> </td>
							<td width =130>	<%  out.print(rs2.getString("depart_date")); %> </td>
							<td width =130>	<%  out.print(rs2.getString("arrival_date")); %> </td>
							<td width =130>	<%  out.print(rs2.getString("depart_time")); %></td>
							<td width =130>	<%  out.print(rs2.getString("arrival_time")); %> </td>
						   <td width =80>	<%  out.print(rs2.getString("price")); %> </td>
						</tr>
					</table>
				
				<%  }  }
		
		
				 con.close();%>
		
				  
				  <br><br>
				  
	
				     
		Sort By:
 		<form>
 		<select name="sort">
 		  <option value="price">Price</option>
 		  <option value="takeofftime">Take-off time</option>
 		  <option value="landingtime">Landing time</option>
 		</select>
 		  <input  type="hidden" name="str" value="<%=new_st%>">
 		  <input  type="hidden" name="str2" value="<%=new_st2%>">
 		  <input type="submit" value="sort"  onclick="form.action='customer_sort.jsp'">
 		</form>
 		<br><br> 
 		
		Make A Reservation
		<form method="post" action="make-reservation-for-user-2.jsp">
		Enter the following information <br>
			First Flight ID <input type="text" name="first_flight_id">
			First Flight Airline <input type="text" name="first_airline_id">
			<br>
			Second Flight ID <input type="text" name="second_flight_id">
			Second Flight Airline <input type="text" name="second_airline_id">
			<br>
			Ticket Class <input type="text" name="class"> 
			<input type="submit" value="Done" >
			</form>
			
			 		<br><br>
			
				     
				     <% } catch (Exception ex) {
		out.print("Not inf available");
		
	}
%>
</body>
</html>