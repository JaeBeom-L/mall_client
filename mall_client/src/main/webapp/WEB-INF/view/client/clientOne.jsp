<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clientOne</title>
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
	<div class="container">		
		<h2>고객정보</h2>
		<table border="1" class="table table-bordered">
			<tr>
				<td>clientNo</td>
				<td>${client.clientNo}</td>
			</tr>
			
			<tr>
				<td>clientMail</td>
				<td>${client.clientMail}</td>
			</tr>
			
			<tr>
				<td>clientDate</td>
				<td>${client.clientDate}</td>
			</tr>
		</table>
		
		<!-- UpdateClientPasswordController.doGet - updateClientPw.jsp>
		<!-- UpdateClientPasswordController.doPost - ClientDao.updateClientPassword() - redirect:/Index -->
		<button class="btn" data-toggle="modal" data-target="#updateClientModal">
			정보수정
		</button>
		<!-- DeleteClientController - ClientDao.deleteClient() - session.invalidate() -->
		<button class="btn">
			<a href="${pageContext.request.contextPath}/DeleteClientController">회원탈퇴</a>
		</button>
				
		  <!-- The Modal -->
		  <div class="modal" id="updateClientModal">
		    <div class="modal-dialog">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">패스워드 변경</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <form method="post" action="${pageContext.request.contextPath}/UpdateClientPasswordController">
			        <!-- Modal body -->
			        <div class="modal-body">		          
						<table border="1" class="table table-bordered">				
							<tr>
								<td>clientMail</td>
								<td>${loginClient.clientMail}</td>
							</tr>
							
							<tr>
								<td>clientPw</td>
								<td><input type="password" name="clientPw" class="form-control"></td>
							</tr>					
						</table>			
			        </div>		        	
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="submit" class="btn">수정</button>
			        </div>
		        </form>		        
		      </div>
		    </div>
		  </div>
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