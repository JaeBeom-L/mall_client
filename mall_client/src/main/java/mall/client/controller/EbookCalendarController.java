package mall.client.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.EbookDao;
import mall.client.vo.Ebook;

@WebServlet("/EbookCalendarController")
public class EbookCalendarController extends HttpServlet {
	private EbookDao ebookDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.ebookDao = new EbookDao();
		
		// 년/월에 매개값으로 전달되지 않으면
		Calendar dday = Calendar.getInstance();
		
		if(request.getParameter("currentYear") != null) {			
			dday.set(Calendar.YEAR, Integer.parseInt(request.getParameter("currentYear")));
		}
		if(request.getParameter("currentMonth") != null) {			
			dday.set(Calendar.MONTH, Integer.parseInt(request.getParameter("currentMonth"))-1);
		}
		int currentYear = dday.get(Calendar.YEAR);
		int currentMonth = dday.get(Calendar.MONTH)+1;
		
		// 마지막 일
		int endDay = dday.getActualMaximum(Calendar.DAY_OF_MONTH);	// 받아온 파라미터 값에 따라 해당되는 달의 마지막 일
		
		
		// 현재달의 1일의 요일
		Calendar firstDay = Calendar.getInstance();
		firstDay.set(Calendar.YEAR, currentYear);
		firstDay.set(Calendar.MONTH, currentMonth-1);
		firstDay.set(Calendar.DATE, 1);
		int firstDayOfWeek = firstDay.get(Calendar.DAY_OF_WEEK); // 받아온 파라미터 값에 따라 해당되는 달의 1일 요일이 정수값으로 반환
		
		//디버깅 코드
		System.out.println(firstDayOfWeek+ " 요일에 따른 숫자");	
		System.out.println(currentYear+" 현재년도");
		System.out.println(currentMonth+" 현재월");
		System.out.println(endDay+" 월 마지막 일");
		
		
		List<Map<String, Object>> ebookListByMonth = this.ebookDao.selectEbookListByDay(currentYear, currentMonth);
		
		request.setAttribute("currentYear", currentYear);
		request.setAttribute("currentMonth", currentMonth);
		request.setAttribute("endDay", endDay);
		request.setAttribute("firstDayOfWeek", firstDayOfWeek);
		request.setAttribute("ebookListByMonth", ebookListByMonth);
		request.getRequestDispatcher("/WEB-INF/view/ebook/ebookCalendar.jsp").forward(request, response);
	}

}
