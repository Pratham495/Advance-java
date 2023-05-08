<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	String Rusername, Rpassword;

	Rusername = request.getParameter("R_username");
	Rpassword = request.getParameter("R_password");

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_system", "root", "");

	String q = "select * from login where email='" + Rusername + "' AND password='" + Rpassword + "'";
	PreparedStatement psmt = con.prepareStatement(q);
	ResultSet rs = psmt.executeQuery();

	session.setAttribute("myuser",Rusername);
	while (rs.next())
	{
		if(rs.getString("email").equals(Rusername) && rs.getString("password").equals(Rpassword) && rs.getString("role").equals("Admin") && rs.getString("status").equals("Active"))
		{
			response.sendRedirect("Admin.jsp");
		}

	else if(rs.getString("email").equals(Rusername) && rs.getString("password").equals(Rpassword) && rs.getString("role").equals("Admin") && rs.getString("status").equals("Block"))
	{
		%><script>alert("Your Account is temparary Blocked so kindly co-ordinate with Admin")</script><%
		response.sendRedirect("index.jsp");
	}
		
		else if(rs.getString("email").equals(Rusername) && rs.getString("password").equals(Rpassword) && rs.getString("role").equals("User") && rs.getString("status").equals("Active"))
		{
			response.sendRedirect("User.jsp");
		}

		else if(rs.getString("email").equals(Rusername) && rs.getString("password").equals(Rpassword) && rs.getString("role").equals("User") && rs.getString("status").equals("Block"))
		{
			%>
			<script>alert("Your Account is temparary Blocked so kindly co-ordinate with Admin")</script>
			<jsp:include page="index.jsp"></jsp:include>
			
			<%
			
		}
	}
	%>

	<script>
		alert("invalid content");
		window.location.href = "index.jsp";
	</script>
</body>
</html>