<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>questionList.jsp</title>
	<meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Place favicon.ico in the root directory -->

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-5.0.0-beta1.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/LineIcons.2.0.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/tiny-slider.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/lindy-uikit.css"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
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
	
	<div class="container" style="column-count:2; gap: 100px; column-rule: 1px solid #ced4da;">
		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class='col-lg-12 col-mg-12'>
						<h2 class="text-center font-weight-bold">시험 문제</h2>
					</div>
				</div>
			</div>
		</div>
	<form method="post" action="${pageContext.request.contextPath}/paper/addPaper">
		<c:if test="${loginTeacher ne null}">
			<div>
				<a href="${pageContext.request.contextPath}/question/addQuestion?testNo=${testNo}">문제 추가</a>
			</div>
		</c:if>
		<div></div>
		<c:forEach var="q" items="${qList}" varStatus="status">
			<div class="col-lg-12 col-mg-12">
			<h5>
				<span>${q.questionIdx}.</span>
				${q.questionTitle}
				<input type="hidden" name="questionNo" value="${q.questionNo}">
				<input type="hidden" name="studentNo" value="${studentNo}">
				<input type="hidden" name="testNo" value="${testNo}">
				<c:if test="${loginTeacher ne null}">
					<a href="${pageContext.request.contextPath}/question/modifyQuestion?questionNo=${q.questionNo}&testNo=${testNo}">
						수정
					</a>
					<a href="${pageContext.request.contextPath}/question/removeQuestion?questionNo=${q.questionNo}&testNo=${testNo}">
						삭제
					</a>
				</c:if>
			</h5>
			<c:forEach var="l" items="${exList}">
				<c:forEach var="e" items="${l}">
					<c:if test="${e.questionNo eq q.questionNo}">	
						<ul>
							<li>
								${e.exampleIdx}. ${e.exampleTitle}
								<c:if test="${studentNo ne null}">
								<input type="checkbox" name="answer" value="${e.exampleOx}">
								<input type="hidden" name="submit" value="${e.exampleIdx}">
								</c:if>
								<c:if test="${loginTeacher ne null}">
									<a href="${pageContext.request.contextPath}/example/modifyExample?exampleNo=${e.exampleNo}&testNo=${testNo}">
										수정
									</a>
									<a href="${pageContext.request.contextPath}/example/removeExample?exampleNo=${e.exampleNo}&testNo=${testNo}">
										삭제
									</a>
								</c:if>
							</li>
						</ul>
					</c:if>
				</c:forEach>
			</c:forEach>
			<c:if test="${loginTeacher ne null}">
				<div>
					<a href="${pageContext.request.contextPath}/example/addExample?questionNo=${q.questionNo}&testNo=${testNo}">
						보기 추가
					</a>
				</div>	
			</c:if>
			</div>
		</c:forEach>			
		<c:if test="${studentNo ne null}">
			<button type="submit">제출</button>
		</c:if>
	</form>
	</div>
	<!-- 페이징 -->
	<div style="text-align:center;">
		<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${startPage}&testNo=${testNo}">처음</a>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${currentPage-1}&testNo=${testNo}">이전</a>
		</c:if>
		<c:choose>
			<c:when test="${endPage > 10}">
				<c:forEach begin="${blockStartNum}" end="${blockLastNum}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${status.current}&testNo=${testNo}">${status.current}</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin="${startPage}" end="${endPage}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${status.current}&testNo=${testNo}">${status.current}</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${currentPage < endPage}">
		<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${currentPage+1}&testNo=${testNo}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/question/questionList?currentPage=${endPage}&testNo=${testNo}">마지막</a>
	</div>
	<!-- footer include -->
	<c:import url="/WEB-INF/view/footer.jsp"></c:import>
	
	<!-- ========================= scroll-top start ========================= -->
    <a href="#" class="scroll-top"> <i class="lni lni-chevron-up"></i> </a>
    <!-- ========================= scroll-top end ========================= -->
		

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-5.0.0-beta1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>