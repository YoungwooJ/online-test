<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addQuestion.jsp</title>
</head>
<body>
	<!-- menu include -->
	<c:choose>
		<c:when test="${loginTeacher ne null}">
			<div>
				<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
			</div>
		</c:when>
		<c:when test="${loginStudent ne null}">
			<div>
				<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
			</div>
		</c:when>
	</c:choose>

	<h1>문제추가</h1>
	<div style="color:red;">${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/question/addQuestion">
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