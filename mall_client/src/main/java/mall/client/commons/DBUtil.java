package mall.client.commons;
import java.sql.*;

public class DBUtil {
	//1. db연결
	public Connection getConnectioin() {
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mall","root","java1004");
			return conn;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	//2. db자원(connection, statement, resultset) 해제 (나중에 생성된 순서부터 먼저 삭제) null이 아닐떄
	public void close(Connection conn, PreparedStatement stmt, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		
		if(conn != null) {
			try {
				conn.close();
			} catch (Exception e) {			
				e.printStackTrace();
			}
		}
	}
}
