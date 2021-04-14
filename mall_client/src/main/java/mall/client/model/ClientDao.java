package mall.client.model;
import java.sql.*;
import mall.client.commons.DBUtil;
import mall.client.vo.Client;


public class ClientDao {
	private DBUtil dbutil;
	
	// 고객 정보 출력 메서드
	public Client clientOne(String clientMail) {
		this.dbutil = new DBUtil();
		Client client = new Client();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbutil.getConnectioin();
			String sql = "SELECT client_no clientNo, client_email clientMail, client_date clientDate FROM client WHERE client_email = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			System.out.println(stmt+"고객 정보 출력 메서드");//디버깅코드
			rs = stmt.executeQuery();
			if(rs.next()) {
				client.setClientNo(rs.getInt("clientNo"));
				client.setClientEmail(rs.getString("clientMail"));
				client.setClientDate(rs.getString("clientDate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbutil.close(conn, stmt, null);
		}
		
		return client;
		
	}
	
	//회원가입 메서드
	public void insertClient(Client client) {
		this.dbutil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = this.dbutil.getConnectioin();
			String sql = "INSERT INTO client(client_email, client_pw, client_date) VALUES(?,PASSWORD(?),NOW())";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientEmail());
			stmt.setString(2, client.getClientPw());
			System.out.println(stmt+"회원가입");
			stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbutil.close(conn, stmt, null);
		}	
	}
	
	//이메일 중복검사 메서드
	public String selectClientMail(String clientMail) {
		this.dbutil = new DBUtil();
		String returnClientMail = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = this.dbutil.getConnectioin();
			String sql = "SELECT client_email FROM client WHERE client_email=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			rs = stmt.executeQuery();

			if(rs.next()) {
				returnClientMail = rs.getString("client_email");
			}

		} catch(Exception e){
			e.printStackTrace();
		} finally {
			this.dbutil.close(conn, stmt, rs);
		}

		return returnClientMail;
	}
	
	//로그인 메서드
	public Client login(Client client) {
		this.dbutil = new DBUtil();
		Client returnClient = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbutil.getConnectioin();
			String sql = "SELECT client_email clientMail FROM client WHERE client_email=? AND client_pw=PASSWORD(?)";// 이메일(유니크)과 패스워드에 맞는 정보 출력
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,client.getClientEmail());
			stmt.setString(2, client.getClientPw());
			System.out.println(stmt+"로그인");
			rs = stmt.executeQuery();
			if(rs.next()) {
				returnClient = new Client();
				returnClient.setClientEmail(rs.getString("clientMail"));
			}
		}catch(Exception e){
			e.printStackTrace();// 예외 발생시 콘솔에 오류 출력
		}finally {
			this.dbutil.close(conn, stmt, rs);// 작업 완료 후 초기화
		}
		return returnClient;
	}
}
