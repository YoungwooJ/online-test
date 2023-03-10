<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>loginStudent.jsp</title>
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

    <!-- ========================= hero-section-wrapper-5 start ========================= -->
    <section id="home" class="hero-section-wrapper-5">
	  <!-- ????????? ??? -->
      <c:if test="${loginStudent eq null}">
      <!-- ========================= header-6 start ========================= -->
      <header class="header header-6">
        <div class="navbar-area">
          <div class="container">
            <div class="row align-items-center">
              <div class="col-lg-12">
                <nav class="navbar navbar-expand-lg">
                  <a class="navbar-brand" href="${pageContext.request.contextPath}/index">
                    <img src="${pageContext.request.contextPath}/assets/img/logo/logo.png" alt="Logo" />
                  </a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent6" aria-controls="navbarSupportedContent6" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="toggler-icon"></span>
                    <span class="toggler-icon"></span>
                    <span class="toggler-icon"></span>
                  </button>
  
                  <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent6">
                    <ul id="nav6" class="navbar-nav ms-auto">
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/index">???</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/loginEmp">?????? ?????????</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/loginTeacher">????????? ?????????</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/loginStudent">?????? ?????????</a>
                      </li>
                    </ul>
                  </div>
                  
                  <div class="header-action d-flex">
                    <a href="#0"> <i class="lni lni-cart"></i> </a>
                    <a href="#0"> <i class="lni lni-alarm"></i> </a>
                  </div>
                  <!-- navbar collapse -->
                </nav>
                <!-- navbar -->
              </div>
            </div>
            <!-- row -->
          </div>
          <!-- container -->
        </div>
        <!-- navbar area -->
      </header>
      <!-- ========================= header-6 end ========================= -->
	  </c:if>
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
      <!-- ========================= hero-5 start ========================= -->
      <div class="hero-section hero-style-5 img-bg" style="background-image: url('${pageContext.request.contextPath}/assets/img/hero/hero-5/hero-bg.svg')">
        <div class="container">
          <div class="row">
            <div class="col-lg-6">
              <div class="hero-content-wrapper">
              	<!-- ????????? ??? -->
              	<c:if test="${loginStudent eq null}">
	                <h2 class="mb-30 wow fadeInUp" data-wow-delay=".2s">?????? ?????????</h2>
	                <p class="mb-30 wow fadeInUp" data-wow-delay=".4s">
	                <form method="post" action="${pageContext.request.contextPath}/loginStudent">
						<table class="table table-bordered">
							<tr>
								<td>?????? ?????????</td>
								<td><input type="text" name="studentId" value="s1"></td>
							</tr>
							<tr>
								<td>?????? ????????????</td>
								<td><input type="password" name="studentPw" value="1234"></td>
							</tr>
						</table>
	                </p>
	                <button type="submit" class="button button-lg radius-50 wow fadeInUp" data-wow-delay=".6s">?????????<i class="lni lni-chevron-right"></i> </button>
	                </form>
                </c:if>
                <!-- ????????? ?????? -->
                <c:if test="${loginStudent ne null}">
	                <h2 class="mb-30 wow fadeInUp" data-wow-delay=".2s">${loginStudent.studentName}??? ???????????????.</h2>
	                <p class="mb-30 wow fadeInUp" data-wow-delay=".4s">
						????????? ??????????????????.
	                </p>
	                <a href="${pageContext.request.contextPath}/student/modifyStudentPw" class="button button-lg radius-50 wow fadeInUp" data-wow-delay=".6s">???????????? ??????<i class="lni lni-chevron-right"></i> </a>
	                <a href="${pageContext.request.contextPath}/student/logout" class="button button-lg radius-50 wow fadeInUp" data-wow-delay=".6s">????????????<i class="lni lni-chevron-right"></i> </a>
                </c:if>
              </div>
            </div>
            <div class="col-lg-6 align-self-end">
              <div class="hero-image wow fadeInUp" data-wow-delay=".5s">
                <img src="${pageContext.request.contextPath}/assets/img/hero/hero-5/hero-img.svg" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- ========================= hero-5 end ========================= -->

    </section>
    <!-- ========================= hero-section-wrapper-6 end ========================= -->

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