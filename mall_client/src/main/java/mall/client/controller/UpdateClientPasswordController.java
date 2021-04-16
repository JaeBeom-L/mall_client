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

@WebServlet("/UpdateClientPasswordController")
public class UpdateClientPasswordController extends HttpServlet {
	private ClientDao clientDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/view/client/updateClientPw.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션 검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		String clientMail = ((Client)(session.getAttribute("loginClient"))).getClientMail(); // 세션값을 고객 이메일로 설정 강제 타입변환 해준다.
		Client client = new Client();
		client.setClientMail(clientMail);
		client.setClientPw(request.getParameter("clientPw"));// 비밀번호 수정페이지에서 받아온 파라미터를 저장
		System.out.println(client.toString());//디버깅 코드
		this.clientDao = new ClientDao();
		this.clientDao.updateClientPassword(client);
		response.sendRedirect(request.getContextPath()+"/LogoutController"); // 비번번경후 로그아웃 후 다시 할 수 있도록 로그아웃컨트롤러 실행
		
	}

}
