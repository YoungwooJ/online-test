<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paperOne.jsp</title>
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
	
	<h1>${testTitle} 제출 답안지</h1>
	<div>응시자 : ${studentName}</div>
	<div>점수 : ${score}점 / 등급 : ${grade}</div>
	<table border="1">
		<c:forEach var="m" items="${list}">
				<tr>
					<th>문제 ${m.questionIdx}번. ${m.questionTitle}</th>
					<!-- 
					<td>
						<a href="${pageContext.request.contextPath}/paper/modifyPaper?paperNo=${p.paperNo}">
							수정
						</a>
						<a href="${pageContext.request.contextPath}/paper/removePaper?paperNo=${p.paperNo}">
							삭제
						</a>
					</td>
					 -->
				</tr>
				<tr>
					<td>${m.answer}</td>
				</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${startPage}">처음</a>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<c:choose>
			<c:when test="${endPage > 10}">
				<c:forEach begin="${blockStartNum}" end="${blockLastNum}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${status.current}">${status.current}</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin="${startPage}" end="${endPage}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${status.current}">${status.current}</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${currentPage < endPage}">
		<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${endPage}">마지막</a>
	</div>
</body>
</html>