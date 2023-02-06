<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addTest.jsp</title>
</head>
<body>
	<h1>시험추가</h1>
	<div style="color:red;">${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/test/addTest">
		<table border="1">
			<tr>
				<td>시험 제목</td>
				<td><input type="text" name="testTitle"></td>
			</tr>
		</table>
		<button type="submit">시험추가</button>
	</form>
</body>
</html>