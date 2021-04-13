package mall.client.vo;

public class Cart {
	private int cartNo;
	private String clientEmail;
	private int ebookNo;
	private String cartDate;
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public String getClientEmail() {
		return clientEmail;
	}
	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}
	public int getEbookNo() {
		return ebookNo;
	}
	public void setEbookNo(int ebookNo) {
		this.ebookNo = ebookNo;
	}
	public String getCartDate() {
		return cartDate;
	}
	public void setCartDate(String cartDate) {
		this.cartDate = cartDate;
	}
	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", clientEmail=" + clientEmail + ", ebookNo=" + ebookNo + ", cartDate="
				+ cartDate + "]";
	}
	
}
