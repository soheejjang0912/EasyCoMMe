package review;

public class ReviewDTO {
	private int reviewID;
	private int productID;
	private String userID;
	private String contents;
	private String date;
	
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	public ReviewDTO() {}
	
	public ReviewDTO(int reviewID, int productID, String userID, String contents, String date) {
		super();
		this.reviewID = reviewID;
		this.productID = productID;
		this.userID = userID;
		this.contents = contents;
		this.date = date;
	}
		
}
