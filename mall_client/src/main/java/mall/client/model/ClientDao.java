package mall.client.model;
import java.sql.*;
import mall.client.commons.DBUtil;
import mall.client.vo.Client;


public class ClientDao {
	private DBUtil dbutil;
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
