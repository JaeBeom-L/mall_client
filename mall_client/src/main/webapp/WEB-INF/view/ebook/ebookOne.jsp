<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ebookOne</title>
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

	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 -->
	
	<h1>ebookOne</h1>
	<table border="1">
		<tr>
			<td>ebookNo</td>
			<td>${ebook.ebookNo}</td>
		</tr>
		
		<tr>
			<td>ebookISBN</td>
			<td>${ebook.ebookISBN}</td>
		</tr>
		
		<tr>
			<td>categoryName</td>
			<td>${ebook.categoryName}</td>
		</tr>
		
		<tr>
			<td>ebookTitle</td>
			<td>${ebook.ebookTitle}</td>
		</tr>
		
		<tr>
			<td>ebookAuthor</td>
			<td>${ebook.ebookAuthor}</td>
		</tr>
		
		<tr>
			<td>ebookCompany</td>
			<td>${ebook.ebookCompany}</td>
		</tr>
		
		<tr>
			<td>ebookPageCount</td>
			<td>${ebook.ebookPageCount}</td>
		</tr>
		
		<tr>
			<td>ebookPrice</td>
			<td>${ebook.ebookPrice}</td>
		</tr>
		
		<tr>
			<td>ebookImg</td>
			<td><img src="${pageContext.request.contextPath}/img/${ebook.ebookImg}"></td>
		</tr> 
		
		<tr>
			<td>ebookSummary</td>
			<td>${ebook.ebookSummary}</td>
		</tr>
		
		<tr>
			<td>ebookDate</td>
			<td>${ebook.ebookDate}</td>
		</tr>
		
		<tr>
			<td>ebookState</td>
			<td>${ebook.ebookState}</td>
		</tr>
	</table>
	
	<!-- InsertCartController?ebookNo - CartDao.insertCart()- redirect:CartListController -->
	
	
	<c:if test="${(loginClient == null) || !(ebook.ebookState == '판매중')}">
		<a href="${pageContext.request.contextPath}/InsertCartController?ebookNo=${ebook.ebookNo}">
			<button type="button" disabled="disabled">장바구니추가</button>
		</a>
	</c:if>	
	
	<c:if test="${(loginClient != null) && ebook.ebookState == '판매중'}">
		<a href="${pageContext.request.contextPath}/InsertCartController?ebookNo=${ebook.ebookNo}">
			<button type="button">장바구니추가</button>
		</a>
	</c:if>
		
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