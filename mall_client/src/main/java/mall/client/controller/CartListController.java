package mall.client.controller;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;

@WebServlet("/CartListController")
public class CartListController extends HttpServlet {
	private CartDao cartDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//session 로그인 검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) { // 세션값이 없다면 인덱스 페이지로 보낸다.
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		//dao호출
		request.setCharacterEncoding("UTF-8"); // 받아올 파라미터 인코딩 형식을 UTF-8로 설정
		this.cartDao = new CartDao();		
		String clientMail = (String)session.getAttribute("loginClient"); // 세션에서 받아온 값을 문자열타입으로 clientMail에 저장 (세션을 받아 올때 email만 받아옴)
		System.out.println(clientMail+"세션고객메일"); // 디버깅 코드
		List<Map<String, Object>> list = this.cartDao.selectCartList(clientMail);// Map타입을 이용하여 장바구니 리스트 메서드를 이용하여 list에 값들을 저장
		request.setAttribute("list", list);	//Object 타입으로 저장
		//forward
		request.getRequestDispatcher("/WEB-INF/view/cart/cartList.jsp").forward(request, response); // cartList.jsp에 request에 저장된 list를 넘겨준다.
	}

}
