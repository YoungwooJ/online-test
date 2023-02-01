<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addStudent.jsp</title>
</head>
<body>
	<h1>학생 추가</h1>
	<div style="color:red;">${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/employee/student/addStudent">
		<table border="1">
			<tr>
				<td>학생 아이디</td>
				<td><input type="text" name="studentId"></td>
			</tr>
			<tr>
				<td>학생 비밀번호</td>
				<td><input type="password" name="studentPw"></td>
			</tr>
			<tr>
				<td>학생 이름</td>
				<td><input type="text" name="studentName"></td>
			</tr>	
		</table>
		<button type="submit">학생추가</button>
	</form>
</body>
</html>