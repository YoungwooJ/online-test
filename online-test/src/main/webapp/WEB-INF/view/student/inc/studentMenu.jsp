<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<!-- 
		지난 시험(table : test) 리스트+점수 - 점수확인버튼 - 제출답안지확인(table : paper)
		오늘날짜 시험 리스트 응시버튼 - 시험지출력(table : question x example) - 답안지 제출(table : paper)
	 -->
	<a href="${pageContext.request.contextPath}/test/testList">시험 응시</a>
	 
	<a href="${pageContext.request.contextPath}/paper/paperList">답안 확인</a>
	
	<a href="${pageContext.request.contextPath}/student/modifyStudentPw">비밀번호 수정</a>
	
	<a href="${pageContext.request.contextPath}/student/logout">로그아웃</a>
	
</div>