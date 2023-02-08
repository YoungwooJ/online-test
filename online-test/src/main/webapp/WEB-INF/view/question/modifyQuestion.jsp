<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>modifyQuestion</title>
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

	<h1>시험 제목 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/question/modifyQuestion">
		<table border="1">
			<tr>
				<td>문제 번호</td>
				<td>
					<input type="number" name="questionIdx" value="${question.questionIdx}" readonly="readonly">
					<input type="hidden" name="questionNo" value="${question.questionNo}">
					<input type="hidden" name="testNo" value="${testNo}">
				</td>
			</tr>
			<tr>
				<td>문제 제목</td>
				<td>
					<input type="text" name="questionTitle" value="${question.questionTitle}">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>