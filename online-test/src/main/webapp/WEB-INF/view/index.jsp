<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/employee/loginEmployee">직원 로그인</a>

	<a href="${pageContext.request.contextPath}/teacher/loginTeacher">선생님 로그인</a>
	
	<a href="${pageContext.request.contextPath}/student/loginStudent">학생 로그인</a>
</body>
</html>