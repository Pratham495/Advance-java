<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<%
String sid=request.getParameter("eid");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_system","root","");

String q = "select * from staff where id='"+sid+"'";

PreparedStatement psmt = conn.prepareStatement(q);
ResultSet rs=psmt.executeQuery();

while(rs.next()){
	String name,email,contact,doj;
	double bsalary;
	int id=rs.getInt("id");
	
	name=rs.getString("name");
	email=rs.getString("email");
	contact=rs.getString("contact");
	doj=rs.getString("doj");
	bsalary=rs.getDouble("bsalary");
	%>
	<form method="post" action="updateStaff.jsp?uid=<%=id %>">
	  <div class="form-group">
	    <label for="exampleInputEmail1">Name</label>
	    <input type="text" name="staff_name" value="<%=name %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
	 
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputEmail1">Email</label>
	    <input type="text" name="staff_email" value="<%=email %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
	 
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputEmail1">Contact</label>
	    <input type="text" name="staff_contact" value="<%=contact %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Contact">
	 
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputEmail1">Date Of Joining</label>
	    <input type="date" name="staff_doj" value="<%=doj %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
	 
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputEmail1">Salary</label>
	    <input type="text" name="staff_salary" value="<%=bsalary %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Salary">
	 
	  </div>
	  
	  
	  <button type="submit" class="btn btn-primary">Update</button>
  </form>
<%
}
%>

</body>
</html>