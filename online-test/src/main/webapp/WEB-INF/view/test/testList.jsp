<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>testList.jsp</title>
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
	
    <!-- ========================= preloader start ========================= -->
    <!-- 
    <div class="preloader">
      <div class="loader">
        <div class="spinner">
          <div class="spinner-container">
            <div class="spinner-rotator">
              <div class="spinner-left">
                <div class="spinner-circle"></div>
              </div>
              <div class="spinner-right">
                <div class="spinner-circle"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
    <!-- ========================= preloader end ========================= -->


    <!-- ========================= feature style-5 start ========================= -->
    <section id="feature" class="feature-section feature-style-5">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xxl-5 col-xl-5 col-lg-7 col-md-8">
            <div class="section-title text-center mb-60">
              <h3 class="mb-15 wow fadeInUp" data-wow-delay=".2s">?????? ??????</h3>
              <p class="wow fadeInUp" data-wow-delay=".4s">????????? ???????????? ????????? ????????? ????????? ???????????????.<br>?????? ????????? ???????????????.<br>????????? ?????? ????????? ???????????????.</p>
            </div>
          </div>
        </div>
        <c:if test="${loginTeacher ne null}">
			<a href="${pageContext.request.contextPath}/test/addTest">????????????</a>
		</c:if>
		<!-- ?????? ?????? -->
		<form method="get" action="${pageContext.request.contextPath}/test/testList">
			<input type="text" placeholder="?????? ??????" name="searchWord" value="${searchWord}">
			<button type="submit">??????</button>
		</form>
		
        <div class="row">
          <c:forEach var="t" items="${list}">
          <div class="col-lg-4 col-md-6">
            <div class="single-feature wow fadeInUp" data-wow-delay=".2s">
              <div class="icon">
                <i class="lni lni-code-alt"></i>
                <svg width="110" height="72" viewBox="0 0 110 72" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M110 54.7589C110 85.0014 85.3757 66.2583 55 66.2583C24.6243 66.2583 0 85.0014 0 54.7589C0 24.5164 24.6243 0 55 0C85.3757 0 110 24.5164 110 54.7589Z" fill="#EBF4FF"/>
                  </svg> 
              </div>
              <div class="content">
              	<a href="${pageContext.request.contextPath}/question/questionList?testNo=${t.testNo}">
                	<h5>${t.testTitle} </h5>
                </a>
                <p>
                ${t.testTitle}??? ?????? ????????? ???????????????!<br>
                ?????? ?????? : ${t.testDate}<br>
                <c:if test="${loginTeacher ne null}">
	                <a href="${pageContext.request.contextPath}/test/modifyTest?testNo=${t.testNo}">
						??????
					</a>
					<a href="${pageContext.request.contextPath}/test/removeTest?testNo=${t.testNo}">
						??????
					</a>
				</c:if>
                </p>
              </div>
            </div>
          </div>
          </c:forEach>
          <!-- 
          <div class="col-lg-4 col-md-6">
            <div class="single-feature wow fadeInUp" data-wow-delay=".2s">
              <div class="icon">
                <i class="lni lni-vector"></i>
                <svg width="110" height="72" viewBox="0 0 110 72" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M110 54.7589C110 85.0014 85.3757 66.2583 55 66.2583C24.6243 66.2583 0 85.0014 0 54.7589C0 24.5164 24.6243 0 55 0C85.3757 0 110 24.5164 110 54.7589Z" fill="#EBF4FF"/>
                  </svg>                  
              </div>
              <div class="content">
                <h5>Graphics Design</h5>
                <p>Short description for the ones who look for something new.</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="single-feature wow fadeInUp" data-wow-delay=".4s">
              <div class="icon">
                <i class="lni lni-pallet"></i>
                <svg width="110" height="72" viewBox="0 0 110 72" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M110 54.7589C110 85.0014 85.3757 66.2583 55 66.2583C24.6243 66.2583 0 85.0014 0 54.7589C0 24.5164 24.6243 0 55 0C85.3757 0 110 24.5164 110 54.7589Z" fill="#EBF4FF"/>
                  </svg> 
              </div>
              <div class="content">
                <h5>Print Design</h5>
                <p>Short description for the ones who look for something new.</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="single-feature wow fadeInUp" data-wow-delay=".6s">
              <div class="icon">
                <i class="lni lni-stats-up"></i>
                <svg width="110" height="72" viewBox="0 0 110 72" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M110 54.7589C110 85.0014 85.3757 66.2583 55 66.2583C24.6243 66.2583 0 85.0014 0 54.7589C0 24.5164 24.6243 0 55 0C85.3757 0 110 24.5164 110 54.7589Z" fill="#EBF4FF"/>
                  </svg> 
              </div>
              <div class="content">
                <h5>Business Analysis</h5>
                <p>Short description for the ones who look for something new.</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="single-feature wow fadeInUp" data-wow-delay=".4s">
              <div class="icon">
                <i class="lni lni-lock"></i>
                <svg width="110" height="72" viewBox="0 0 110 72" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M110 54.7589C110 85.0014 85.3757 66.2583 55 66.2583C24.6243 66.2583 0 85.0014 0 54.7589C0 24.5164 24.6243 0 55 0C85.3757 0 110 24.5164 110 54.7589Z" fill="#EBF4FF"/>
                  </svg> 
              </div>
              <div class="content">
                <h5>Best Security</h5>
                <p>Short description for the ones who look for something new.</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="single-feature wow fadeInUp" data-wow-delay=".6s">
              <div class="icon">
                <i class="lni lni-code"></i>
                <svg width="110" height="72" viewBox="0 0 110 72" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M110 54.7589C110 85.0014 85.3757 66.2583 55 66.2583C24.6243 66.2583 0 85.0014 0 54.7589C0 24.5164 24.6243 0 55 0C85.3757 0 110 24.5164 110 54.7589Z" fill="#EBF4FF"/>
                  </svg> 
              </div>
              <div class="content">
                <h5>Web Design</h5>
                <p>Short description for the ones who look for something new.</p>
              </div>
            </div>
          </div>
        </div>
		 -->
      </div>
    </section>
    
    <!-- ????????? -->
	<div style="text-align:center;">
		<a href="${pageContext.request.contextPath}/test/testList?currentPage=${startPage}&searchWord=${searchWord}">??????</a>
		<c:if test="${currentPage > 10}">
			<a href="${pageContext.request.contextPath}/test/testList?currentPage=${currentPage-1}&searchWord=${searchWord}">??????</a>
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
		<a href="${pageContext.request.contextPath}/test/testList?currentPage=${currentPage+1}&searchWord=${searchWord}">??????</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/test/testList?currentPage=${endPage}&searchWord=${searchWord}">?????????</a>
	</div>
    <!-- ========================= feature style-5 end ========================= -->
	
	<!-- footer include -->
	<c:import url="/WEB-INF/view/footer.jsp"></c:import>
		
    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-5.0.0-beta1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>