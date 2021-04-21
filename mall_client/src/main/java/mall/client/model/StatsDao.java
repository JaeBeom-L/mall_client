package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mall.client.commons.DBUtil;
import mall.client.vo.Stats;

public class StatsDao {
	private DBUtil dbUtil;
	public Stats selectStatsByToday() {
		//SELECT stats_day statsDay, stats_count statsCount FROM stats WHERE stats_day=date(NOW())
		Stats stats = new Stats();
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "SELECT stats_day statsDay, stats_count statsCount FROM stats WHERE stats_day=date(NOW())";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				stats.setStats_day(rs.getString("statsDay"));
				stats.setStats_count(rs.getLong("statsCount"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, rs);
		}
		return stats;
	}
	
	public void insertStats() {
		// INSERT INTO stats(stats_day, stats_count) VALUES(NOW(),1)
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "INSERT INTO stats(stats_day, stats_count) VALUES(date(NOW()),1)";
			stmt = conn.prepareStatement(sql);
			System.out.println(stmt+"insertStats");
			stmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, null);
		}
	}
	
	public void updateStats() {
		// UPDATE stats SET stats_count = stats_count +1 WHERE stats_day=date(NOW())
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "UPDATE stats SET stats_count = stats_count +1 WHERE stats_day = DATE(NOW())";
			stmt = conn.prepareStatement(sql);
			System.out.println(stmt+"updateStats");
			stmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, null);
		}
	}
	
	public long selectStatsTotal() {
		// SELECT SUM(stats_count) FROM stats
		long total = 0;
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnectioin();
			String sql = "SELECT SUM(stats_count) FROM stats";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				total=rs.getLong("SUM(stats_count)");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			this.dbUtil.close(conn, stmt, rs);
		}
		return total;
	}
}
