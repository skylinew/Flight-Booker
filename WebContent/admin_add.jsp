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
	<%
	


		
	
		String userName = "'" + request.getParameter("addUsername") + "'";
		String name = "'" +  request.getParameter("addName") + "'";	
		String password =  "'" + request.getParameter("addPassword") + "'";
		
		String isUser = request.getParameter("command111");
		String isRep = request.getParameter("command222");
		
		out.print("<br>");
    	
	    
		try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
	
			if (isUser != null){
				String query = "INSERT INTO Customer VALUES (" + userName + "," + name + "," + password + ");";
				int n = stmt.executeUpdate(query);
				out.print("Succesfully added Customer");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
				
			}
			
			if (isRep != null){
				String query = "INSERT INTO customer_rep VALUES (" + userName + "," + password + "," + name +  ");";
				int n = stmt.executeUpdate(query);
				out.print("Succesfully added Representative");
			}
			
			
		
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>