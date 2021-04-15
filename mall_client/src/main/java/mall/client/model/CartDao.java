package mall.client.model;

import java.util.*;
import java.sql.*;
import mall.client.commons.DBUtil;
import mall.client.vo.*;

public class CartDao {
	private DBUtil dbUtil;
	//장바구니 화면 삭제 메서드
	public void deleteCart(int cartNo) {
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "DELETE FROM cart WHERE cart_no=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, cartNo);
			System.out.println(stmt+"장바구니 화면 삭제 메서드");
			stmt.executeUpdate();			
		}catch(Exception e) {
				
		}finally {
			this.dbUtil.close(conn, stmt, null); // 작업후 db자원을 반환한다.
		}
	}
	
	//회원 탈퇴 시 장바구니 삭제 메서드
	public void deleteCartAll(String clientMail) {
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
	
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "DELETE FROM cart WHERE client_email=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			System.out.println(stmt+"장바구니 삭제 메서드");
			stmt.executeUpdate();			
		}catch(Exception e) {
			
		}finally {
			this.dbUtil.close(conn, stmt, null); // 작업후 db자원을 반환한다.
		}
	}
	
	public boolean selectClientMail(Cart cart) {	
		boolean flag = true;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
	
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "SELECT cart_no cartNo FROM cart WHERE client_email=? AND ebook_no=?"; // 중복검사를 위해 받아온파라미터(이메일)과 db의 email정보들과 비교 값이 나오면 중복
			stmt = conn.prepareStatement(sql);			
			stmt.setString(1, cart.getClientMail());
			stmt.setInt(2, cart.getEbookNo());
			System.out.println(stmt+"장바구니 중복 검사");
			rs = stmt.executeQuery();
	
			if(rs.next()) {
				flag = false; // 중복이 있다
			}
	
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			this.dbUtil.close(conn, stmt, rs);// 작업후 db자원을 반환한다.
		}
	
		return flag;
	}
	
	
	// 장바구니 추가 메서드
	public void insertCart(Cart cart) {
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "INSERT INTO cart(client_email, ebook_no, cart_date) VALUES(?,?, now())";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, cart.getClientMail());
			stmt.setInt(2, cart.getEbookNo());
			System.out.println(stmt+"카트추가 메서드");
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace(); // 오류가 발생한다면 콘솔창에 출력
		}finally {
			this.dbUtil.close(conn, stmt, null); // 모든 과정이 끝난 후 conn, stmt, rs를 초기화 해준다.
		}
	}
	public List<Map<String, Object>> selectCartList(String clientMail){	
		this.dbUtil = new DBUtil();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(); // Map타입의 원소를 가진 list 변수와 공간 생성
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "SELECT c.cart_no cartNo, e.ebook_no ebookNo, e.ebook_title ebookTitle, c.cart_date cartDate FROM cart c INNER JOIN ebook e ON c.ebook_no = e.ebook_no WHERE c.client_email=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			System.out.println(stmt+"카트");
			rs = stmt.executeQuery();
			while(rs.next()) { // rs에 값이있다면 그 값들을 map에 index와 값들에 맞게 저장
				Map<String, Object> map = new HashMap<>();
				map.put("cartNo", rs.getInt("cartNo"));
				map.put("ebookNo", rs.getInt("ebookno"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("cartDate", rs.getString("cartDate"));
				list.add(map);
			}
		}catch(Exception e) { 
			e.printStackTrace(); // 오류가 발생한다면 콘솔창에 출력
		}finally {
			this.dbUtil.close(conn, stmt, rs); // 모든 과정이 끝난 후 conn, stmt, rs를 초기화 해준다.
		}		
		return list;
	}
}
