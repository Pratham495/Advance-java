<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	String Sname,Semail,Scontact,Sdoj;
	double Salary;
	
	Sname=request.getParameter("staff_name");
	Semail=request.getParameter("staff_email");
	Scontact=request.getParameter("staff_contact");
	Sdoj=request.getParameter("staff_doj");
	Salary=Double.parseDouble(request.getParameter("staff_salary"));
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/emp_system","root","");
	
	String q="insert into staff(name,email,contact,DOJ,bsalary)values('"+Sname+"','"+Semail+"','"+Scontact+"','"+Sdoj+"','"+Salary+"')";
	PreparedStatement psmt = con.prepareStatement(q);
	int row=psmt.executeUpdate();
	if(row>0){
		%>
		<script>
		alert("staff added successfully");window.location.href="Admin.jsp";
		//it is used for popup message 
		</script>
		<%
	}else{
		out.println("wrong");
	}
	
}catch(Exception e){
	out.println(e);
}
	
	
%>
</body>
</html>