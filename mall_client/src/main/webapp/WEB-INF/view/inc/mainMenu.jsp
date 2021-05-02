<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 상단 메인 메뉴 -->
	<c:if test="${loginClient == null}">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-sm-7 col-md-9">
							<div id="colorlib-logo"><a href="${pageContext.request.contextPath}/IndexController">EbookStore</a></div>
						</div>
						<div class="col-sm-5 col-md-3">
			            <form action="${pageContext.request.contextPath}/IndexController" class="search-wrap" method="get">
			               <div class="form-group">
			                  <input type="text" name="searchWord" class="form-control search" placeholder="Search Ebook">
			                  <button class="btn btn-primary submit-search text-center" type="submit"><i class="icon-search"></i></button>
			               </div>
			            </form>
			         </div>
		         </div>
		        
					<div class="row">
						<div class="col-sm-12 text-left menu-1">
							<ul>
								<!-- InsertClientController -> /view/insertClient.jsp -->
								<li><a href="${pageContext.request.contextPath}/IndexController">홈으로</a>
								<li><a href = "${pageContext.request.contextPath}/EbookCalendarController">ebook달력</a></li>
							</ul>
						</div>		
					</div>
				</div>
			</div>
			<div class="sale">
				<div class="container">
					<div class="row">
						<div class="col-sm-8 offset-sm-2 text-center">
							<div class="row">
								<div class="owl-carousel2">
									<div class="item">
										<div class="col">
											<h3><a href="#">Welcom to EbookStore</a></h3>
										</div>
									</div>
									<div class="item">
										<div class="col">
											<h3><a href="#">Book is the food of the heart</a></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
				   	<li style="background-image: url(images/img_bg_1.jpg);"></li>
				   	<li style="background-image: url(images/img_bg_2.jpg);"></li>
				   	<li style="background-image: url(images/img_bg_3.jpg);"></li>
			  	</ul>
		  	</div>
		</aside>
	</c:if>
	
	<c:if test="${loginClient != null}">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-sm-7 col-md-9">
							<div id="colorlib-logo"><a href="${pageContext.request.contextPath}/IndexController">EbookStore</a></div>
						</div>
						<div class="col-sm-5 col-md-3">
			            <form action="${pageContext.request.contextPath}/IndexController" class="search-wrap">
			               <div class="form-group">
			                  <input type="search" class="form-control search" placeholder="Search" name="searchWord">
			                  <button class="btn btn-primary submit-search text-center" type="submit"><i class="icon-search"></i></button>
			               </div>
			            </form>
			         </div>
		         </div>
		         <div>
		         	${loginClient.clientMail}님 반갑습니다.&nbsp;&nbsp; <a href="${pageContext.request.contextPath}/LogoutController">로그아웃</a>
		         </div>
					<div class="row">
						<div class="col-sm-12 text-left menu-1">
							<ul>
								<!-- InsertClientController -> /view/insertClient.jsp -->
								<li><a href="${pageContext.request.contextPath}/IndexController">홈으로</a>
								<!-- ClientOneController -> ClientDao.selectclientOne() -> /view/client/clientOne.jsp-->
								<li><a href="${pageContext.request.contextPath}/ClientOneController">회원정보</a></li>
								<!-- OrdersListController - OrdersDao.selectOrdersListByClient()-OrdersList.jsp -->
								<li><a href="${pageContext.request.contextPath}/OrdersListController">주문리스트</a></li>
								<li><a href ="${pageContext.request.contextPath}/EbookCalendarController">ebook달력</a></li>
								<li class="cart"><a href="${pageContext.request.contextPath}/CartListController"><i class="icon-shopping-cart"></i> Cart</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="sale">
				<div class="container">
					<div class="row">
						<div class="col-sm-8 offset-sm-2 text-center">
							<div class="row">
								<div class="owl-carousel2">
									<div class="item">
										<div class="col">
											<h3><a href="#">Welcom to EbookStore</a></h3>
										</div>
									</div>
									<div class="item">
										<div class="col">
											<h3><a href="#">Book is the food of the heart</a></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<aside id="colorlib-hero">
			<div class="flexslider">
				<ul class="slides">
				   	<li style="background-image: url(images/img_bg_1.jpg);"></li>
				   	<li style="background-image: url(images/img_bg_2.jpg);"></li>
				   	<li style="background-image: url(images/img_bg_3.jpg);"></li>
			  	</ul>
		  	</div>
		</aside>		
	</c:if>