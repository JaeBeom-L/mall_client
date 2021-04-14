package mall.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.ClientDao;
import mall.client.vo.*;

@WebServlet("/ClientOneController")
public class ClientOneController extends HttpServlet {
	private ClientDao clientDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Client client = new Client();
		// 로그인 유효성 검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		String clientMail = (String)session.getAttribute("loginClient"); // 세션에서 받아온 값을 문자열타입으로 clientMail에 저장 (세션을 받아 올때 email만 받아옴)
		System.out.println(clientMail+"고객정보세션"); //디버깅코드
		this.clientDao = new ClientDao();	// clientDao의 공간 생성
		client = this.clientDao.selectClientOne(clientMail);//client변수에 clientMail에 맞는 Client정보들이 저장
		request.setAttribute("client", client);// client를 request에 저장
		request.getRequestDispatcher("/WEB-INF/view/client/clientOne.jsp").forward(request, response); // clientOne페이지에 requset에 저장된 값들과 함께 넘겨준다.
	}
}
