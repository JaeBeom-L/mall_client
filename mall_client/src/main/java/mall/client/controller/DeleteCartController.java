package mall.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;

@WebServlet("/DeleteCartController")
public class DeleteCartController extends HttpServlet {
	private CartDao cartDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 검사 
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		int cartNo = Integer.parseInt(request.getParameter("cartNo")); // 파라미터 값으로 장바구니 번호를 불러온다.
		this.cartDao = new CartDao();
		this.cartDao.deleteCart(cartNo); // 장바구니 아이템 삭제 메서드
		response.sendRedirect(request.getContextPath()+"/CartListController"); // 작업이 끝난 후 장바구니를 다시 보여준다.
	}

}
