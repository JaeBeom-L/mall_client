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
	<div class="row">
		<div class="col-lg-3 mb-4 text-center">
			오늘 접속자 수 : ${statsCount}
			전체 접속자 수 : ${total}
		</div>
		<div class="col-lg-6 mb-4 text-center">
		</div>
		<div>
			<c:if test="${loginClient == null}">
				<form action="${pageContext.request.contextPath}/LoginController" method="post">
					<div class="row">
						<div>ID :</div> 
						<input type = "text" name = "clientMail" class="form-control">
					</div>
					<div class="row">
						<div>PW :</div> 
						<input type = "password" name = "clientPw" class="form-control">
					</div>
					<div class="row">
						<button type="submit" class="btn btn-primary submit-search text-center">로그인</button>
						<button type="button" class="btn btn-primary submit-search text-center" data-toggle="modal" data-target="#insertClientModal">회원가입</button>
					</div>
				</form>	
			</c:if>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 -->

	
	<!-- 베스트 셀러 -->
	<div>
		<div class="colorlib-product">			
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
							<div>
								<span class="price">￦ ${m.ebookPrice}</span>
							</div>							
						</div>							
					</div>								
				</c:forEach>
				<div class="col-lg-1 mb-4 text-center">
				</div>	
			</div>
		</div>
	</div>
	<br>
	
	<div class="col-sm-8 offset-sm-2 text-center colorlib-heading">
		<h2>Ebook List</h2>
	</div>
	<nav class="navbar navbar-expand-sm bg-light justify-content-center" role="navigation">	
		<div class="container">
			<div class="row">									
				<!-- 카테고리 -->
				<div>
					<ul class="nav">
						<li class="nav-link">
							<a href="${pageContext.request.contextPath}/IndexController" class="nav-link active">전체보기</a>
						</li>
						<c:forEach var="cn" items="${categoryList}">
							<li class="nav-link">
								<a href="${pageContext.request.contextPath}/IndexController?categoryName=${cn}" class="nav-link active">${cn}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>	
		</div>		
	</nav>
	<br>		
	<div>			
		<div>	
			<div class="row row-pb-md">					
				<c:set var="i" value="0"></c:set>
				<c:forEach var="e" items="${ebookList}">	
				<c:if test="${i%5 == 0 }">
					<div class="col-lg-1 mb-4 text-center"></div>	
				</c:if>	
					<div class="col-lg-2 mb-4 text-center">
						<div class="product-entry border">
							<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${e.ebookNo}" class="prod-img">
								<img src="${pageContext.request.contextPath}/img/default.jpg" class="img-fluid" alt="Free html5 bootstrap 4 template">
							</a>
							<div class="desc">
								<h2><a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${e.ebookNo}">${e.ebookTitle}</a></h2>
							</div>	
							<div>
								<span class="price">￦ ${e.ebookPrice}</span>
							</div>							
						</div>							
					</div>					
				<c:set var="i" value="${i+1}"></c:set>		
				<c:if test="${i%5 == 0 }">
					<div class="col-lg-1 mb-4 text-center"></div>	
				</c:if>															
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12 text-center"><!-- 10단위 페이징-->
			<div class="block-27">
				<!--  총 페이지가 10페이지 이하일 때 -->
				<c:if test="${lastPage<=10}">
					<ul>
						<c:forEach var="i" begin="${1}" end="${lastPage}" step="1">				
							<li>
								<a href="${pageContext.request.contextPath}/IndexController?currentPage=${i}&categoryName=${categoryName}&searchWord=${searchWord}">${i}</a>
							</li>				
						</c:forEach>
					</ul>
				</c:if>
						
				<!-- 현재  보는 페이지가 10 이하이고 총 페이지는 10초과일 때 이전버튼을 없앤다 -->
				<c:if test="${currentPage <= 10 && lastPage>10}">
					<ul>
						<c:forEach var="i" begin="${1}" end="${10}" step="1">				
							<li>
								<a href="${pageContext.request.contextPath}/IndexController?currentPage=${i}&categoryName=${categoryName}&searchWord=${searchWord}">${i}</a>
							</li>					
						</c:forEach>			
						<li>
							<a href="${pageContext.request.contextPath}/IndexController?currentPage=${11}&categoryName=${categoryName}&searchWord=${searchWord}"><i class="ion-ios-arrow-forward"></i></a>
						</li>
					</ul>
				</c:if>
							
				<!-- 11페이지 이상이고  마지막 페이지 블럭 전 까지	 -->
				<c:if test="${currentPage >= 11 && currentPage<=(lastPageBlockNum)*10}">
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/IndexController?currentPage=${(currentPageBlockNum-1)*10+1}&categoryName=${categoryName}&searchWord=${searchWord}"><i class="ion-ios-arrow-back"></i></a>
						</li>
						<c:forEach var="i" begin="${(currentPageBlockNum)*10+1}" end="${(currentPageBlockNum)*10+10}" step="1">
							<li>
								<a href="${pageContext.request.contextPath}/IndexController?currentPage=${i}&categoryName=${categoryName}&searchWord=${searchWord}">${i}</a>
							</li>
						</c:forEach>
						<li>
							<a href="${pageContext.request.contextPath}/IndexController?currentPage=${(currentPageBlockNum+1)*10+1}&categoryName=${categoryName}&searchWord=${searchWord}"><i class="ion-ios-arrow-forward"></i></a>
						</li>
					</ul>
				</c:if>
		
				<!-- 마지막 페이지 블럭이 있는곳-->
				<c:if test="${currentPageBlockNum == lastPageBlockNum1 && lastPage>10}">
					<ul>
						<li>
							<a href="${pageContext.request.contextPath}/IndexController?currentPage=${(currentPageBlockNum-1)*10+1}&categoryName=${categoryName}&searchWord=${searchWord}"><i class="ion-ios-arrow-back"></i></a>
						</li>
						<c:forEach var="i" begin="${(currentPageBlockNum)*10+1}" end="${lastPage}" step="1">
							<li>	
								<a href="${pageContext.request.contextPath}/IndexController?currentPage=${i}&categoryName=${categoryName}&searchWord=${searchWord}">${i}</a>
							</li>				
						</c:forEach>
					</ul>
				</c:if>			
			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="insertClientModal">
	 	 <div class="modal-dialog">
		      <div class="modal-content">		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">회원가입</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <form method="post" action="${pageContext.request.contextPath}/InsertClientController">
			        <!-- Modal body -->
			        <div class="modal-body">		          
						<table border="1" class="table table-bordered">				
							<tr>
								<td>clientMail</td>
								<td><input type="text" name="clientMail" class="form-control"></td>
							</tr>
							
							<tr>
								<td>clientPw</td>
								<td><input type="password" name="clientPw" class="form-control"></td>
							</tr>					
						</table>			
			        </div>		        	
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="submit" class="btn">회원가입</button>
			        </div>
		        </form>		        
		      </div>
		</div>
	</div>	
		
	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
	</div>
	
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