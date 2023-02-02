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
	
	<!-- 검색 기능 -->
	<form method="get" action="${pageContext.request.contextPath}/employee/empList">
		<input type="text" placeholder="직원 이름" name="searchWord" value="${searchWord}">
		<button type="submit">검색</button>
	</form>
	
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${startPage}&searchWord=${searchWord}">처음</a>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		<c:choose>
			<c:when test="${endPage > 10}">
				<c:forEach begin="${blockStartNum}" end="${blockLastNum}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${status.current}&searchWord=${searchWord}">${status.current}</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin="${startPage}" end="${endPage}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${status.current}&searchWord=${searchWord}">${status.current}</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${currentPage < endPage}">
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${endPage}&searchWord=${searchWord}">마지막</a>
	</div>
</body>
</html>