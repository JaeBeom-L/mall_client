package mall.client.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.CategoryDao;
import mall.client.model.EbookDao;
import mall.client.model.OrdersDao;
import mall.client.model.StatsDao;
import mall.client.vo.Ebook;
import mall.client.vo.Stats;

@WebServlet("/IndexController") // 컨트롤러에서 모델연결 그리고 뷰에 연결
public class IndexController extends HttpServlet {
	private EbookDao ebookDao;
	private CategoryDao categoryDao;
	private OrdersDao ordersDao;
	private StatsDao statsDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		System.out.println("/IndexController 시작");
		// model 호출
		this.ebookDao = new EbookDao();
		this.categoryDao = new CategoryDao();
		this.ordersDao = new OrdersDao();
		// 현재페이지
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = (int)Double.parseDouble(request.getParameter("currentPage"));
		}
		int currentPageBlockNum = (currentPage-1)/10;
		// 카테고리 선택
		String categoryName = null; // 문자열 null이 넘어올 경우 진짜 null로 변경
		if(request.getParameter("categoryName") != null ) {
			categoryName = request.getParameter("categoryName");				
			if(request.getParameter("categoryName").equals("null")) { 
				categoryName = null;
			}					
		}
						
		// 검색단어
		String searchWord = null; // 문자열 null이 넘어올 경우 진짜 null로 변경
		if(request.getParameter("searchWord") != null) {
			searchWord = request.getParameter("searchWord");					
			if(request.getParameter("searchWord").equals("null")) { 
				searchWord = null;
			}
		}
		//보여줄 행의 수
		int rowPerPage = 15;
		// 시작행
		int beginRow = (currentPage -1) * rowPerPage;
		//총 자료 수
		int totalRow = ebookDao.totalRow(categoryName,searchWord);
		//마지막 페이지
		int lastPage = totalRow/rowPerPage;
		if((totalRow % rowPerPage) != 0){
			lastPage +=1;
		}
		int lastPageBlockNum = (lastPage-1)/10;
		int lasPageBlockNum1 = lastPage/10;
		
		System.out.println(totalRow+"컨트롤러에서 totalRow");
		
		List<Ebook> ebookList = ebookDao.selectEbookListByPage(beginRow, rowPerPage, categoryName, searchWord); // 페이징한 ebookList 생성
		List<String> categoryList = categoryDao.categoryNameList();
		List<Map<String, Object>> bestOrdersList = ordersDao.selectBestOrdersList();
		
		//접속자 관련 데이터
		this.statsDao = new StatsDao();
		long total = this.statsDao.selectStatsTotal();
		Stats stats = this.statsDao.selectStatsByToday();
		long statsCount = 0;
		if(stats != null) {
			statsCount = stats.getStats_count();
		}
		
		
		// View forward
		request.setAttribute("total", total);
		request.setAttribute("statsCount", statsCount);
		request.setAttribute("currentPageBlockNum", currentPageBlockNum);
		request.setAttribute("lastPageBlockNum", lastPageBlockNum);
		request.setAttribute("lastPageBlockNum1", lasPageBlockNum1);
		request.setAttribute("ebookList", ebookList); //request에 "ebookList"라는 이름으로 ebookList를 저장
		request.setAttribute("totalRow", totalRow); // request에 총 행의 수를 저장
		request.setAttribute("currentPage", currentPage); // //request에 현재 페이지 저장
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("categoryList", categoryList); // request에 카테고리리스트 저장
		request.setAttribute("searchWord",searchWord); 	// request에 검색단어 저장
		request.setAttribute("categoryName", categoryName); // categoryName 저장
		request.setAttribute("rowPerPage", rowPerPage); // request에 rowPerPage 저장
		request.setAttribute("bestOrdersList", bestOrdersList); //request에 bestOrdersList 저장
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/index.jsp");//dispatcher객체에 request의 데이터와 보낼 곳(index페이지)를 지정
		rd.forward(request, response);// request와 response의 객체 정보를 보낸다.

				
	}
	
	
}
