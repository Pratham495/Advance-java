<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ include file="Admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

	String type="User";
	String q1="select * from login where role='"+type+"'";
	PreparedStatement psmt1 = con.prepareStatement(q1);
	ResultSet rs1=psmt1.executeQuery();
%>
<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">ID</th>
	      <th scope="col">Username</th>
	      <th scope="col">Email</th>
	      <th scope="col">Password</th>
	      <th scope="col">Role</th>
	      <th scope="col">Access</th>
	    </tr>
	  </thead>
	  
	<%
	while(rs1.next())
	{
		String st_name,st_email,st_pass,st_role,st_status;
		int st_id;
		
		st_id=rs1.getInt("id");
		st_name=rs1.getString("username");
		st_email=rs1.getString("email");
		st_pass=rs1.getString("password");
		st_role=rs1.getString("role");
		st_status=rs1.getString("status");
		
		%>
		<tbody>
	    <tr>
	      <th scope="row"><%=st_id %></th>
	      <td><%=st_name %></td>
	      <td><%=st_email %></td>
	      <td><%=st_pass %></td>
	      <td><%=st_role %></td>
	      <td>
	      <%
	      	if(st_status.equals("Active"))
	      	{
	      		%><a href="setStatus.jsp?uid=<%=st_id %>"><button type="button" class="btn btn-sm btn-danger">Block</button></a><%		
	      	}
	      	else
	      	{
	      		%><a href="setStatus.jsp?uid=<%=st_id %>"><button type="button" class="btn btn-sm btn-success">Active</button></a><%
	      	}
	      %>
	      </td>
	      
	    </tr>
	  </tbody>
	
	<%		
	}
%>
</body>
</html>