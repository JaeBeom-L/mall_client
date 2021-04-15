package mall.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;
import mall.client.vo.Cart;

@WebServlet("/InsertCartController")
public class InsertCartController extends HttpServlet {
	private CartDao cartDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 검사 없으면 index로
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect("/IndexController");
			return;
		}
		int ebookNo = Integer.parseInt(request.getParameter("ebookNo")); 
		this.cartDao = new CartDao();
		Cart cart = new Cart();
		cart.setEbookNo(ebookNo); //선택한 책 번호를 담는다.
		cart.setClientMail((String)session.getAttribute("loginClient")); // 세션 정보를 담는다 세션엔 (로그인 이메일이 담겨있음)
		System.out.println(cart.toString());	// 디버깅 코드
		if(this.cartDao.selectClientMail(cart)) {
			this.cartDao.insertCart(cart);// 장바구니 추가 메서드 실행
		}else {
			System.out.println("중복된 데이터 존재");
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
			
		}		
		response.sendRedirect(request.getContextPath()+"/CartListController"); // 작업 완료후 카트리스트로 이동
	}

}
