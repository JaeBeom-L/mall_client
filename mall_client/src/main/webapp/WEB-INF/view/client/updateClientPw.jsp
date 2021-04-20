<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateClientPw</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 -->
	
	<h1>패스워드 변경</h1>
	<form method="post" action="${pageContext.request.contextPath}/UpdateClientPasswordController">
		<table border="1">
	
			<tr>
				<td>clientMail</td>
				<td>${loginClient.clientMail}</td>
			</tr>
			
			<tr>
				<td>clientPw</td>
				<td><input type="password" name="clientPw"></td>
			</tr>
		
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>