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
	

	
		
		String userName0 = request.getParameter("deleteID");
		String userName = "'" + userName0+ "'";
		String isUser = request.getParameter("command1");
		String isRep = request.getParameter("command2");
		
		out.print("<br>");
    	
	    
		try {
		
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			Statement stmt = con.createStatement();
	
			if (isUser != null){
				String query = "DELETE FROM Customer WHERE username = " + userName + ";";
				int n = stmt.executeUpdate(query);
				
				if (n != 0) out.print("Succesfully deleted Customer with UserID:  " + "<i>" + userName0 + "</i>");
				else out.print("Customer Not Found. <br> Did you select the right account type?");
				out.print("<br>");
				out.print("<br>");
				out.print("<br>");
			
			}
			
			if (isRep != null){
				String query = "DELETE FROM customer_rep where username = " + userName + ";";
				int n = stmt.executeUpdate(query);
				if (n != 0)out.print("Succesfully deleted Representative with UserID:  " + "<i>" + userName0 + "</i>");
				else out.print("Representative Not Found. <br> Did you select the right account type?");
			}
			
			if (isUser == null && isRep == null) out.print("User type not selected, return home!");
			
			
			
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>