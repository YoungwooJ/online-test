<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paperList.jsp</title>
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
	
	<h1>시험 제출 답안 목록</h1>
	<table border="1">
		<c:forEach var="m" items="${list}">
				<tr>
					<th>시험명</th>
					<th>시험일</th>
					<th>응시자</th>
					<th>점수</th>
					<th>등급</th>
				</tr>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/paper/paperOne?studentNo=${m.studentNo}&testNo=${m.testNo}">
							${m.testTitle}
						</a>
					</td>
					<td>${m.testDate}</td>
					<td>
						${m.studentName}
					</td>
					<td>${m.score}점</td>
					<td>${m.grade}</td>
				</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/paper/paperList?currentPage=${startPage}">처음</a>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/paper/paperList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<c:choose>
			<c:when test="${endPage > 10}">
				<c:forEach begin="${blockStartNum}" end="${blockLastNum}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/paper/paperList?currentPage=${status.current}">${status.current}</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin="${startPage}" end="${endPage}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/paper/paperList?currentPage=${status.current}">${status.current}</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${currentPage < endPage}">
		<a href="${pageContext.request.contextPath}/paper/paperList?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/paper/paperList?currentPage=${endPage}">마지막</a>
	</div>
</body>
</html>