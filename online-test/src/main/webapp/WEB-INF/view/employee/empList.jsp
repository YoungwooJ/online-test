<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empList.jsp</title>
</head>
<body>
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<h1>직원 목록</h1>
	<a href="${pageContext.request.contextPath}/employee/addEmp">직원등록</a>
	<table border="1">
		<tr>
			<th>직원 아이디</th>
			<th>직원 이름</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="e" items="${list}">
			<tr>
				<td>${e.empId}</td>
				<td>${e.empName}</td>
				<td>
					<a href="${pageContext.request.contextPath}/employee/removeEmp?empNo=${e.empNo}">
						삭제
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1">처음</a>
		<c:if test="${currentPage > 1}">
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage}">${currentPage}</a>
		<c:if test="${currentPage < 50}">
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=50">마지막</a>
	</div>
	
	<!-- 검색 기능 -->
	<form method="get" action="${pageContext.request.contextPath}/employee/empList">
		<input type="text" placeholder="직원 이름" name="search">
		<button type="submit">검색</button>
	</form>
</body>
</html>