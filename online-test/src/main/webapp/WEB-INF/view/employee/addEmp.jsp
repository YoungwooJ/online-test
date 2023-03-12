<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>addEmp.jsp</title>
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
	<!-- empMenu include -->
	<div>
		<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
	</div>
	
	<!-- ========================= about style-4 start ========================= -->
    <section id="about" class="about-section about-style-4">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-xl-5 col-lg-6">
            <div class="about-content-wrapper">
              <div class="section-title mb-30">
                <h3 class="mb-25 wow fadeInUp" data-wow-delay=".2s">직원 추가</h3>
                <div style="color:red;">${errorMsg}</div>
                <p class="wow fadeInUp" data-wow-delay=".3s">
				    <div>
				    	아이디 : 
						<input type="text" id="id">
						<button type="button" id="ckBtn">중복검사</button>
					</div>
				</p>
              </div>
              <form method="post" action="${pageContext.request.contextPath}/employee/addEmp">
              <ul>
                <li class="wow fadeInUp" data-wow-delay=".35s">
                  <i class="lni lni-checkmark-circle"></i>
                 	<table class="table table-bordered">
						<tr>
							<td>직원 아이디</td>
							<td><input type="text" id="empId" name="empId" readonly="readonly"></td>
						</tr>
						<tr>
							<td>직원 비밀번호</td>
							<td><input type="password" id="empPw" name="empPw"></td>
						</tr>
						<tr>
							<td>직원 이름</td>
							<td><input type="text" id="empName" name="empName"></td>
						</tr>	
					</table>                
                </li>          
              </ul>
              <button  id="addBtn" class="button button-lg radius-10 wow fadeInUp" data-wow-delay=".5s" type="submit">추가</button>
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
<script>
	$('#ckBtn').click(function(){
		$.ajax({
			url:'/online-test/employeeIdck'
			, type:'get'
			, data : {empId:$('#id').val()}
			, success:function(model){ // model : 'YES' / 'NO'
				if(model=='YES'){
					// 사용가능한 아이디
					$('#empId').val($('#id').val());
				} else {
					// 사용중인 아이디
					alert($('#id').val()+'는 사용중인 아이디입니다');
				}
			}
		});
	});
	
	$('#addBtn').click(function(){
		// 폼 유효성 검사
		// 폼 액션 전송
	});
</script>
</html>