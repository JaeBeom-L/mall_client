package mall.client.model;

import java.sql.*;
import mall.client.vo.*;
import java.util.*;
import mall.client.commons.DBUtil;


public class EbookDao {
	// db연결 클래스 초기화
	private DBUtil dbutil;
	// ebook list 출력 메서드
	public List<Ebook> selectEbookListByPage(int beginRow, int rowPerPage){
		// try catch문 안에 변수를 사용해야하므로 필요한 변수들을 초기화 해준다.
		List<Ebook> list = new ArrayList<>();
		this.dbutil = new DBUtil();		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbutil.getConnectioin();
			String sql = "SELECT ebook_title ebookTitle, ebook_price ebookPrice, ebook_img ebookImg FROM ebook ORDER BY ebook_date DESC LIMIT ?,?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			rs = stmt.executeQuery();
			while(rs.next()) {
				Ebook ebook = new Ebook();
				ebook.setEbookTitle(rs.getString("ebookTitle"));
				ebook.setEbookPrice(rs.getInt("ebookPrice"));
				ebook.setEbookImg(rs.getString("ebookImg"));
				list.add(ebook);
			}
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {// try문에도 입력하고 catch문에도 공통으로 입력해야하는 부분을 finally 블럭에 선언 db자원들을 해제한다.
			dbutil.close(conn, stmt, rs);
		}
				
		return list;		
	}
}
