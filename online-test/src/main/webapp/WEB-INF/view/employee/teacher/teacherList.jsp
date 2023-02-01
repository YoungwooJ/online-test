<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teacherList.jsp</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>선생님 목록</h1>
	<a href="${pageContext.request.contextPath}/employee/teacher/addTeacher">선생님 등록</a>
	<table border="1">
		<tr>
			<th>선생님 아이디</th>
			<th>선생님 이름</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.teacherId}</td>
				<td>${t.teacherName}</td>
				<td>
					<a href="${pageContext.request.contextPath}/employee/teacher/removeTeacher?teacherNo=${t.teacherNo}">
						삭제
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=1">처음</a>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=${currentPage}">${currentPage}</a>
		<c:if test="${currentPage < 50}">
		<a href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=50">마지막</a>
	</div>
</body>
</html>