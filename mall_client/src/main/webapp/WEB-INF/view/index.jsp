<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>index</title>
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
	<div>
		<div>오늘 접속자 수 : ${statsCount}</div>
		<div>전체 접속자 수 : ${total}</div>
	</div>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 -->

	
	<!-- 베스트 셀러 -->
	<div>
		<div class="colorlib-product">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 offset-sm-2 text-center colorlib-heading">
						<h2>Best Sellers</h2>
					</div>
				</div>				
				<div class="row row-pb-md">
					<div class="col-lg-1 mb-4 text-center">
					</div>
					<c:forEach var="m" items="${bestOrdersList}">								
						<div class="col-lg-2 mb-4 text-center">
							<div class="product-entry border">
								<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}" class="prod-img">
									<img src="${pageContext.request.contextPath}/img/default.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
								</a>
								<div class="desc">
									<h2><a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">${m.ebookTitle}</a></h2>
								</div>								
							</div>
							<div>
								<span class="price">￦ ${m.ebookPrice}</span>
							</div>
						</div>								
					</c:forEach>
					<div class="col-lg-1 mb-4 text-center">
					</div>	
				</div>
			</div>
		</div>
	</div>
	<br>
	<!-- 카테고리 -->
	<div>
		<a href="${pageContext.request.contextPath}/IndexController">전체보기</a>
		<c:forEach var="cn" items="${categoryList}">
			<a href="${pageContext.request.contextPath}/IndexController?categoryName=${cn}">${cn}</a>
		</c:forEach>
	</div>
	<table border="1">
		<tr>			
			<c:set var="j" value="0"></c:set>
			<c:forEach var="ebook" items="${ebookList}">
				<c:set var="j" value="${j+1}"></c:set>
					<td>
						<div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
						<!-- EbookOneController -EbookDao.selectEbookOne() - ebookOne.jsp -->
						<div>
							<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${ebook.ebookNo}">
								${ebook.ebookTitle}
							</a>
						</div>
						<div>${ebook.ebookPrice}</div>
					</td>	
				<c:if test="${j%5 == 0 }">
					</tr><tr>
				</c:if>			
			</c:forEach>
				
		</tr>
	</table>

	<div><!--  검색창 -->
		<form action="${pageContext.request.contextPath}/IndexController" method="get">
			검색 : <input type="text" name="searchWord">
			<button type="submit">검색</button>
		</form>
	
	</div>
	<div><!-- 10단위 페이징-->
		<!--  총 페이지가 10페이지 이하일 때 -->
		<c:if test="${lasPage<=10}">
			<c:forEach var="i" begin="${1}" end="${lastPage}" step="1">
				<a href="${pageContext.request.contextPath}/IndexController?currentPage=${i}&categoryName=${categoryName}&searchWord=${searchWord}">${i}</a>
			</c:forEach>
		</c:if>
				
		<!-- 현재  보는 페이지가 10 이하이고 총 페이지는 10초과일 때 이전버튼을 없앤다 -->
		<c:if test="${currentPage <= 10 && lastPage>10}">
			<c:forEach var="i" begin="${1}" end="${10}" step="1">
				<a href="${pageContext.request.contextPath}/IndexController?currentPage=${i}&categoryName=${categoryName}&searchWord=${searchWord}">${i}</a>
			</c:forEach>
			<a href="${pageContext.request.contextPath}/IndexController?currentPage=${11}&categoryName=${categoryName}&searchWord=${searchWord}">다음</a>
		</c:if>
					
		<!-- 11페이지 이상이고  마지막 페이지 블럭 전 까지	 -->
		<c:if test="${currentPage >= 11 && currentPage<=(lastPageBlockNum)*10}">
			<a href="${pageContext.request.contextPath}/IndexController?currentPage=${(currentPageBlockNum-1)*10+1}&categoryName=${categoryName}&searchWord=${searchWord}">이전</a>
			<c:forEach var="i" begin="${(currentPageBlockNum)*10+1}" end="${(currentPageBlockNum)*10+10}" step="1">
				<a href="${pageContext.request.contextPath}/IndexController?currentPage=${i}&categoryName=${categoryName}&searchWord=${searchWord}">${i}</a>
			</c:forEach>
			<a href="${pageContext.request.contextPath}/IndexController?currentPage=${(currentPageBlockNum+1)*10+1}&categoryName=${categoryName}&searchWord=${searchWord}">다음</a>
		</c:if>

		<!-- 마지막 페이지 블럭이 있는곳-->
		<c:if test="${currentPageBlockNum == lastPageBlockNum1}">
			<a href="${pageContext.request.contextPath}/IndexController?currentPage=${(currentPageBlockNum-1)*10+1}&categoryName=${categoryName}&searchWord=${searchWord}">이전</a>
			<c:forEach var="i" begin="${(currentPageBlockNum)*10+1}" end="${lastPage}" step="1">
				<a href="${pageContext.request.contextPath}/IndexController?currentPage=${i}&categoryName=${categoryName}&searchWord=${searchWord}">${i}</a>
			</c:forEach>
		</c:if>
		
	</div>
		<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
	</div>
	
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