<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>College Fest</title>
</head>
<body>
	<div class="container">
		<h1 class="text-center pt-5" style="color: #000080;">Student
			Registration List for College Fest</h1>
		<hr>
		<br> <br>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Student Id</th>
					<th scope="col">Name</th>
					<th scope="col">Department</th>
					<th scope="col">Country</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Student}" var="student">
					<tr>
						<th scope="row"><c:out value="${student.id}" /></th>
						<td><c:out value="${student.name}" /></td>
						<td><c:out value="${student.department}" /></td>
						<td><c:out value="${student.country}" /></td>
						<td>
							<!-- Add "update" button/link --> 
							<a href="/CollegeFestEvent/student/update?studentId=${student.id}"	class="btn btn-primary btn-md mr-3">Update</a> 
							<!-- Add "delete" button/link -->
							<a href="/CollegeFestEvent/student/delete?studentId=${student.id}" class="btn btn-danger btn-md" 
							onclick="if (!(confirm('Are you sure you want to delete this entry?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a style="background-color: #ff3e6c;border:none;font-weight:500;" href="/CollegeFestEvent/student/add"	class="btn btn-primary mr-3">Add Student  </a>

	</div>
</body>
</html>
