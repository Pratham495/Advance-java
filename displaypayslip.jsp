<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<%@ include file="Admin.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String q1 = "select * from  payslip ";
	PreparedStatement psmt1 = con.prepareStatement(q1);
	ResultSet rs1 = psmt1.executeQuery();
	%>
	<table class="table table-white"
		style="width: 50%; position: absolute; left: 20%; top: 20%;">
		<thead class="thead-dark">
			<tr>
				<th scope="col">id</th>
				<th scope="col">name</th>
				<th scope="col">email</th>
				<th scope="col">contact</th>
				<th scope="col">doj</th>
				<th scope="col">dos</th>
				<th scope="col">bsalary</th>
				<th scope="col">pf</th>
				<th scope="col">netsalary</th>
			</tr>
		</thead>

		<%
		while (rs1.next()) {
			String ps_name, ps_email, ps_contact, ps_doj, ps_dos;
			double ps_bsalary, ps_pf, ps_netsalary;
			int ps_id;

			ps_id = rs1.getInt("id");
			ps_name = rs1.getString("name");
			ps_email = rs1.getString("email");
			ps_contact = rs1.getString("contact");
			ps_doj = rs1.getString("DOJ");
			ps_dos = rs1.getString("DOS");
			ps_bsalary = rs1.getDouble("bsalary");
			ps_pf = rs1.getDouble("pf");
			ps_netsalary = rs1.getDouble("netsalary");
		%>
		<tbody>
			<tr>
				<th scope="row"><%=ps_id%></th>
				<td><%=ps_name%></td>
				<td><%=ps_email%></td>
				<td><%=ps_contact%></td>
				<td><%=ps_doj%></td>
				<td><%=ps_dos%></td>
				<td><%=ps_bsalary%></td>
				<td><%=ps_pf%></td>
				<td><%=ps_netsalary%></td>
			</tr>

		</tbody>


		<%
		}
		%>
	
</body>
</html>