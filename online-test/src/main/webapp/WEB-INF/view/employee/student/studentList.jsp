<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentList.jsp</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>Student List</h1>
	<a href="${pageContext.request.contextPath}/employee/student/addStudent">학생등록</a>
	<table border="1">
		<tr>
			<th>studentId</th>
			<th>studentName</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="s" items="${list}">
			<tr>
				<td>${s.studentId}</td>
				<td>${s.studentName}</td>
				<td>
					<a href="${pageContext.request.contextPath}/employee/student/removeStudent?studentNo=${s.studentNo}">
						삭제
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=1">처음</a>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${currentPage}">${currentPage}</a>
		<c:if test="${currentPage < 50}">
		<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=50">마지막</a>
	</div>
</body>
</html>