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
                      <!-- 
							지난 시험(table : test) 리스트+점수 - 점수확인버튼 - 제출답안지확인(table : paper)
							오늘날짜 시험 리스트 응시버튼 - 시험지출력(table : question x example) - 답안지 제출(table : paper)
						 -->
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/test/testList">시험응시</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/employee/teacher/teacherList">선생님관리</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/paper/paperList?studentNo=${loginStudent.studentNo}">답안 확인</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/student/modifyStudentPw">비밀번호 수정</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="${pageContext.request.contextPath}/student/logout">로그아웃</a>
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
    </section>
    <!-- ========================= hero-section-wrapper-6 end ========================= -->