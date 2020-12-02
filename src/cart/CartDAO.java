package cart;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cart.CartDTO;
import product.ProductDTO;
import util.DatabaseUtil;

public class CartDAO {
	//��ٱ��� ���
	public int cartRegister(CartDTO cart) {
		String SQL = "INSERT INTO CART VALUES (0, ?, ?, ?, ?, ?)"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
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
		}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		} 
		return -1; //��� ����
	}
	
	//�˻����� ��ȯ
	public ArrayList<CartProductDTO> getList (String userID){
		
		ArrayList<CartProductDTO> cartList = null;
		String SQL = ""; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
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
						rs.getString(8) //�ڷ����� �߸��ᵵ ��ü�� �������� �����Ұ�! 
				);
				cartList.add(evaluation);
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return cartList;
	}
	
	//��ǰ �󼼳���
	public int cartDelete(int cartID) {
		String SQL = ""; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
		try {
			SQL = "delete from cart where cartID = ?"; 
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, cartID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	
}
