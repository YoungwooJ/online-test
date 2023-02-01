<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addEmp.jsp</title>
</head>
<body>
	<h1>사원추가</h1>
	<div style="color:red;">${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/employee/addEmp">
		<table border="1">
			<tr>
				<td>직원 아이디</td>
				<td><input type="text" name="empId"></td>
			</tr>
			<tr>
				<td>직원 비밀번호</td>
				<td><input type="password" name="empPw"></td>
			</tr>
			<tr>
				<td>직원 이름</td>
				<td><input type="text" name="empName"></td>
			</tr>	
		</table>
		<button type="submit">사원추가</button>
	</form>
</body>
</html>