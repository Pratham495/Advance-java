<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
  <a class="navbar-brand" href="#">Admin Dashboard</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <%
      String email=(String)session.getAttribute("myuser");
      
      Class.forName("com.mysql.cj.jdbc.Driver");
  	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_system", "root", "");
  	
  	String q = "select * from login where email='"+email+"'";
  	
  	PreparedStatement psmt = con.prepareStatement(q);
  	 ResultSet rs = psmt.executeQuery();
  	 rs.next();
  	 String user = rs.getString("username");
      %>
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Hello <%=user %>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="AdminProfile.jsp">Profile</a>
          <a class="dropdown-item" href="Usercontrol.jsp">user control</a>
          <a class="dropdown-item" href="Logout.jsp">Logout</a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
      
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Access
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#"data-toggle="modal" data-target="#exampleModal">Add Staff</a>
          <a class="dropdown-item" href="displaystaff.jsp">Staff Details</a>
          <a class="dropdown-item" href="displaypayslip.jsp">Generate Payslip</a>
          <a class="dropdown-item" href="">Staff Payslip</a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
      
    </ul>
   
  </div>
</nav>
</body>
</html>





<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Staff</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form method="post" action="savestaff.jsp">
  <div class="form-group">
  <div class="form-group">
    <label for="exampleInputPassword1">Name</label>
    <input type="text" name="staff_name" class="form-control" id="exampleInputPassword1" placeholder="Name">
  </div>
    <label for="exampleInputEmail1">Email</label>
    <input type="email"  name="staff_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Contact</label>
    <input type="Number"  name="staff_contact" class="form-control" id="exampleInputPassword1" placeholder="Number">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Date Of Joining</label>
    <input type="Date"  name="staff_doj" class="form-control" id="exampleInputPassword1" placeholder="Date">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Salary</label>
    <input type="Number"  name="staff_salary" class="form-control" id="exampleInputPassword1" placeholder="Salary">
  </div>
  <button type="submit" class="btn btn-primary">Add</button>
</form>
      </div>
      
    </div>
  </div>
</div>







