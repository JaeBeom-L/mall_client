package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mall.client.commons.DBUtil;
import mall.client.vo.Orders;

public class OrdersDao {
	private DBUtil dbUtil;
	// 베스트셀러 리스트 출력 메서드
	public List<Map<String, Object>> selectBestOrdersList(){
		List<Map<String, Object>> list = new ArrayList<>();
		this.dbUtil = new DBUtil();		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn=this.dbUtil.getConnectioin();
			String sql = "SELECT t.ebook_no ebookNo, t.cnt ordersCnt, e.ebook_title ebookTitle, e.ebook_price ebookPrice FROM (SELECT ebook_no, count(ebook_no) cnt FROM orders WHERE orders_state = '주문완료' GROUP BY ebook_no HAVING COUNT(ebook_no)>1  LIMIT 5) t INNER JOIN ebook e ON t.ebook_no=e.ebook_no ORDER BY t.cnt DESC";
			stmt = conn.prepareStatement(sql);
			System.out.println(stmt+"베스트셀러리스트");
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<>();
				map.put("ebookNo", rs.getInt("ebookNo"));
				map.put("ordersCnt", rs.getString("ordersCnt"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("ebookPrice", rs.getInt("ebookPrice"));
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, rs);
		}
		return list;
	}
	
	
	public List<Map<String, Object>> selectOrdersListByClient(int clientNo){
		List<Map<String, Object>> list = new ArrayList<>();
		this.dbUtil = new DBUtil();		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn=this.dbUtil.getConnectioin();
			String sql = "SELECT o.orders_no ordersNo, o.ebook_no ebookNo, o.orders_date ordersDate, o.orders_state ordersState, e.ebook_title ebookTitle, e.ebook_price ebookPrice FROM orders o INNER JOIN ebook e ON o.ebook_no=e.ebook_no WHERE o.client_no=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, clientNo);
			System.out.println(stmt+"주문리스트");
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> map = new HashMap<>();
				map.put("ordersNo", rs.getInt("ordersNo"));
				map.put("ebookNo", rs.getInt("ebookNo"));
				map.put("ordersDate", rs.getString("ordersDate"));
				map.put("ordersState", rs.getString("ordersState"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("ebookPrice", rs.getInt("ebookPrice"));
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, rs);
		}
		return list;
	}
	
	public void insertOrders(Orders orders) {
		this.dbUtil = new DBUtil();		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "INSERT INTO orders(ebook_no, client_no, orders_date, orders_state) VALUES(?,?,NOW(),'주문완료') ";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, orders.getEbookNo());
			stmt.setInt(2, orders.getClientNo());
			System.out.println(stmt+"주문메서드");
			stmt.executeUpdate();
			
		}catch(Exception e) {
			//예외 발생시 시스템을 멈추고 함수호출스택구조를 콘솔 출력하겠다.
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, null);
		}
	}
}
