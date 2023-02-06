<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testList.jsp</title>
</head>
<body>
	<!-- teacherMenu include -->
	<div>
		<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
	</div>
	
	<h1>시험 목록</h1>
	<a href="${pageContext.request.contextPath}/test/addTest">시험등록</a>
	<table border="1">
		<tr>
			<th>시험 번호</th>
			<th>시험 제목</th>
			<th>시험 날짜</th>
			<th>수정/삭제</th>
		</tr>
		<c:forEach var="t" items="${list}">
			<tr>
				<td>${t.testNo}</td>
				<td>
				<a href="${pageContext.request.contextPath}/question/questionList?testNo=${t.testNo}">
					${t.testTitle}
				</a>
				</td>
				<td>${t.testDate}</td>
				<td>
					<a href="${pageContext.request.contextPath}/test/modifyTest?testNo=${t.testNo}">
						수정
					</a>
					<a href="${pageContext.request.contextPath}/test/removeTest?testNo=${t.testNo}">
						삭제
					</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 검색 기능 -->
	<form method="get" action="${pageContext.request.contextPath}/test/testList">
		<input type="text" placeholder="시험 이름" name="searchWord" value="${searchWord}">
		<button type="submit">검색</button>
	</form>
	
	<!-- 페이징 -->
	<div>
		<a href="${pageContext.request.contextPath}/test/testList?currentPage=${startPage}&searchWord=${searchWord}">처음</a>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/test/testList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
		</c:if>
		<c:choose>
			<c:when test="${endPage > 10}">
				<c:forEach begin="${blockStartNum}" end="${blockLastNum}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/test/testList?currentPage=${status.current}&searchWord=${searchWord}">${status.current}</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin="${startPage}" end="${endPage}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/test/testList?currentPage=${status.current}&searchWord=${searchWord}">${status.current}</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${currentPage < endPage}">
		<a href="${pageContext.request.contextPath}/test/testList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/test/testList?currentPage=${endPage}&searchWord=${searchWord}">마지막</a>
	</div>
</body>
</html>