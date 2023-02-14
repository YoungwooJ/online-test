<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>index.jsp</title>
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
	<a href="${pageContext.request.contextPath}/employee/loginEmployee">직원 로그인</a>

	<a href="${pageContext.request.contextPath}/teacher/loginTeacher">선생님 로그인</a>
	
	<a href="${pageContext.request.contextPath}/student/loginStudent">학생 로그인</a>
	
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
                  <a class="navbar-brand" href="${pageContext.request.contextPath}/index.html">
                    <img src="${pageContext.request.contextPath}/assets/img/logo/logo.svg" alt="Logo" />
                  </a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent6" aria-controls="navbarSupportedContent6" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="toggler-icon"></span>
                    <span class="toggler-icon"></span>
                    <span class="toggler-icon"></span>
                  </button>
  
                  <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent6">
                    <ul id="nav6" class="navbar-nav ms-auto">
                      <li class="nav-item">
                        <a class="page-scroll active" href="#home">Home</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="#feature">Feature</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="#about">About</a>
                      </li>

                      <li class="nav-item">
                        <a class="page-scroll" href="#pricing">Pricing</a>
                      </li>
                      <li class="nav-item">
                        <a class="page-scroll" href="#contact">Contact</a>
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
                <h2 class="mb-30 wow fadeInUp" data-wow-delay=".2s">You're Using Free Lite Version</h2>
                <p class="mb-30 wow fadeInUp" data-wow-delay=".4s">Please purchase full version of the template to get all sections and permission to use with commercial projects.</p>
                <a href="#0" class="button button-lg radius-50 wow fadeInUp" data-wow-delay=".6s">Get Started <i class="lni lni-chevron-right"></i> </a>
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

    <!-- ========================= feature style-5 start ========================= -->
    <section id="feature" class="feature-section feature-style-5">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xxl-5 col-xl-5 col-lg-7 col-md-8">
            <div class="section-title text-center mb-60">
              <h3 class="mb-15 wow fadeInUp" data-wow-delay=".2s">Specializing In</h3>
              <p class="wow fadeInUp" data-wow-delay=".4s">Stop wasting time and money designing and managing a website that doesn’t get results. Happiness guaranteed!</p>
            </div>
          </div>
        </div>

        <div class="row">
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
            <div class="single-feature wow fadeInUp" data-wow-delay=".2s">
              <div class="icon">
                <i class="lni lni-code-alt"></i>
                <svg width="110" height="72" viewBox="0 0 110 72" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M110 54.7589C110 85.0014 85.3757 66.2583 55 66.2583C24.6243 66.2583 0 85.0014 0 54.7589C0 24.5164 24.6243 0 55 0C85.3757 0 110 24.5164 110 54.7589Z" fill="#EBF4FF"/>
                  </svg> 
              </div>
              <div class="content">
                <h5>Web Development</h5>
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

      </div>
    </section>
    <!-- ========================= feature style-5 end ========================= -->

    <!-- ========================= about style-4 start ========================= -->
    <section id="about" class="about-section about-style-4">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-xl-5 col-lg-6">
            <div class="about-content-wrapper">
              <div class="section-title mb-30">
                <h3 class="mb-25 wow fadeInUp" data-wow-delay=".2s">The future of designing starts here</h3>
                <p class="wow fadeInUp" data-wow-delay=".3s">Stop wasting time and money designing and managing a website that doesn’t get results. Happiness guaranteed,</p>
              </div>
              <ul>
                <li class="wow fadeInUp" data-wow-delay=".35s">
                  <i class="lni lni-checkmark-circle"></i>
                  Stop wasting time and money designing and managing a website that doesn’t get results.
                </li>
                <li class="wow fadeInUp" data-wow-delay=".4s">
                  <i class="lni lni-checkmark-circle"></i>
                  Stop wasting time and money designing and managing.
                </li>
                <li class="wow fadeInUp" data-wow-delay=".45s">
                  <i class="lni lni-checkmark-circle"></i>
                  Stop wasting time and money designing and managing a website that doesn’t get results.
                </li>
              </ul>
              <a href="#0" class="button button-lg radius-10 wow fadeInUp" data-wow-delay=".5s">Learn More</a>
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

    <!-- ========================= pricing style-4 start ========================= -->
    <section id="pricing" class="pricing-section pricing-style-4 bg-light">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-xl-5 col-lg-6">
            <div class="section-title mb-60">
              <h3 class="mb-15 wow fadeInUp" data-wow-delay=".2s">Pricing Plan</h3>
              <p class="wow fadeInUp" data-wow-delay=".4s">Stop wasting time and money designing and managing a website that doesn’t get results. Happiness guaranteed!Stop wasting time and money designing and managing a website that doesn’t get results. Happiness guaranteed!</p>
            </div>
          </div>
          <div class="col-xl-7 col-lg-6">
            <div class="pricing-active-wrapper wow fadeInUp" data-wow-delay=".4s">
              <div class="pricing-active">
                <div class="single-pricing-wrapper">
                  <div class="single-pricing">
                    <h6>Basic Design</h6>
                    <h4>Web Design</h4>
                    <h3>$ 29.00</h3>
                    <ul>
                      <li>Carefully crafted components</li>
                      <li>Amazing page examples</li>
                      <li>Super friendly support team</li>
                      <li>Awesome Support</li>
                    </ul>
                    <a href="#0" class="button radius-30">Get Started</a>
                  </div>
                </div>
                <div class="single-pricing-wrapper">
                  <div class="single-pricing">
                    <h6>Standard Design</h6>
                    <h4>Web Development</h4>
                    <h3>$ 89.00</h3>
                    <ul>
                      <li>Carefully crafted components</li>
                      <li>Amazing page examples</li>
                      <li>Super friendly support team</li>
                      <li>Awesome Support</li>
                    </ul>
                    <a href="#0" class="button radius-30">Get Started</a>
                  </div>
                </div>
                <div class="single-pricing-wrapper">
                  <div class="single-pricing">
                    <h6>Pro Design</h6>
                    <h4>Design & Develop</h4>
                    <h3>$ 199.00</h3>
                    <ul>
                      <li>Carefully crafted components</li>
                      <li>Amazing page examples</li>
                      <li>Super friendly support team</li>
                      <li>Awesome Support</li>
                    </ul>
                    <a href="#0" class="button radius-30">Get Started</a>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ========================= pricing style-4 end ========================= -->

    <!-- ========================= footer style-4 start ========================= -->
    <footer class="footer footer-style-4">
      <div class="container">
        <div class="widget-wrapper">
          <div class="row">
            <div class="col-xl-3 col-lg-4 col-md-6">
              <div class="footer-widget wow fadeInUp" data-wow-delay=".2s">
                <div class="logo">
                  <a href="#0"> <img src="${pageContext.request.contextPath}/assets/img/logo/logo.svg" alt=""> </a>
                </div>
                <p class="desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Facilisis nulla placerat amet amet congue.</p>
                <ul class="socials">
                  <li> <a href="#0"> <i class="lni lni-facebook-filled"></i> </a> </li>
                  <li> <a href="#0"> <i class="lni lni-twitter-filled"></i> </a> </li>
                  <li> <a href="#0"> <i class="lni lni-instagram-filled"></i> </a> </li>
                  <li> <a href="#0"> <i class="lni lni-linkedin-original"></i> </a> </li>
                </ul>
              </div>
            </div>
            <div class="col-xl-2 offset-xl-1 col-lg-2 col-md-6 col-sm-6">
              <div class="footer-widget wow fadeInUp" data-wow-delay=".3s">
                <h6>Quick Link</h6>
                <ul class="links">
                  <li> <a href="#0">Home</a> </li>
                  <li> <a href="#0">About</a> </li>
                  <li> <a href="#0">Service</a> </li>
                  <li> <a href="#0">Testimonial</a> </li>
                  <li> <a href="#0">Contact</a> </li>
                </ul>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
              <div class="footer-widget wow fadeInUp" data-wow-delay=".4s">
                <h6>Services</h6>
                <ul class="links">
                  <li> <a href="#0">Web Design</a> </li>
                  <li> <a href="#0">Web Development</a> </li>
                  <li> <a href="#0">Seo Optimization</a> </li>
                  <li> <a href="#0">Blog Writing</a> </li>
                </ul>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6">
              <div class="footer-widget wow fadeInUp" data-wow-delay=".5s">
                <h6>Download App</h6>
                <ul class="download-app">
                  <li>
                    <a href="#0">
                      <span class="icon"><i class="lni lni-apple"></i></span>
                      <span class="text">Download on the <b>App Store</b> </span>
                    </a>
                  </li>
                  <li>
                    <a href="#0">
                      <span class="icon"><i class="lni lni-play-store"></i></span>
                      <span class="text">GET IT ON <b>Play Store</b> </span>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="copyright-wrapper wow fadeInUp" data-wow-delay=".2s">
          <p>Design and Developed by <a href="https://uideck.com" rel="nofollow" target="_blank">UIdeck</a> Built-with <a href="https://uideck.com" rel="nofollow" target="_blank">Lindy UI Kit</a></p>
        </div>
      </div>
    </footer>
    <!-- ========================= footer style-4 end ========================= -->

    <!-- ========================= scroll-top start ========================= -->
    <a href="#" class="scroll-top"> <i class="lni lni-chevron-up"></i> </a>
    <!-- ========================= scroll-top end ========================= -->
		

    <!-- ========================= JS here ========================= -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-5.0.0-beta1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/tiny-slider.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	
	<canvas id="myChart" style="width:100%;max-width:800px"></canvas>
	
	<!-- 차트 모델값을 가져오는 코드 -->
	<script>
		// 모델 데이터 가져온 후에 아래 차트가 그려져야 한다 -> 동기로 처리해야 한다
		// async값을 false로 변경,  참고 https://api.jquery.com/jquery.ajax
		let xModel = []; // 키배열
		let yModel = []; // 값배열
		let barColorsModel = ['#FF0000', '#00FF00', '#0000FF']; // 색상이 지정되지 않은 배열은 회색(디폴트)
		$.ajax({
			async : false // 동기처리
			, url : '/online-test/monthData'
			, type : 'get'
			, success : function(model) { // model : /restapi/monthData 백앤드에서 객체로 반환 -> 변환이 필요
				for(let attr in model) { // attr에는 키(속성)값 {1:500, 2:400, ...}
					xModel.push(attr);
					yModel.push(model[attr]);
				}
			}
		});
	</script>
	
	<!-- 차트를 그리는 코드 -->
	<script>
		var xValues = xModel;
		var yValues = yModel;
		var barColors = barColorsModel;
		
		new Chart("myChart", {
		  type: "bar",
		  data: {
		    labels: xValues,
		    datasets: [{
		      backgroundColor: barColors,
		      data: yValues
		    }]
		  },
		  options: {
		    legend: {display: false},
		    title: {
		      display: true,
		      text: "World Wine Production 2018"
		    }
		  }
		});
	</script>
	
	<canvas id="myChart2" style="width:100%;max-width:600px"></canvas>
	
	<script>
		let xModel2 = [];
		let dataModel2 = []; // 배열안에 다시 배열을 할당
		$.ajax({
			async : false // 동기처리
			, url : '/online-test/scoreData'
			, type : 'get'
			, success : function(model) { // model : /restapi/monthData 백앤드에서 객체로 반환 -> 변환이 필요
				// for(let i=0; i<model.lenght; i++) {}
				// model.forEach(function(item, index) {})
				// $.each(model, function(index, item){})
				
				for(let attr in model[0]) {
					xModel2.push(attr);
				}
				
				model.forEach(function(item) {
					let arr = [];
					for(let attr in item) {
						arr.push(item[attr]);
					}
					dataModel2.push(arr);
				});
				// dataModel = [[첫번째 1~12 성적배열],[],[]],
			}
		});
	</script>
	
	<script>
		new Chart("myChart2", {
		  type: "line",
		  data: {
		    labels: xModel2,
		    datasets: [{ 
		      data: dataModel2[0],
		      borderColor: "red",
		      fill: false
		    }, { 
		      data: dataModel2[1],
		      borderColor: "green",
		      fill: false
		    }, { 
		      data: dataModel2[2],
		      borderColor: "blue",
		      fill: false
		    }]
		  },
		  options: {
		    legend: {display: false}
		  }
		});
	</script>
</body>
</html>