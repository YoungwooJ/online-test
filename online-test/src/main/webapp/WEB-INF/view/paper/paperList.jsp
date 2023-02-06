<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paperList.jsp</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h1>제출 답안</h1>
	<a href="${pageContext.request.contextPath}/paper/addPaper?paperNo=${paperNo}">문제 추가</a>
	<table border="1">
		<c:forEach var="p" items="${list}">
				<tr>
					<th>${p.questionNo}. ${p.answer}</th>
					<td>
						<a href="${pageContext.request.contextPath}/paper/modifyPaper?paperNo=${p.paperNo}">
							수정
						</a>
						<a href="${pageContext.request.contextPath}/paper/removePaper?paperNo=${p.paperNo}">
							삭제
						</a>
					</td>
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