package product;

import java.sql.Blob;

public class ProductDTO {
	
	private int productID;
	private String productCategory;
	private String productType;
	private String productBrand;
	private String productName;
	private String productExplanation;
	private String productImg;
	private int productPrice ;
	private int productInventory;
	
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductExplanation() {
		return productExplanation;
	}
	public void setProductExplanation(String productExplanation) {
		this.productExplanation = productExplanation;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductInventory() {
		return productInventory;
	}
	public void setProductInventory(int productInventory) {
		this.productInventory = productInventory;
	}
	
	public ProductDTO() { 
	}
	
	public ProductDTO(int productID, String productCategory, String productType, String productBrand,
			String productName, String productExplanation, String productImg, int productPrice,
			int productInventory) {
		super();
		this.productID = productID;
		this.productCategory = productCategory;
		this.productType = productType;
		this.productBrand = productBrand;
		this.productName = productName;
		this.productExplanation = productExplanation;
		this.productImg = productImg;
		this.productPrice = productPrice;
		this.productInventory = productInventory;
	}
	
}
