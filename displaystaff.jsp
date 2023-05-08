<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
    <%@ include file="Admin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String q1="select * from staff ";
PreparedStatement psmt1 = con.prepareStatement(q1);
ResultSet rs1=psmt1.executeQuery();
%>

<table class="table table-white" style="width:50%; position:absolute; left:20%; top:20%; ">
  <thead class="thead-dark">
    <tr>
      <th scope="col">id</th>
      <th scope="col">name</th>
      <th scope="col">email</th>
      <th scope="col">contact</th>
      <th scope="col">doj</th>
      <th scope="col">salary</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
<%
while(rs1.next()){
	
	String st_name,st_email,st_contact,st_doj;
	double st_salary;
	int st_id;
	st_id=rs1.getInt("id");
	st_name=rs1.getString("name");
	st_email=rs1.getString("email");
	st_contact=rs1.getString("contact");
	st_doj=rs1.getString("DOJ");
	st_salary=rs1.getDouble("bsalary");
	%>
	<tbody>
    <tr>
      <th scope="row"><%=st_id %></th>
      <td><%=st_name %></td>
      <td><%=st_email %></td>
      <td><%=st_contact %></td>
      <td><%=st_doj %></td>
      <td><%=st_salary %></td>
      <td><a href="deleteStaff.jsp?did=<%=st_id%>"><button type="button" class="btn btn-danger">Delete</button></a></td>
      <td><a href="editStaff.jsp?eid=<%=st_id%>"><button type="button" class="btn btn-success">Edit</button></a></td>
    </tr>
    
  </tbody>
<%
}

%>
</body>
</html>