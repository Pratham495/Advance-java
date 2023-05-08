<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String uid=request.getParameter("did");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_system","root","");
String q = "delete from staff where id='"+uid+"'";
PreparedStatement psmt = conn.prepareStatement(q);
int row=psmt.executeUpdate();
if(row>0)
{
response.sendRedirect("displaystaff.jsp");	
}
else{
	out.println("wrong");
}


%>
</body>
</html>