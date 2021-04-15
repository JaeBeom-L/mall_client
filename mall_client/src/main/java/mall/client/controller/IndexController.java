package mall.client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.EbookDao;
import mall.client.vo.Ebook;

import java.util.*;

@WebServlet("/IndexController") // 컨트롤러에서 모델연결 그리고 뷰에 연결
public class IndexController extends HttpServlet {
	private EbookDao ebookDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		// request 분석
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 15;
		int beginRow = (currentPage -1) * rowPerPage;
		
		// model 호출
		this.ebookDao = new EbookDao();
		List<Ebook> ebookList = this.ebookDao.selectEbookListByPage(beginRow, rowPerPage); // 페이징한 ebookList 생성
		
		// View forward
		request.setAttribute("ebookList", ebookList); //request에 "ebookList"라는 이름으로 ebookList를 저장
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/index.jsp");//dispatcher객체에 request의 데이터와 보낼 곳(index페이지)를 지정
		rd.forward(request, response);// request와 response의 객체 정보를 보낸다.
	}
}
