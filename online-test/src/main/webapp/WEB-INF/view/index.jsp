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
	<!-- menu include -->
	<c:import url="/WEB-INF/view/menu.jsp"></c:import>
	
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
	
	
	<!-- <canvas id="myChart" style="width:100%;max-width:800px"></canvas> -->
	
	<!-- ?????? ???????????? ???????????? ?????? -->
	<!-- 
	<script>
		// ?????? ????????? ????????? ?????? ?????? ????????? ???????????? ?????? -> ????????? ???????????? ??????
		// async?????? false??? ??????,  ?????? https://api.jquery.com/jquery.ajax
		let xModel = []; // ?????????
		let yModel = []; // ?????????
		let barColorsModel = ['#FF0000', '#00FF00', '#0000FF']; // ????????? ???????????? ?????? ????????? ??????(?????????)
		$.ajax({
			async : false // ????????????
			, url : '/online-test/monthData'
			, type : 'get'
			, success : function(model) { // model : /restapi/monthData ??????????????? ????????? ?????? -> ????????? ??????
				for(let attr in model) { // attr?????? ???(??????)??? {1:500, 2:400, ...}
					xModel.push(attr);
					yModel.push(model[attr]);
				}
			}
		});
	</script>
	 -->
	<!-- ????????? ????????? ?????? -->
	<!-- 
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
		let dataModel2 = []; // ???????????? ?????? ????????? ??????
		$.ajax({
			async : false // ????????????
			, url : '/online-test/scoreData'
			, type : 'get'
			, success : function(model) { // model : /restapi/monthData ??????????????? ????????? ?????? -> ????????? ??????
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
				// dataModel = [[????????? 1~12 ????????????],[],[]],
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
	 -->
</body>
</html>