<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addEmp.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<h1>직원추가</h1>
	<div style="color:red;">${errorMsg}</div>
	
	<div>
		<input type="text" id="id">
		<button type="button" id="ckBtn">중복검사</button>
	</div>
	
	<form method="post" action="${pageContext.request.contextPath}/employee/addEmp">
		<table border="1">
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
		<button type="submit" id="addBtn">직원추가</button>
	</form>
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