<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 -->
	
	<h1>index</h1>
	
	<!-- 베스트 셀러 -->
	<div>
		<h3>Best Ebook</h3>
		<table border="1">
			<tr>
				<c:forEach var="m" items="${bestOrdersList}">
						<td>
							<div><img src="${pageContext.request.contextPath}/img/default.jpg"></div>
							<!-- EbookOneController -EbookDao.selectEbookOne() - ebookOne.jsp -->
							<div>
								<a href="${pageContext.request.contextPath}/EbookOneController?ebookNo=${m.ebookNo}">
									${m.ebookTitle}
								</a>
							</div>
							<div>${m.ebookPrice}</div>
						</td>
				</c:forEach>
			</tr>
		</table>
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
</body>
</html>