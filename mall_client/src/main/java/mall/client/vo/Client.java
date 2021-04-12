package mall.client.vo;

public class Client {
	private int clientNo;
	private String clientEmail;
	private String clientPw;
	private String clientDate;
	
	public int getClientNo() {
		return clientNo;
	}
	public void setClientNo(int clientNo) {
		this.clientNo = clientNo;
	}
	public String getClientEmail() {
		return clientEmail;
	}
	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}
	public String getClientPw() {
		return clientPw;
	}
	public void setClientPw(String clientPw) {
		this.clientPw = clientPw;
	}
	public String getClientDate() {
		return clientDate;
	}
	public void setClientDate(String clientDate) {
		this.clientDate = clientDate;
	}
	@Override
	public String toString() {
		return "Client [clientNo=" + clientNo + ", clientEmail=" + clientEmail + ", clientPw=" + clientPw
				+ ", clientDate=" + clientDate + "]";
	}
	
}
