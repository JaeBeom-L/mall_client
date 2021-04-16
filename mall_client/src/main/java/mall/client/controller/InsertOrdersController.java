package mall.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;
import mall.client.model.OrdersDao;
import mall.client.vo.Client;
import mall.client.vo.Orders;

@WebServlet("/InsertOrdersController")
public class InsertOrdersController extends HttpServlet {
	private CartDao cartDao;
	private OrdersDao ordersDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		
		// 의존객체 생성 후 주입
		this.cartDao = new CartDao();
		this.ordersDao = new OrdersDao();
		
		//request
		int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		Client client = (Client)session.getAttribute("loginClient");
		int clientNo = client.getClientNo();
		Orders orders = new Orders();
		orders.setEbookNo(ebookNo);
		orders.setClientNo(clientNo);
		
		//dao
		//insert 후 delete 되기전 db에 문제가 생기면? --> insert도 취소(롤백) --> 트랜잭션처리
		ordersDao.insertOrders(orders);
		cartDao.deleteCart(cartNo);
		
		response.sendRedirect(request.getContextPath()+"/OrdersListController");
	}

}
