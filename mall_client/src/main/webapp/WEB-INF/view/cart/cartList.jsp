<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cartList</title>
	<meta charset="utf-8">
   	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Ion Icon Fonts-->
	<link rel="stylesheet" href="css/ionicons.min.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.min.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	
	<!-- Date Picker -->
	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">
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
	
	<footer id="colorlib-footer" role="contentinfo">	
		<div class="copy">
			<div class="row">
				<div class="col-sm-12 text-center">
					<p>
						<span>Copyright JaeBoem-L all rights reserved.</span>
					</p>
				</div>
			</div>
		</div>
	</footer>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
   <!-- popper -->
   <script src="js/popper.min.js"></script>
   <!-- bootstrap 4.1 -->
   <script src="js/bootstrap.min.js"></script>
   <!-- jQuery easing -->
   <script src="js/jquery.easing.1.3.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="js/jquery.flexslider-min.js"></script>
	<!-- Owl carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/magnific-popup-options.js"></script>
	<!-- Date Picker -->
	<script src="js/bootstrap-datepicker.js"></script>
	<!-- Stellar Parallax -->
	<script src="js/jquery.stellar.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>

</body>
</html>