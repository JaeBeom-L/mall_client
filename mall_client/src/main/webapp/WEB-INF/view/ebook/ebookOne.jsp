<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ebookOne</title>
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
		
	
	
</body>
</html>