package mall.client.model;
import java.sql.*;
import mall.client.commons.DBUtil;
import mall.client.vo.Client;


public class ClientDao {
	private DBUtil dbUtil;
	//회원 비번 수정 메서드
	public void updateClientPassword(Client client) {
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "UPDATE client SET client_pw=PASSWORD(?) WHERE client_email=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientPw());
			stmt.setString(2, client.getClientMail());
			System.out.println(stmt+"회원비번수정메서드");
			stmt.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, null); // 작업후 db자원을 반환한다.
		}
	}
	
	
	// 회원 탈퇴 메서드
	public void deleteClient(String clientMail) {
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
	
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "DELETE FROM client WHERE client_email=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			System.out.println(stmt+"회원탈퇴메서드");
			stmt.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, null); // 작업후 db자원을 반환한다.
		}
	}
	
	// 고객 정보 출력 메서드
	public Client selectClientOne(String clientMail) {
		this.dbUtil = new DBUtil();
		Client client = new Client();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "SELECT client_no clientNo, client_email clientMail, client_date clientDate FROM client WHERE client_email = ?"; // 이메일에 맞는 고객정보를 검색하는 쿼리
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			System.out.println(stmt+"고객 정보 출력 메서드");//디버깅코드
			rs = stmt.executeQuery();
			if(rs.next()) {
				client.setClientNo(rs.getInt("clientNo"));
				client.setClientMail(rs.getString("clientMail"));
				client.setClientDate(rs.getString("clientDate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, rs); // 작업후 db자원을 반환한다.
		}
		
		return client;
		
	}
	
	//회원가입 메서드
	public void insertClient(Client client) {
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "INSERT INTO client(client_email, client_pw, client_date) VALUES(?,PASSWORD(?),NOW())"; // 회원가입 db에 고객 정보를 등록하는 쿼리
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientMail());
			stmt.setString(2, client.getClientPw());
			System.out.println(stmt+"회원가입");
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, null); // 작업후 db자원을 반환한다.
		}	
	}
	
	//이메일 중복검사 메서드
	public String selectClientMail(String clientMail) {
		this.dbUtil = new DBUtil();
		String returnClientMail = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "SELECT client_email FROM client WHERE client_email=?"; // 중복검사를 위해 받아온파라미터(이메일)과 db의 email정보들과 비교 값이 나오면 중복
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			rs = stmt.executeQuery();

			if(rs.next()) {
				returnClientMail = rs.getString("client_email");
			}

		} catch(Exception e){
			e.printStackTrace();
		} finally {
			this.dbUtil.close(conn, stmt, rs);// 작업후 db자원을 반환한다.
		}

		return returnClientMail;
	}
	
	//로그인 메서드
	public Client login(Client client) {
		this.dbUtil = new DBUtil();
		Client returnClient = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "SELECT client_no clientNo, client_email clientMail FROM client WHERE client_email=? AND client_pw=PASSWORD(?)";// 이메일(유니크)과 패스워드에 맞는 정보 출력
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,client.getClientMail());
			stmt.setString(2, client.getClientPw());
			System.out.println(stmt+"로그인");
			rs = stmt.executeQuery();
			if(rs.next()) {
				returnClient = new Client();
				returnClient.setClientMail(rs.getString("clientMail"));
				returnClient.setClientNo(rs.getInt("clientNo"));
			}
		}catch(Exception e){
			e.printStackTrace();// 예외 발생시 콘솔에 오류 출력
		}finally {
			this.dbUtil.close(conn, stmt, rs);// 작업 완료 후 초기화
		}
		return returnClient;
	}
}
