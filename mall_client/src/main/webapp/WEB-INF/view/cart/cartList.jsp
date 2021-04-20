<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
		
		<c:forEach var="m" items="${list}">
				<tr>
					<td>${m.cartNo}</td>
					<td>${m.ebookNo}</td>
					<td>${m.ebookTitle}</td>
					<td>${m.cartDate}</td>
					<!-- DeleteCartController - CartDao.deleteCart() - redirect CartListController -->
					<td><a href="${pageContext.request.contextPath}/DeleteCartController?cartNo=${m.cartNo}">삭제</a></td>
					<!-- InsertOrdersController - insertOrders(),deleteCart():issue(트랙잭션 필요)- redirect OrdersListController -->
					<td><a href="${pageContext.request.contextPath}/InsertOrdersController?ebookNo=${m.ebookNo}&cartNo=${m.cartNo}">주문</a></td>
				</tr>
		</c:forEach>

	</table>

</body>
</html>