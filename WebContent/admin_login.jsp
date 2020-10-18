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
	<%
		List<String> list = new ArrayList<String>();

		try {
			
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			Statement stmt = con.createStatement();
			
			String userName = "'" + request.getParameter("username") + "'";
			String password = "'" + request.getParameter("password") + "'";

			String str = "SELECT * FROM Admin WHERE username = " + userName + " and password = " + password;

			ResultSet result = stmt.executeQuery(str);
		
			if (result.next()){
				String url = "admin_home.jsp";
				response.sendRedirect(url);
				 %>

<%
			}
			else{
				out.print("Please enter the correct username and password"); %>
				<br>
				<br>
				<form method="post" action="index.jsp">
					<input type="submit" value="Go back to the main page" >
					</form>
				<% 
			}
			
			con.close();

		} catch (Exception e) {
			out.print("Please enter the correct username and password");%>
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