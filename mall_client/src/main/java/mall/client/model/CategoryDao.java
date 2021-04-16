package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mall.client.commons.DBUtil;

public class CategoryDao {
	// db연결 클래스 초기화
	private DBUtil dbUtil;
	
	//카테고리 출력 메서드
	public List<String> categoryNameList(){
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<>();
		try {
			String sql = "SELECT category_name categoryName FROM category";
			conn = this.dbUtil.getConnectioin();
			stmt = conn.prepareStatement(sql);
			System.out.println(stmt+"카테고리 출력 메서드");
			rs = stmt.executeQuery();
			while(rs.next()) {
				String cn = new String();
				cn = rs.getString("categoryName");
				list.add(cn);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, rs);
		}
		return list;
	}
}
