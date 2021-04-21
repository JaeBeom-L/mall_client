package mall.client.vo;

public class Stats {
	private String stats_day;
	private long stats_count;
	@Override
	public String toString() {
		return "Stats [stats_day=" + stats_day + ", stats_count=" + stats_count + "]";
	}
	public String getStats_day() {
		return stats_day;
	}
	public void setStats_day(String stats_day) {
		this.stats_day = stats_day;
	}
	public long getStats_count() {
		return stats_count;
	}
	public void setStats_count(long stats_count) {
		this.stats_count = stats_count;
	}
}
