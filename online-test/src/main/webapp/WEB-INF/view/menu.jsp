<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- ========================= preloader start ========================= -->
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
    </div>
    <!-- ========================= preloader end ========================= -->

    <!-- ========================= hero-section-wrapper-5 start ========================= -->
    <section id="home" class="hero-section-wrapper-5">

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
                        <a class="page-scroll" href="${pageContext.request.contextPath}/index">홈</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/loginEmp">직원 로그인</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/loginTeacher">선생님 로그인</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/loginStudent">학생 로그인</a>
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

      <!-- ========================= hero-5 start ========================= -->
      <div class="hero-section hero-style-5 img-bg" style="background-image: url('${pageContext.request.contextPath}/assets/img/hero/hero-5/hero-bg.svg')">
        <div class="container">
          <div class="row">
            <div class="col-lg-6">
              <div class="hero-content-wrapper">
                <h2 class="mb-30 wow fadeInUp" data-wow-delay=".2s">환영합니다!</h2>
                <p class="mb-30 wow fadeInUp" data-wow-delay=".4s">LMS 온라인 시험을 통해 다양한 시험에 응시하고 실력을 향상시키세요.</p>
                <!-- Button to Open the Modal -->
                <button class="button button-lg radius-50 wow fadeInUp" data-wow-delay=".6s" data-bs-toggle="modal" data-bs-target="#login_box">시작하기 <i class="lni lni-chevron-right"></i> </button>
              	
              	<!-- Modal -->
              	<div class="modal fade" id="login_box" tabindex="-1" role="dialog" aria-labelledby="login_boxLabel" aria-hidden="true">
              		<div class="modal-dialog modal-lg" style="display:inline-block; text-align:left; vertical-align:middle; width:1000px; height:700px;" role="document">
              			<div class="modal-content">
              				<div class="modal-header">
              					<button type="button" class="close" data-dismiss="modal" aria-label="close"><span aria-hidden="true">&times;</span></button>
              					<h4 class="modal-title" id="login_boxLabel">Modal title</h4>
              				</div>
              				<div class="modal-body">
              					<div>모달 창입니다.</div>
              					<button type="button" class="btn btn-default" data-bs-dismiss="modal">닫기</button>
              				</div>
              				<div class="modal-footer">
								<button type="button" class="btn btn-default" data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
              			</div>
              		</div>
              	</div>
              	
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