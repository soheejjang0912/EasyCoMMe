package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import product.ProductDTO;
import util.DatabaseUtil;

public class ReviewDAO {
	
	//리뷰등록
	public int register(ReviewDTO review) {
		String SQL = "INSERT INTO review VALUES (0, ?, ?, ?, now())"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, review.getProductID());
			pstmt.setString(2, review.getUserID());
			pstmt.setString(3, review.getContents());   
			return pstmt.executeUpdate(); 
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		} 
		return -1; //실패
	}
	
	//검색내용 반환
	public ArrayList<ReviewDTO> getReviewList (int productID){
		
		ArrayList<ReviewDTO> reviewtList = null;
		String SQL = ""; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //특정한 문장을 실행한 이후에 나온 결과값 처리하기 위함
		try {
			SQL = "SELECT * FROM REVIEW WHERE productID = ? order by reviewDate desc;"; 
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);  
			pstmt.setInt(1, productID);
			rs = pstmt.executeQuery();
			reviewtList = new ArrayList<ReviewDTO>();
			while(rs.next()) {
				ReviewDTO reviewDetail = new ReviewDTO(						
						rs.getInt(1),
						rs.getInt(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5)
				);
				reviewtList.add(reviewDetail);
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //데베 접근 이후에는 접근한 자원들을 전부 해제함으로서 서버에 무리가 되지 않게 해주어야함
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return reviewtList;
	}
}
