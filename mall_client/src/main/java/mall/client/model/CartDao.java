package mall.client.model;

import java.util.*;
import java.sql.*;
import mall.client.commons.DBUtil;
import mall.client.vo.*;

public class CartDao {
	private DBUtil dbUtil;
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
			if(rs.next()) { // rs에 값이있다면 그 값들을 map에 index와 값들에 맞게 저장
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
