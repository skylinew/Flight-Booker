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
	

	
		
		String theID0 = request.getParameter("theID");
		String theID = "'" + theID0 + "'";
		
		String editUsername0 = request.getParameter("editUsername");
		String editUsername = "'" + editUsername0 + "'";
		
		String editName0 = request.getParameter("editName");
		String editName = "'" + editName0 + "'";
		
		String editPassword0 = request.getParameter("editPassword");
		String editPassword = "'" + editPassword0 + "'";
		
		String isUser = request.getParameter("command11");
		String isRep = request.getParameter("command22");
		
		out.print("<br>");
    	
	    
		try {
	
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
	
			if (isUser != null){
				String query = "UPDATE Customer SET username = " + editUsername + "," + "name = " + editName + "," + "password = " + editPassword + "WHERE username = " + theID + ";";
				int n = stmt.executeUpdate(query);
				if (n != 0) out.print("Succesfully Updated Customer");
				else out.print("0 accounts updated!");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
			}
			
			
			if (isRep != null){
				String query = "UPDATE customer_rep SET username = " + editUsername + "," + "password = " + editPassword + "," + "name = " + editName + "WHERE username = " + theID + ";";
				int n = stmt.executeUpdate(query);
				if( n != 0) out.print("Succesfully Updated Representative");
				else out.print("0 accounts updated!");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
			}
			
		
			if (isUser == null && isRep == null){
				out.print("please try again with correct fields");
						out.print("<br>");
			}
			
			
		
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>