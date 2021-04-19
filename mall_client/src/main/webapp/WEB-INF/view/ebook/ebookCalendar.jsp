<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	List<Map<String, Object>> ebookListByMonth = (List<Map<String, Object>>)request.getAttribute("ebookListByMonth");
	int currentYear = (Integer)request.getAttribute("currentYear");
	int currentMonth = (Integer)request.getAttribute("currentMonth");
	int endDay = (Integer)request.getAttribute("endDay");
	int firstDayOfWeek = (Integer)request.getAttribute("firstDayOfWeek");
	
	int preMonth = currentMonth -1;
	int preYear = currentYear;
	if(preMonth == 0){
		preMonth = 12;
		preYear -=1;
	}
	int nextMonth = currentMonth +1;
	int nextYear = currentYear;
	if(nextMonth == 13){
		nextMonth = 1;
		nextYear +=1;
	}
	
%>
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<!-- 메뉴1 -->
	
	<h1>Ebook Calendar</h1>
	<!-- 5행 7열 -->
	<div>
		<a href="<%=request.getContextPath()%>/EbookCalendarController?currentYear=<%=preYear%>&currentMonth=<%=preMonth%>">이전달</a>
		<span><%=currentYear %>년</span>
		<span><%=currentMonth %>월</span>
		<a href="<%=request.getContextPath()%>/EbookCalendarController?currentYear=<%=nextYear%>&currentMonth=<%=nextMonth%>">다음달</a>	
	</div>
	<table border="1">
		<tr>
			<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
		</tr>
		
		<tr>
			<%
				int monthEndDay = 28; // 달력 공백일부터 해당 달 끝나는 날까지 칸 수 (월별로 달력 만들 때 필요한 칸수 계산을 위해 사용)
				if((endDay+firstDayOfWeek-1)>35){
					monthEndDay=42;
				}else if((endDay+firstDayOfWeek-1)>28){
					monthEndDay=35;
				}
				for(int i=1; i<=monthEndDay; i++){ // 위의 달력 만드는 필요 칸수에 따라 반복 횟수가 달라진다.
					if(i<firstDayOfWeek || i>=endDay+firstDayOfWeek){// 1일 전의 요일 칸들에는 공백 그리고 endDay이후의 칸들도 공백 설정
			%>
						<td></td>
			<%
					}
					else if(i<endDay+firstDayOfWeek){
			%>		
					<td>
						<%=i-firstDayOfWeek+1%>
						<%
							for(Map m : ebookListByMonth){
								if((i-firstDayOfWeek+1) == (Integer)m.get("d")){
						%>
								<div>
									<a href="<%=request.getContextPath()%>/EbookOneController?ebookNo=<%=m.get("ebookNo")%>">
										<%
											String ebookTitle = (String)m.get("ebookTitle");
											if(ebookTitle.length()>15){
										%>
												<%=ebookTitle.substring(0,15)%>...
										<%
											}else{
										%>
												<%=ebookTitle%>
										<%
											}
										%>
									</a>
								</div>
						<%
								}
							}
						%>
					</td>
			<%
					}
					if(i%7 == 0){
			%>
						</tr><tr>
			<%
					}
				}
			%>
		</tr>
	</table>
</body>
</html>