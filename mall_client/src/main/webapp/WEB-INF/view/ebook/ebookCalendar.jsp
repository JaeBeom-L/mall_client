<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<h1>Ebook Calendar</h1>
	<!-- 5행 7열 -->
	<div>
		<a href="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${preYear}&currentMonth=${preMonth}">이전달</a>
		<span>${currentYear}년</span>
		<span>${currentMonth}월</span>
		<a href="${pageContext.request.contextPath}/EbookCalendarController?currentYear=${nextYear}&currentMonth=${nextMonth}">다음달</a>	
	</div>
	<table border="1">
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
			
		<tr>
			<!-- 공백 + endDay 만큼 <td>가 필요 -->
			<c:forEach var="i" begin="1" end="${endDay+(firstDayOfWeek-1)}" step="1">
				
				<c:if test="${i-(firstDayOfWeek-1)<=0}">
					<td>&nbsp;</td>
				</c:if>
				
				<c:if test="${i-(firstDayOfWeek-1)>0 }">
					<td>
						<div>${i-(firstDayOfWeek-1)}</div>
						<c:forEach var="m" items="${ebookListByMonth}">
							<c:if test="${(i-(firstDayOfWeek-1)) == m.d}">
								<div>
									<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">
										<c:if test="${m.ebookTitle.length()>15}">
											${m.ebookTitle.substring(0,15)}...
										</c:if>		
										<c:if test="${m.ebookTitle.length()<=15}">
											${m.ebookTitle}
										</c:if>								
									</a>
								</div>
							</c:if>
						</c:forEach>
					</td>
				</c:if>
											
				<c:if test="${i%7 == 0}">
					</tr><tr>
				</c:if>
												
			</c:forEach>
			<!-- td 반복후 채워지지 않는 자리가 있다면... -->
			<c:if test="${(endDay+(firstDayOfWeek-1))%7 != 0 }">
				<c:forEach begin="1" end="${7-(endDay+(firstDayOfWeek-1))%7}" step="1">
					<td>&nbsp;</td>
				</c:forEach>
			</c:if>
		</tr>
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