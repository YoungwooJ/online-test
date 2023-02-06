<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>modifyExample</title>
	</head>
<body>
	<h1>보기 수정</h1>
	<form method="post" action="${pageContext.request.contextPath}/example/modifyExample">
		<table border="1">
			<tr>
				<td>보기 번호</td>
				<td>
					<input type="number" name="exampleIdx" value="${example.exampleIdx}" readonly="readonly">
					<input type="hidden" name="exampleNo" value="${example.exampleNo}">
					<input type="hidden" name="testNo" value="${testNo}">
				</td>
			</tr>
			<tr>
				<td>보기 제목</td>
				<td>
					<input type="text" name="exampleTitle" value="${example.exampleTitle}">
				</td>
			</tr>
			<tr>
				<td>보기 정답여부</td>
				<c:choose>
					<c:when test="${example.exampleOx eq '정답'}">
						<td>
							<input type="radio" name="exampleOx" value="정답" checked="checked">정답
							<input type="radio" name="exampleOx" value="오답">오답
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<input type="radio" name="exampleOx" value="정답">정답
							<input type="radio" name="exampleOx" value="오답" checked="checked">오답
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>