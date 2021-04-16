<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<Map<String, Object>> ordersList = (List<Map<String, Object>>)request.getAttribute("ordersList");
%>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 -->
	<h1>주문리스트</h1>
	<table border="1">
		<tr>
			<td>ordersNo</td>
			<td>ebookNo</td>
			<td>ordersDate</td>
			<td>ordersState</td>
			<td>ebookTitle</td>
			<td>ebookPrice</td>
		</tr>
		<%
			for(Map m : ordersList){
		%>
				<tr>
					<td><%=(Integer)(m.get("ordersNo")) %></td>
					<td><%=(Integer)(m.get("ebookNo")) %></td>
					<td><%=(String)(m.get("ordersDate")) %></td>
					<td><%=(String)(m.get("ordersState")) %></td>
					<td><%=(String)(m.get("ebookTitle")) %></td>
					<td><%=(Integer)(m.get("ebookPrice")) %></td>
				</tr>
				
		<%
			}
		%>
	</table>
</body>
</html>