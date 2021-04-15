package mall.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.EbookDao;
import mall.client.vo.Ebook;

@WebServlet("/EbookOneController")
public class EbookOneController extends HttpServlet {
	private EbookDao ebookDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
		this.ebookDao = new EbookDao();
		Ebook ebook = this.ebookDao.selectEbookOne(ebookNo);
		System.out.println(ebook.toString()); //디버깅코드
		
		request.setAttribute("ebook", ebook); // request에 ebook 상세 정보를 저장
		request.getRequestDispatcher("WEB-INF/view/ebook/ebookOne.jsp").forward(request, response);// ebookOne페이지에 request객체를 전송
	}

}
