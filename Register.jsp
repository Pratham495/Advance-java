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
try{
	String Remail,Rusername,Rpassword,Rcpassword,RRole="User";
	
	
	Remail=request.getParameter("R_email");
	Rusername=request.getParameter("R_username");
	Rpassword=request.getParameter("R_password");
	Rcpassword=request.getParameter("R_cpassword");
	
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_system","root","");
	
	String q="insert into login(email,username,password,confirm_password,role)values('"+Remail+"','"+Rusername+"','"+Rpassword+"','"+Rcpassword+"','"+RRole+"')";
	PreparedStatement psmt = con.prepareStatement(q);
	int row=psmt.executeUpdate();
	if(row>0){
		%>
		<script>
		alert("Register successfully");window.location.href="index.jsp";</script>
		<%
	}else{
		out.println("wrong");
	}
	
}catch(Exception e){
	out.println(e);

}	
%>



