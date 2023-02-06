<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyTest</title>
</head>
<body>
	<h1>시험 제목 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/test/modifyTest">
		<table border="1">
			<tr>
				<td>시험 번호</td>
				<td>
					<input type="number" name="testNo" value="${testNo}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>시험 제목</td>
				<td>
					<input type="text" name="testTitle" value="${testTitle}">
				</td>
			</tr>
			<tr>
				<td>생성 날짜</td>
				<td>
					<input type="text" name="testDate" value="${testDate}" readonly="readonly">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>