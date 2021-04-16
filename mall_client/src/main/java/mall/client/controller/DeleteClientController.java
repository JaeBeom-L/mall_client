package mall.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;
import mall.client.model.ClientDao;
import mall.client.vo.Client;

@WebServlet("/DeleteClientController")
public class DeleteClientController extends HttpServlet {
	private ClientDao clientDao;
	private CartDao cartDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션 유효성 검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		String clientMail = ((Client)(session.getAttribute("loginClient"))).getClientMail(); // 세션에서 받아온 값을 문자열타입으로 clientMail에 저장 (세션을 받아 올때 email만 받아옴)
		System.out.println(clientMail+"고객정보세션"); //디버깅코드
		this.clientDao = new ClientDao();
		this.cartDao = new CartDao();
		this.cartDao.deleteCartAll(clientMail); // 장바구니 삭제 메서드 실행
		this.clientDao.deleteClient(clientMail); // 회원정보탈퇴 메서드 실행
		
		response.sendRedirect(request.getContextPath()+"/LogoutController"); // 작업 완료후 세션초기화후 인덱션 페이지 이동
		
		
	}

}
