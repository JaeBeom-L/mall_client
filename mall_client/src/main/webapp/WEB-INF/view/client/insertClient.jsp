<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertClient</title>
</head>
<body>
	<ul>
		<li><a href="<%=request.getContextPath()%>/IndexController">홈으로</a>
	</ul>
	
	<h1>회원가입</h1>
	<form action="<%=request.getContextPath()%>/InsertClientController" method="post">
		<table border="1">
			<tr>
				<td>clientMail</td><!-- 고객 이메일 -->
				<td>
					<input type="text" name="clientMail">
				</td>
			</tr>
			
			<tr>
				<td>clientPw</td><!-- 고객 비밀번호 -->
				<td>
					<input type="password" name="clientPw">
				</td>
			</tr>			
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>