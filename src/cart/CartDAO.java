package cart;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cart.CartDTO;
import product.ProductDTO;
import util.DatabaseUtil;

public class CartDAO {
	//장바구니 등록
	public int cartRegister(CartDTO cart) {
		String SQL = "INSERT INTO CART VALUES (0, ?, ?, ?, ?, ?)"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, cart.getUserID());
			pstmt.setInt(2, cart.getProductID()); 
			pstmt.setInt(3, cart.getCartCount()); 
			pstmt.setInt(4, cart.getCartPrice()); 
			pstmt.setInt(5, cart.getCartTotalPrice());  
			return pstmt.executeUpdate(); 
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		} 
		return -1; //등록 실패
	}
	
	//검색내용 반환
	public ArrayList<CartProductDTO> getList (String userID){
		
		ArrayList<CartProductDTO> cartList = null;
		String SQL = ""; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			SQL = "select cart.*, pro.productName, pro.productImg FROM product pro, cart cart WHERE pro.productID = cart.productID and userID = ? order by cartID desc;";  
			
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); 
			rs = pstmt.executeQuery();
			cartList = new ArrayList<CartProductDTO>();
			while(rs.next()) {
				CartProductDTO evaluation = new CartProductDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getInt(3),
						rs.getInt(4),						
						rs.getInt(5),
						rs.getInt(6),
						rs.getString(7),
						rs.getString(8) //자료형만 잘못써도 전체가 에러나니 조심할것! 
				);
				cartList.add(evaluation);
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return cartList;
	}
	
	//상품 상세내용
	public int cartDelete(int cartID) {
		String SQL = ""; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			SQL = "delete from cart where cartID = ?"; 
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, cartID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	
}
