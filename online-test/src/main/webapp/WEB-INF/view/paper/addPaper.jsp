<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addPaper.jsp</title>
</head>
<body>
	<h1>답안 추가</h1>
	<div style="color:red;">${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/paper/addPaper">
		<table border="1">
			<tr>
				<td>시험 번호</td>
				<td><input type="number" name="testNo" value="${testNo}"></td>
			</tr>
			<tr>
				<td>문제 번호</td>
				<td><input type="number" name="questionIdx"></td>
			</tr>
			<tr>
				<td>문제 제목</td>
				<td><input type="text" name="questionTitle"></td>
			</tr>
		</table>
		<button type="submit">문제추가</button>
	</form>
</body>
</html>