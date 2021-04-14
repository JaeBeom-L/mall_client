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

@WebServlet("/InsertClientController")
public class InsertClientController extends HttpServlet {
	private ClientDao clientDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") != null) {
			response.sendRedirect("IndexController");
		}
		request.getRequestDispatcher("/WEB-INF/view/client/insertClient.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.clientDao = new ClientDao();		
		//중복 검사
		request.setCharacterEncoding("UTF-8");
		String clientMail = request.getParameter("clientMail");
		String clientPw = request.getParameter("clientPw");
		String selectClientMail = clientDao.selectClientMail(clientMail);	//db에 jsp에서 받아온 고객 이메일이 있는지 검사하기 위해 중복검사 메서드 있으면 해당되는 메일이 저장
		System.out.println(selectClientMail); // 디버깅코드
		if(selectClientMail != null) {
			System.out.println("이메일 중복입니다.");
			response.sendRedirect("InsertClientController"); // 중복이면 인덱스페이지로 넘어가도록 한다.
			return;
		}
		Client client = new Client();		
		client.setClientEmail(clientMail);
		client.setClientPw(clientPw);
			
		clientDao.insertClient(client); // 중복이 아니면 회원가입 메서드 실행
		response.sendRedirect("IndexController"); // 회원가입이 무사히 끝나면 인덱스페이지로 넘어가도록 한다.
	}

}
