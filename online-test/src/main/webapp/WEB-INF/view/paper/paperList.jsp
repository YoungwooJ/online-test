<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>paperList.jsp</title>
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
	
    <!-- ========================= about style-4 start ========================= -->
    <section id="about" class="about-section about-style-4">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-xl-5 col-lg-6">
            <div class="about-content-wrapper">
              <div class="section-title mb-30">
                <h3 class="mb-25 wow fadeInUp" data-wow-delay=".2s">?????? ?????? ?????? ??????</h3>
                <div style="color:red;">${errorMsg}</div>
                <p class="wow fadeInUp" data-wow-delay=".3s">?????? ????????? ??????????????????.</p>
              </div>
              <form method="post" action="${pageContext.request.contextPath}/test/modifyTest">
              <ul>
                <li class="wow fadeInUp" data-wow-delay=".35s">
                  <i class="lni lni-checkmark-circle"></i>
                 	<table class="table table-bordered">
						<c:forEach var="m" items="${list}">
							<tr>
								<th>?????????</th>
								<th>?????????</th>
								<th>?????????</th>
								<th>??????</th>
								<th>??????</th>
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
								<td>${m.score}???</td>
								<td>${m.grade}</td>
							</tr>
						</c:forEach>
					</table> 
                </li>          
              </ul>
              <!-- ????????? -->
			  <div style="text-align:center;">
				  <a href="${pageContext.request.contextPath}/paper/paperList?currentPage=${startPage}">??????</a>
				  <c:if test="${currentPage > 10}">
					  <a href="${pageContext.request.contextPath}/paper/paperList?currentPage=${currentPage-1}">??????</a>
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
				  <a href="${pageContext.request.contextPath}/paper/paperList?currentPage=${currentPage+1}">??????</a>
				  </c:if>
				  <a href="${pageContext.request.contextPath}/paper/paperList?currentPage=${endPage}">?????????</a>
			  </div>
              </form>
            </div>
          </div>
          <div class="col-xl-7 col-lg-6">
            <div class="about-image text-lg-right wow fadeInUp" data-wow-delay=".5s">
              <img src="${pageContext.request.contextPath}/assets/img/about/about-4/about-img.svg" alt="">
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ========================= about style-4 end ========================= -->

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