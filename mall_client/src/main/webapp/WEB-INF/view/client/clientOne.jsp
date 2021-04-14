<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "mall.client.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clientOne</title>
</head>
<body>
<%
	Client client = (Client)request.getAttribute("client"); // ClientOneController에서 받아온 client 번호, 이메일, 가입날짜가 들어 있다.
%>
	
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 -->
	
	<h1>고객정보</h1>
	<table border="1">
		<tr>
			<td>clientNo</td>
			<td><%=client.getClientNo() %></td>
		</tr>
		
		<tr>
			<td>clientMail</td>
			<td><%=client.getClientEmail() %></td>
		</tr>
		
		<tr>
			<td>clientDate</td>
			<td><%=client.getClientDate() %></td>
		</tr>
	</table>
	
	<a href="#">정보수정</a>
	<a href="#">회원탈퇴</a>
	
</body>
</html>