<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addTeacher.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<h1>선생님 추가</h1>
	<div style="color:red;">${errorMsg}</div>
	
	<div>
		<input type="text" id="id">
		<button type="button" id="ckBtn">중복검사</button>
	</div>
	
	<form method="post" action="${pageContext.request.contextPath}/employee/teacher/addTeacher">
		<table border="1">
			<tr>
				<td>선생님 아이디</td>
				<td><input type="text" id="teacherId" name="teacherId" readonly="readonly"></td>
			</tr>
			<tr>
				<td>선생님 비밀번호</td>
				<td><input type="password" id="teacherPw" name="teacherPw"></td>
			</tr>
			<tr>
				<td>선생님 이름</td>
				<td><input type="text" id="teacherName" name="teacherName"></td>
			</tr>	
		</table>
		<button type="submit" id="addBtn">선생님 추가</button>
	</form>
</body>
<script>
	$('#ckBtn').click(function(){
		$.ajax({
			url:'/online-test/teacherIdck'
			, type:'get'
			, data : {teacherId:$('#id').val()}
			, success:function(model){ // model : 'YES' / 'NO'
				if(model=='YES'){
					// 사용가능한 아이디
					$('#teacherId').val($('#id').val());
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