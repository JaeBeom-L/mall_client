package mall.client.model;

import java.sql.*;
import mall.client.vo.*;
import java.util.*;
import mall.client.commons.DBUtil;


public class EbookDao {	
	// db연결 클래스 초기화
	private DBUtil dbUtil;
	
	public List<Map<String, Object>> selectEbookListByDay(int year, int month){
		List<Map<String, Object>> list = new ArrayList<>();
		this.dbUtil = new DBUtil();		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, day(ebook_date) d FROM ebook WHERE YEAR(ebook_date) = ? AND MONTH(ebook_date)=? ORDER BY day(ebook_date) ASC";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, year);
			stmt.setInt(2, month);
			
			System.out.println(stmt+"월별 EBOOK 출력");
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map map = new HashMap<>();
				map.put("ebookNo", rs.getInt("ebookNo"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("d", rs.getInt("d"));
				list.add(map);
			}
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {// try문에도 입력하고 catch문에도 공통으로 입력해야하는 부분을 finally 블럭에 선언 db자원들을 해제한다.
			dbUtil.close(conn, stmt, rs);
		}
				
		return list;		
	}
	// db총 ebook 자료 수 구하는 메서드
	public int totalRow(String categoryName, String searchWord) {
		int totalRow = 0;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnectioin();
			if(categoryName == null & searchWord == null) { // 전체보기
				String sql = "SELECT COUNT(*) FROM ebook";
				stmt = conn.prepareStatement(sql);
			}else if(searchWord == null){// 카테고리 선택 시
				String sql = "SELECT COUNT(*) FROM ebook WHERE category_name=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, categoryName);
			}else {// 검색단어를 찾을 때
				String sql = "SELECT COUNT(*) FROM ebook WHERE ebook_title LIKE ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%"+searchWord+"%");
			}
			System.out.println(stmt+"ebook자료수");
			rs = stmt.executeQuery();
			if(rs.next()) {
				totalRow = rs.getInt("COUNT(*)");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(conn, stmt, rs);
		}		
		return totalRow;
	}
	
	// 책정보출력 메서드
	public Ebook selectEbookOne(int ebookNo) {
		Ebook ebook = null;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "SELECT ebook_no ebookNo, ebook_isbn ebookISBN, category_name categoryName, ebook_title ebookTitle, ebook_author ebookAuthor, ebook_company ebookCompany, ebook_page_count ebookPageCount, ebook_price ebookPrice, ebook_img ebookImg, ebook_summary ebookSummary, ebook_date ebookDate, ebook_state ebookState FROM ebook WHERE ebook_no=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, ebookNo);
			rs = stmt.executeQuery();
			if(rs.next()) {
				ebook = new Ebook();
				ebook.setEbookNo(rs.getInt("ebookNo"));
				ebook.setEbookISBN(rs.getString("ebookISBN"));
				ebook.setCategoryName(rs.getString("categoryName"));
				ebook.setEbookTitle(rs.getString("ebookTitle"));
				ebook.setEbookAuthor(rs.getString("ebookAuthor"));
				ebook.setEbookCompany(rs.getString("ebookCompany"));
				ebook.setEbookPageCount(rs.getInt("ebookPageCount"));
				ebook.setEbookPrice(rs.getInt("ebookPrice"));
				ebook.setEbookSummary(rs.getString("ebookSummary"));
				ebook.setEbookImg(rs.getString("ebookImg"));
				ebook.setEbookDate(rs.getString("ebookDate"));
				ebook.setEbookState(rs.getString("ebookState"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(conn, stmt, rs);
		}		
		return ebook;
	}
	
	
	// ebook list 출력 메서드
	public List<Ebook> selectEbookListByPage(int beginRow, int rowPerPage, String categoryName, String searchWord){
		// try catch문 안에 변수를 사용해야하므로 필요한 변수들을 초기화 해준다.
		List<Ebook> list = new ArrayList<>();
		this.dbUtil = new DBUtil();		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnectioin();
			if(categoryName == null & searchWord == null) {
				String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_price ebookPrice, ebook_img ebookImg FROM ebook ORDER BY ebook_date DESC LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, beginRow);
				stmt.setInt(2, rowPerPage);
			}else if(searchWord == null){
				String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_price ebookPrice, ebook_img ebookImg FROM ebook WHERE category_name=? ORDER BY ebook_date DESC LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, categoryName);
				stmt.setInt(2, beginRow);
				stmt.setInt(3, rowPerPage);
			}else {
				String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_price ebookPrice, ebook_img ebookImg FROM ebook WHERE ebook_title LIKE ? ORDER BY ebook_date DESC LIMIT ?,?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, "%"+searchWord+"%");
				stmt.setInt(2, beginRow);
				stmt.setInt(3, rowPerPage);
			}
			System.out.println(stmt+"ebookList출력");
			rs = stmt.executeQuery();
			while(rs.next()) {
				Ebook ebook = new Ebook();
				ebook.setEbookNo(rs.getInt("ebookNo"));
				ebook.setEbookTitle(rs.getString("ebookTitle"));
				ebook.setEbookPrice(rs.getInt("ebookPrice"));
				ebook.setEbookImg(rs.getString("ebookImg"));
				list.add(ebook);
			}
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {// try문에도 입력하고 catch문에도 공통으로 입력해야하는 부분을 finally 블럭에 선언 db자원들을 해제한다.
			dbUtil.close(conn, stmt, rs);
		}
				
		return list;		
	}
}
