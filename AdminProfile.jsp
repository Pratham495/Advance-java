<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="Admin.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String em=(String)session.getAttribute("myuser");

	String query="select * from login where email='"+em+"'";
	
	PreparedStatement ps=con.prepareStatement(query);
	
	ResultSet r=ps.executeQuery();
	
	while(r.next())
	{
		String username,password,ema,role;
		
		username=r.getString("username");
		password=r.getString("password");
		ema=r.getString("email");
		role=r.getString("role");
		%>
		<br>
		<div class="card" style="width: 18rem;left: 20%; top: 20%; border:10px solid black ">
		  <img class="card-img-top" src="thor.jpg" alt="Card image cap">
		  <div class="card-body">
		<h5 class="card-title"><%=username %></h5>
		    <p class="card-text">ADMIN CARD</p>
		  </div>
		  <ul class="list-group list-group-flush">
		    <li class="list-group-item">Email : <%=ema %></li>
		    <li class="list-group-item">Password: <%=password %></li>
		    
		  </ul>
		  <div class="card-body">
		    <a href="#" class="card-link">Role</a>
		    <a href="#" class="card-link"><%=role %></a>
		  </div>
		</div>
		<%
	}
%>

</body>
</html>