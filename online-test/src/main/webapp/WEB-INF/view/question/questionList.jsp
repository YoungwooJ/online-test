<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questioniList.jsp</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h1>시험 문제</h1>
	<a href="${pageContext.request.contextPath}/question/addQuestion?testNo=${testNo}">문제 추가</a>
	<table border="1">
		<c:forEach var="q" items="${list}">
			<c:forEach var="e" items="${exList}">
				<tr>
					<th>${q.questionIdx}. ${q.questionTitle}</th>
					<td>
						<a href="${pageContext.request.contextPath}/question/modifyQuestion?questionNo=${q.questionNo}">
							수정
						</a>
						<a href="${pageContext.request.contextPath}/question/removeQuestion?questionNo=${q.questionNo}">
							삭제
						</a>
					</td>
				</tr>
				<tr>
					<td>${e.exampleIdx}. ${q.exampleTitle}</td>
					<td>
						<a href="${pageContext.request.contextPath}/example/addExample?questionNo=${q.questionNo}">
							수정
						</a>
						<a href="${pageContext.request.contextPath}/example/modifyExample?exampleNo=${e.exampleNo}">
							수정
						</a>
						<a href="${pageContext.request.contextPath}/example/removeExample?exampleNo=${e.exampleNo}">
							삭제
						</a>
					</td>
				</tr>
			</c:forEach>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${startPage}">처음</a>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${currentPage-1}">이전</a>
		</c:if>
		<c:choose>
			<c:when test="${endPage > 10}">
				<c:forEach begin="${blockStartNum}" end="${blockLastNum}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${status.current}">${status.current}</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin="${startPage}" end="${endPage}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${status.current}">${status.current}</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${currentPage < endPage}">
		<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${currentPage+1}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${endPage}">마지막</a>
	</div>
</body>
</html>