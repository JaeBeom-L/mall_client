<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mall.client.vo.*"%>
<%@ page import="mall.client.model.*" %>
<%@ page import="java.util.*" %>
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
	<%
		List<Ebook> ebookList =(List<Ebook>)(request.getAttribute("ebookList"));
		//현재페이지
		int currentPage = 1;
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		// 총 ebook수
		int totalRow = 0;
		if(request.getAttribute("totalRow") != null){
			totalRow = (Integer)request.getAttribute("totalRow");
		}
		System.out.println(totalRow+"총 행의수");
		// 한페이지에 보여줄 행의 수
		int rowPerPage = 15;
		if(request.getAttribute("rowPerPage") != null){
			rowPerPage = (Integer)request.getAttribute("rowPerPage");
		}
		//마지막 페이지
		int lastPage = totalRow/rowPerPage;
		if((totalRow % rowPerPage) != 0){
			lastPage +=1;
		}
		System.out.println(lastPage+"마지막 페이지");
		
		//카테고리 이름
		String	categoryName = (String)request.getAttribute("categoryName");		
		System.out.println(categoryName+"카테고리 이름");
		
		//검색단어		
		String searchWord = (String)request.getAttribute("searchWord");
		System.out.println(searchWord+"검색 단어");
				
	%>
	<!-- 카테고리 -->
	<div>
		<a href="<%=request.getContextPath() %>/IndexController">전체보기</a>
		<%
			List<String> categoryList = (List<String>)request.getAttribute("categoryList");
			for(String s : categoryList){
		%>
				<a href="<%=request.getContextPath() %>/IndexController?categoryName=<%=s%>"><%=s %></a>
		<%
			}
		%>
	</div>
	<table border="1">
		<tr>
		<%
			int i = 0;
			for(Ebook ebook : ebookList){
				i +=1;
		%>				
				<td>
					<div><img src="<%=request.getContextPath()%>/img/default.jpg"></div>
					<!-- EbookOneController -EbookDao.selectEbookOne() - ebookOne.jsp -->
					<div>
						<a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=ebook.getEbookNo()%>">
							<%=ebook.getEbookTitle()%>
						</a>
					</div>
					<div><%=ebook.getEbookPrice()%></div>
				</td>
				
		<%
				if(i%5 == 0){
		%>
					</tr><tr>
				
		<%
				}
			}
		%>
		</tr>
	</table>
	<div><!--  검색창 -->
		<form action="<%=request.getContextPath()%>/IndexController" method="get">
			검색 : <input type="text" name="searchWord">
			<button type="submit">검색</button>
		</form>
	
	</div>
	<div><!-- 10단위 페이징-->
		<%
			if(currentPage == 1 && totalRow>rowPerPage){ // 현재 페이지가 1이라면 이전버튼을 없앤다
				for(int j=((currentPage-1)/10)*10+1; j<=((currentPage-1)/10)*10+10; j++){
		%>
					<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=j%>&categoryName=<%=categoryName%>&searchWord=<%=searchWord%>"><%=j%></a>
		<%
				}
		%>
					<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=((currentPage-1)/10+1)*10+1 %>&categoryName=<%=categoryName%>&searchWord=<%=searchWord%>  ">다음</a>
		<%
			}else if(totalRow<rowPerPage){ // 1페이지에서 총 게시물 수가 rowPerPage보다 작을 때
		%>
					<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=1%>&categoryName=<%=categoryName%>&searchWord=<%=searchWord%>"><%=1%></a>
		<%
			}else if((currentPage-1)/10<1){ // 10페이지씩 1~10페이지일 때	
				for(int j=((currentPage-1)/10)*10+1; j<=((currentPage-1)/10)*10+10; j++){	
		%>
					<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=j%>&categoryName=<%=categoryName%>&searchWord=<%=searchWord%>"><%=j%></a>
		<%
				}
		%>
					<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=((currentPage-1)/10+1)*10+1 %>&categoryName=<%=categoryName%>&searchWord=<%=searchWord%> ">다음</a>
		<%
			}else if((currentPage-1)/10 == lastPage/10){ // 10페이지씩 마지막 부분일 때 다음버튼이 없다
				%>
							<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=((currentPage-1)/10-1)*10+1 %>&categoryName=<%=categoryName%>&searchWord=<%=searchWord%> ">이전</a>
				<%
						for(int j=((currentPage-1)/10)*10+1; j<=lastPage; j++){
				%>
							<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=j%>&categoryName=<%=categoryName%>&searchWord=<%=searchWord%>  "><%=j%></a>
				<%
						}
			}else{ // 11페이지부터 ~ 마지막 페이지 부분 블럭 전까지
		%>
					<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=((currentPage-1)/10-1)*10+1 %>&categoryName=<%=categoryName%>&searchWord=<%=searchWord%>  ">이전</a>
		<%	
				for(int j=((currentPage-1)/10)*10+1; j<=((currentPage-1)/10)*10+10; j++){	
		%>
					<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=j%>&categoryName=<%=categoryName%>&searchWord=<%=searchWord%>  "><%=j%></a>
		<%
				}
		%>
					<a href="<%=request.getContextPath()%>/IndexController?currentPage=<%=((currentPage-1)/10+1)*10+1 %>&categoryName=<%=categoryName%>&searchWord=<%=searchWord%>  ">다음</a>
		<%
			}					
		%>

	</div>
	
</body>
</html>