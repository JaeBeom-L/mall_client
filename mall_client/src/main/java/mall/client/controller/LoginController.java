package mall.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.ClientDao;
import mall.client.vo.Client;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private ClientDao clientDao;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 유효성 검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") != null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		
		//
		request.setCharacterEncoding("UTF-8");// 받아온 파라미터값 인코딩을 utf-8로 설정
		String clientMail = request.getParameter("clientMail");
		String clientPw = request.getParameter("clientPw");
		Client client = new Client();
		client.setClientMail(clientMail);
		client.setClientPw(clientPw);
		
		this.clientDao = new ClientDao();
		Client returnClient = this.clientDao.login(client); // 로그인 메서드 실행
		if(returnClient != null) {// 로그인 메서드 실행값이 있다면 세션에 고객메일을 저장
			session.setAttribute("loginClient", returnClient.getClientMail());
		}
		response.sendRedirect(request.getContextPath()+"/IndexController");// 작업 완료후 인덱스페이지로
	}

}
