<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addExample.jsp</title>
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

	<h1>보기추가</h1>
	<div style="color:red;">${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/example/addExample">
		<table border="1">
			<tr>
				<td>문제 번호</td>
				<td>
					<input type="number" name="questionNo" value="${questionNo}" readonly="readonly">
					<input type="hidden" name="testNo" value="${testNo}">
				</td>
			</tr>
			<tr>
				<td>보기 번호</td>
				<td><input type="number" name="exampleIdx"></td>
			</tr>
			<tr>
				<td>보기 제목</td>
				<td><input type="text" name="exampleTitle"></td>
			</tr>
			<tr>
				<td>보기 정답여부</td>
				<td>
					<input type="radio" name="exampleOx" value="정답">정답
					<input type="radio" name="exampleOx" value="오답">오답
				</td>
			</tr>
		</table>
		<button type="submit">보기추가</button>
	</form>
</body>
</html>