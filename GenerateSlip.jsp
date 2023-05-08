<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@include file="Admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br><br>
<form  method="post" style="width:30%">
<div class="form-group">
    <input type="text" name="staff_id" class="form-control" id="exampleInputPassword1" placeholder="Enter staff request">
  </div>
<button type="submit" class="btn btn-primary">Search</button>
</form>

<br>

<%
try{
	String st_name,st_email,st_contact,st_doj,st_dos;
	 double st_salary;
	    		
	  int search=Integer.parseInt(request.getParameter("staff_id"));
	  
	 
		
		String query1="select * from staff where id='"+search+"'";
		PreparedStatement psmt1=con.prepareStatement(query1);
		ResultSet rs1=psmt1.executeQuery();
		
		while(rs1.next()){
			st_name=rs1.getString("name");
			st_email=rs1.getString("email");
			st_contact=rs1.getString("contact");
			st_doj=rs1.getString("DOJ");
			st_salary=rs1.getDouble("salary");
			%> 
			<form method="post" style="width:40%" action="saveplayslip.jsp">
			  <div class="form-group">
			  <div class="form-group">
			    <label for="exampleInputPassword1">Name</label>
			    <input type="text" name="staff_name" value="<%=st_name %>"class="form-control" id="exampleInputPassword1" placeholder="Name">
			  </div>
			    <label for="exampleInputEmail1">Email</label>
			    <input type="email"  name="staff_email"value="<%=st_email %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
			    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Contact</label>
			    <input type="text"  name="staff_contact" value="<%=st_contact %>"class="form-control" id="exampleInputPassword1" placeholder="Number">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Date Of Joining</label>
			    <input type="Date"  name="staff_doj"value="<%=st_doj %>" class="form-control" id="exampleInputPassword1" placeholder="Date">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Salary</label>
			    <input type="number"  name="staff_salary" value="<%=st_salary %>"class="form-control" id="exampleInputPassword1" placeholder="Salary">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">Date Of Salary</label>
			    <input type="Date"  name="staff_dos" class="form-control" id="exampleInputPassword1" placeholder="Date">
			  </div>
			  <button type="submit" class="btn btn-primary">Generate</button>
			</form>
<%
}
}
catch(Exception e)
{
	
}
 
%>




</body>
</html>