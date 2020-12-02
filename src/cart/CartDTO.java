package cart;

public class CartDTO {
	
	private int cartID;
	private String userID;
	private int productID;
	private int cartCount;
	private int cartPrice;
	private int cartTotalPrice;
	public int getCartID() {
		return cartID;
	}
	public void setCartID(int cartID) {
		this.cartID = cartID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getCartCount() {
		return cartCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	public int getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(int cartPrice) {
		this.cartPrice = cartPrice;
	}
	public int getCartTotalPrice() {
		return cartTotalPrice;
	}
	public void setCartTotalPrice(int cartTotalPrice) {
		this.cartTotalPrice = cartTotalPrice;
	}
	
	public CartDTO() {}
		
	public CartDTO(int cartID, String userID, int productID, int cartCount, int cartPrice, int cartTotalPrice) {
		super();
		this.cartID = cartID;
		this.userID = userID;
		this.productID = productID;
		this.cartCount = cartCount;
		this.cartPrice = cartPrice;
		this.cartTotalPrice = cartTotalPrice;
	}
	   
}
