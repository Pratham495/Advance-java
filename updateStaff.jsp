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

String Sname,Semail,Scontact,Sdoj;
double Ssalary;

Sname=request.getParameter("staff_name");
Semail=request.getParameter("staff_email");
Scontact=request.getParameter("staff_contact");
Sdoj=request.getParameter("staff_doj");
Ssalary=Double.parseDouble(request.getParameter("staff_salary"));

try{
	String sid=request.getParameter("uid");
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_system","root","");
	
	String q="update staff set name='"+Sname+"',email='"+Semail+"',contact='"+Scontact+"',doj='"+Sdoj+"',bsalary='"+Ssalary+"' where id='"+sid+"'";	PreparedStatement psmt=con.prepareStatement(q);
	int row=psmt.executeUpdate();
	if(row>0)
	{
		response.sendRedirect("displaystaff.jsp");
	}
	else
	{
		out.println("wrong");
	}
}catch(Exception e){
	
}

%>
</body>
</html>