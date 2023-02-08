<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginTeacher.jsp</title>
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

	<!-- 로그인 전 -->
	<c:if test="${loginTeacher eq null}">
		<h1>선생님 로그인</h1>
		<form method="post" action="${pageContext.request.contextPath}/loginTeacher">
			<table border="1">
				<tr>
					<td>선생님 아이디</td>
					<td><input type="text" name="teacherId"></td>
				</tr>
				<tr>
					<td>선생님 비밀번호</td>
					<td><input type="password" name="teacherPw"></td>
				</tr>
			</table>
			<button type="submit">로그인</button>
		</form>
	</c:if>
	
	<!-- 로그인 상태 -->
	<c:if test="${loginTeacher ne null}">
		${loginTeacher.teacherName}님 반갑습니다.
		<a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">비밀번호 수정</a>
		<a href="${pageContext.request.contextPath}/teacher/logout">로그아웃</a>
	</c:if>
</body>
</html>