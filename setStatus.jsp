<%@page import="java.sql.ResultSet"%>
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
String id=request.getParameter("uid");
Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_system","root","");

String q="select * from login where id='"+id+"'";

PreparedStatement psmt=conn.prepareStatement(q);

ResultSet rs=psmt.executeQuery();

rs.next();

String user_status=rs.getString("status");

if(user_status.equals("Active"))
{
	String st = "Block";
	String q1="update login set status='"+st+"' where id='"+id+"'";
	PreparedStatement psmt1 = conn.prepareStatement(q1);
	int row=psmt1.executeUpdate();
	if(row>0){
		response.sendRedirect("Usercontrol.jsp");
	}
}
	else{
		String st = "Active";
		String q1="update login set status='"+st+"' where id='"+id+"'";
		PreparedStatement psmt1 = conn.prepareStatement(q1);
		int row=psmt1.executeUpdate();
		if(row>0){
			response.sendRedirect("Usercontrol.jsp");	
	}
	}

%>
</body>
</html>