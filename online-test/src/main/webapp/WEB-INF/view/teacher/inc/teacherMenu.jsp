<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<!-- 
		시험회차(table : test) 관리(시험회차 CRUD)
		개별시험회차 클릭하면 그 회차의 문제 리스트 출력(문제 CRUD)
		개별문제 클릭하면 그 문제의 보기 리스트 출력(보기 CRUD)
	 -->
	<a href="${pageContext.request.contextPath}/test/testList">시험관리</a>
	
	<a href="${pageContext.request.contextPath}/paper/paperList">답안관리</a>
	
	<a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">비밀번호수정</a>
	
	<a href="${pageContext.request.contextPath}/teacher/logout">로그아웃</a>
</div>