package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class ProductDAO {
	
	//상품등록
	public int productRegister(ProductDTO prod) {
		String SQL = "INSERT INTO PRODUCT VALUES (0,?, ?, ?, ?, ?, ?, ?, ?)"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, prod.getProductCategory());
			pstmt.setString(2, prod.getProductType());
			pstmt.setString(3, prod.getProductBrand());
			pstmt.setString(4, prod.getProductName());
			pstmt.setString(5, prod.getProductExplanation());
			pstmt.setString(6, prod.getProductImg());
			pstmt.setInt(7, prod.getProductPrice());
			pstmt.setInt(8, prod.getProductInventory());  
			return pstmt.executeUpdate(); 
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		} 
		return -1; //회원가입 실패
	}
	
	//검색내용 반환
	public ArrayList<ProductDTO> getList (){
		
		ArrayList<ProductDTO> productList = null;
		String SQL = ""; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			SQL = "SELECT * FROM PRODUCT order by productID desc;"; 
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); 
			rs = pstmt.executeQuery();
			productList = new ArrayList<ProductDTO>();
			while(rs.next()) {
				ProductDTO productDetail = new ProductDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getInt(8),
						rs.getInt(9) //자료형만 잘못써도 전체가 에러나니 조심할것! 
				);
				productList.add(productDetail);
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return productList;
	}
	
	//카테고리별 검색내용 반환
	public ArrayList<ProductDTO> getCategoryList (String productType){
		
		ArrayList<ProductDTO> productList = null;
		String SQL = ""; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		try { 
			SQL = "SELECT * FROM PRODUCT WHERE productType = ? order by productID desc;"; 
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, productType);
			rs = pstmt.executeQuery();  
			productList = new ArrayList<ProductDTO>();
			while(rs.next()) {
				ProductDTO productDetail = new ProductDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getInt(8),
						rs.getInt(9) //자료형만 잘못써도 전체가 에러나니 조심할것! 
				);
				productList.add(productDetail);
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return productList;
	}
		
	//상품 상세내용
	public ProductDTO productDetail(int productID) {
		String SQL = ""; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			SQL = "SELECT * FROM PRODUCT WHERE productID = ?"; 
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, productID);
			rs = pstmt.executeQuery(); 
			if(rs.next()) { 
				ProductDTO prod = new ProductDTO(); 
					prod.setProductID(rs.getInt(1)); 
					prod.setProductCategory(rs.getString(2)); 
					prod.setProductType(rs.getString(3)); 
					prod.setProductBrand(rs.getString(4)); 
					prod.setProductName(rs.getString(5)); 
					prod.setProductExplanation(rs.getString(6)); 
					prod.setProductImg(rs.getString(7)); 
					prod.setProductPrice(rs.getInt(8)); 
					prod.setProductInventory(rs.getInt(9));  
					return prod; 
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return null;
	}
	
}
