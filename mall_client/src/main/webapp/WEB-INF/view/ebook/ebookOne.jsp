<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mall.client.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ebookOne</title>
</head>
<body>
<%
	Ebook ebook = null;
	if(request.getAttribute("ebook") instanceof Ebook){
		ebook = (Ebook)request.getAttribute("ebook");
	}
	
%>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 -->
	
	<h1>ebookOne</h1>
	<table border="1">
		<tr>
			<td>ebookNo</td>
			<td><%=ebook.getEbookNo()%></td>
		</tr>
		
		<tr>
			<td>ebookISBN</td>
			<td><%=ebook.getEbookISBN() %></td>
		</tr>
		
		<tr>
			<td>categoryName</td>
			<td><%=ebook.getCategoryName() %></td>
		</tr>
		
		<tr>
			<td>ebookTitle</td>
			<td><%=ebook.getEbookTitle() %></td>
		</tr>
		
		<tr>
			<td>ebookAuthor</td>
			<td><%=ebook.getEbookAuthor() %></td>
		</tr>
		
		<tr>
			<td>ebookCompany</td>
			<td><%=ebook.getEbookCompany() %></td>
		</tr>
		
		<tr>
			<td>ebookPageCount</td>
			<td><%=ebook.getEbookPageCount() %></td>
		</tr>
		
		<tr>
			<td>ebookPrice</td>
			<td><%=ebook.getEbookPrice() %></td>
		</tr>
		
		<tr>
			<td>ebookImg</td>
			<td><img src="<%=request.getContextPath()%>/img/<%=ebook.getEbookImg() %>"></td>
		</tr>
		
		<tr>
			<td>ebookSummary</td>
			<td><%=ebook.getEbookSummary() %></td>
		</tr>
		
		<tr>
			<td>ebookDate</td>
			<td><%=ebook.getEbookDate() %></td>
		</tr>
		
		<tr>
			<td>ebookState</td>
			<td><%=ebook.getEbookState() %></td>
		</tr>
	</table>
	<!-- InsertCartController?ebookNo - CartDao.insertCart()- redirect:CartListController -->
	<%
		if(session.getAttribute("loginClient") == null || !(ebook.getEbookState().equals("판매중"))){
	%>
			<a href="<%=request.getContextPath()%>/InsertCartController?ebookNo=<%=ebook.getEbookNo()%>">
				<button type="button" disabled="disabled">장바구니추가</button>
			</a>	
	<%
		}else{
	%>
			<a href="<%=request.getContextPath()%>/InsertCartController?ebookNo=<%=ebook.getEbookNo()%>">
				<button type="button">장바구니추가</button>
			</a>
	<%
		}
	%>
		
	
	
</body>
</html>