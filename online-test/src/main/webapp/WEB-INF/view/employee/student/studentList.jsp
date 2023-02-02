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
	
	<h1>학생 목록</h1>
	<a href="${pageContext.request.contextPath}/employee/student/addStudent">학생등록</a>
	<table border="1">
		<tr>
			<th>학생 아이디</th>
			<th>학생 이름</th>
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
	
	<!-- 검색 기능 -->
	<form method="get" action="${pageContext.request.contextPath}/employee/student/studentList">
		<input type="text" placeholder="학생 이름" name="searchWord">
		<button type="submit">검색</button>
	</form>
	
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${startPage}&searchWord=${searchWord}">처음</a>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		<c:forEach begin="${blockStartNum}" end="${endPage}" step="1" varStatus="status">
			<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${status.current}&searchWord=${searchWord}">${status.current}</a>
		</c:forEach>
		<c:if test="${currentPage < endPage}">
		<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/student/studentList?currentPage=${endPage}&searchWord=${searchWord}">마지막</a>
	</div>
</body>
</html>