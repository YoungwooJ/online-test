<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addTeacher.jsp</title>
</head>
<body>
	<h1>선생님 추가</h1>
	<div style="color:red;">${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/employee/teacher/addTeacher">
		<table border="1">
			<tr>
				<td>선생님 아이디</td>
				<td><input type="text" name="teacherId"></td>
			</tr>
			<tr>
				<td>선생님 비밀번호</td>
				<td><input type="password" name="teacherPw"></td>
			</tr>
			<tr>
				<td>선생님 이름</td>
				<td><input type="text" name="teacherName"></td>
			</tr>	
		</table>
		<button type="submit">선생님 추가</button>
	</form>
</body>
</html>