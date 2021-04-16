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
	// session 검사 session값이 없다면 인덱스페이지로
	if(session.getAttribute("loginClient") == null) {
		response.sendRedirect(request.getContextPath()+"/IndexController");
		return;
	}
%>
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- cartList -->
	<table border="1">
			<tr>
				<th>cart_no</th>
				<th>ebook_no</th>
				<th>ebook_title</th>
				<th>cart_date</th>
				<th>삭제</th>
				<th>주문</th>
			</tr>
		
		<%
			List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("list");
			for(Map<String, Object> map : list){
		%>
				<tr>
					<td><%=map.get("cartNo")%></td>
					<td><%=map.get("ebookNo") %></td>
					<td><%=map.get("ebookTitle") %></td>
					<td><%=map.get("cartDate") %></td>
					<!-- DeleteCartController - CartDao.deleteCart() - redirect CartListController -->
					<td><a href="<%=request.getContextPath()%>/DeleteCartController?cartNo=<%=map.get("cartNo")%>">삭제</a></td>
					<!-- InsertOrdersController - insertOrders(),deleteCart():issue(트랙잭션 필요)- redirect OrdersListController -->
					<td><a href="<%=request.getContextPath()%>/InsertOrdersController?ebookNo=<%=map.get("ebookNo")%>&cartNo=<%=map.get("cartNo")%>">주문</a></td>
				</tr>
		<%	
			}
		%>		
	</table>

</body>
</html>