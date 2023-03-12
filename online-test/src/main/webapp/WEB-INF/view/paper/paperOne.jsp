<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>paperOne.jsp</title>
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
	<br><br><br><br><br><br>
	<div class="container">
		<div class="col-lg-12">
			<div class="row">
				<div class='col-lg-12 col-mg-12'>
					<h2 class="text-center font-weight-bold">${testTitle} 제출 답안지</h2>
				</div>
			</div>
			<br>
			<div class="container">
				<div class='col-lg-12 col-mg-12'>
					<h4>응시자 : ${studentName}</h4>
					<h4>점수 : ${score}점 / 등급 : ${grade}</h4>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="container" style="column-count:2; gap: 100px; column-rule: 1px solid #ced4da;">	
		<c:forEach var="m" items="${list}">
			<br>
			<h5>문제 ${m.questionIdx}번. ${m.questionTitle}</h5>
			<c:forEach var="l" items="${exList}">
				<c:forEach var="e" items="${l}">
					<c:if test="${e.questionNo eq m.questionNo}">
						<c:choose>
							<c:when test="${e.exampleOx eq '정답'}">
								<div>
									<span style="color:red;">
										${e.exampleIdx}. ${e.exampleTitle}
										<c:if test="${m.answer eq '정답'}">
										&#11093;
										</c:if>
									</span>
								</div>
							</c:when>
							<c:when test="${m.submit eq e.exampleIdx}">
								<div>
									<span style="font-weight:bold;">${e.exampleIdx}. ${e.exampleTitle} &#10060;</span>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									${e.exampleIdx}. ${e.exampleTitle}
								</div>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
			</c:forEach>
		</c:forEach>		
	</div>
	<!-- 페이징 -->
	<div style="text-align:center;">
		<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${startPage}&studentNo=${studentNo}&testNo=${testNo}">처음</a>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${currentPage-1}&studentNo=${studentNo}&testNo=${testNo}">이전</a>
		</c:if>
		<c:choose>
			<c:when test="${endPage > 10}">
				<c:forEach begin="${blockStartNum}" end="${blockLastNum}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${status.current}&studentNo=${studentNo}&testNo=${testNo}">${status.current}</a>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach begin="${startPage}" end="${endPage}" step="1" varStatus="status">
					<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${status.current}&studentNo=${studentNo}&testNo=${testNo}">${status.current}</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${currentPage < endPage}">
		<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${currentPage+1}&studentNo=${studentNo}&testNo=${testNo}">다음</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/paper/paperOne?currentPage=${endPage}&studentNo=${studentNo}&testNo=${testNo}">마지막</a>
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