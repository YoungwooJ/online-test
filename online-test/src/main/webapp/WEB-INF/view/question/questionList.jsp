<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionList.jsp</title>
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
	
	<h1>시험 문제</h1>
	<form method="post" action="${pageContext.request.contextPath}/paper/addPaper">
		<c:if test="${loginTeacher ne null}">
		<a href="${pageContext.request.contextPath}/question/addQuestion?testNo=${testNo}">문제 추가</a>
		</c:if>
		<table border="1">
			<c:forEach var="q" items="${qList}">
					<tr>
						<th>
							${q.questionIdx}. ${q.questionTitle}
							<input type="hidden" name="questionNo" value="${q.questionNo}">
							<input type="hidden" name="studentNo" value="${studentNo}">
						</th>
						<c:if test="${loginTeacher ne null}">
						<td>
							<a href="${pageContext.request.contextPath}/question/modifyQuestion?questionNo=${q.questionNo}&testNo=${testNo}">
								수정
							</a>
							<a href="${pageContext.request.contextPath}/question/removeQuestion?questionNo=${q.questionNo}&testNo=${testNo}">
								삭제
							</a>
						</td>
						</c:if>
					</tr>
				<c:forEach var="l" items="${exList}">
					<c:forEach var="e" items="${l}">
						<c:if test="${e.questionNo eq q.questionNo}">	
							<tr>
								<td>
									${e.exampleIdx}. ${e.exampleTitle}
									<c:if test="${studentNo ne null}">
									<input type="checkbox" name="answer" value="${e.exampleIdx}">
									</c:if>
								</td>
								<c:if test="${loginTeacher ne null}">
								<td>
									<a href="${pageContext.request.contextPath}/example/modifyExample?exampleNo=${e.exampleNo}&testNo=${testNo}">
										수정
									</a>
									<a href="${pageContext.request.contextPath}/example/removeExample?exampleNo=${e.exampleNo}&testNo=${testNo}">
										삭제
									</a>
								</td>
								</c:if>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
					<c:if test="${loginTeacher ne null}">
					<tr>
						<td colspan="2">
							<a href="${pageContext.request.contextPath}/example/addExample?questionNo=${q.questionNo}&testNo=${testNo}">
								보기 추가
							</a>
						</td>
					</tr>
					</c:if>
			</c:forEach>
		</table>
		<c:if test="${studentNo ne null}">
		<button type="submit">제출</button>
		</c:if>
	</form>
	
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