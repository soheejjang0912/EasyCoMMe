package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	
	//�α���
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).contentEquals(userPassword)) {
					return 1;	//�α��� ����
				}
				else {
					return 0;	//��� Ʋ��
				} 
			}return -1; 		//���̵� ����
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return -2;	//������ ���̽� ����
	}

	//ȸ������
	public int join(UserDTO user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, false, ?, ?, ?, ?, ?)"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserEmailHash());
			pstmt.setString(5, user.getUserAdress());
			pstmt.setString(6, user.getUserPhone()); 
			pstmt.setString(7, user.getUserGender());
			pstmt.setString(8, user.getUserBirthday());
			pstmt.setString(9, user.getUserType());
			return pstmt.executeUpdate(); 
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		} 
		return -1; //ȸ������ ����
	}
	
	//ȸ������
	public int update(UserDTO user) {
		String SQL = "UPDATE USER SET userPassword = ?, userEmail = ?, userAdress = ?, userPhone = ?, userGender = ?, userBirthday = ?, userType = ? WHERE userID = ?"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserPassword());
			pstmt.setString(2, user.getUserEmail()); 
			pstmt.setString(3, user.getUserAdress());
			pstmt.setString(4, user.getUserPhone()); 
			pstmt.setString(5, user.getUserGender());
			pstmt.setString(6, user.getUserBirthday());
			pstmt.setString(7, user.getUserType());
			pstmt.setString(8, user.getUserID());
			return pstmt.executeUpdate(); 
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		} 
		return -1; //ȸ������ ����
	}
	
	
	//Ư�� ȸ���� �̸��� ��ü�� ��ȯ���ִ� �Լ�
	public String getUserEmail(String userID) {
		String SQL = "SELECT userEmail FROM USER WHERE userID = ?"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return null; //�����ͺ��̽� ����
	}
	
	
	//�̸��� ����	
	public boolean getUserEmailChecked(String userID) {
		String SQL = "SELECT userEmailChecked FROM USER WHERE userID = ?"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getBoolean(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return false;
	}
	
	
	//�̸��� ���� ���ִ� �Լ�	
	public boolean setUserEmailChecked(String userID) {
		String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID = ?"; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //Ư���� ������ ������ ���Ŀ� ���� ����� ó���ϱ� ����
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
			try{if(conn != null)conn.close();}catch (Exception e) {e.printStackTrace();}
			try{if(pstmt != null)pstmt.close();}catch (Exception e) {e.printStackTrace();}
			try{if(rs != null)rs.close();}catch (Exception e) {e.printStackTrace();}
		}
		return false; 
	}
	
	//����Ÿ�� ���� 
	public String getType(String userID) { 
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			SQL = "SELECT userType FROM USER WHERE userID = ?";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); 
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return null;	//������ ���̽� ����
	}	
	
	//�ش� �������� ��������
	public UserDTO getUser(String userID) { 
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			SQL = "SELECT * FROM USER WHERE userID = ?";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); 
			if(rs.next()) {
				UserDTO user = new UserDTO();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserEmail(rs.getNString(3));
				user.setUserEmailHash(rs.getNString(4));
				user.setUserEmailChecked(rs.getBoolean(5));
				user.setUserAdress(rs.getNString(6));
				user.setUserPhone(rs.getNString(7));
				user.setUserGender(rs.getNString(8));
				user.setUserBirthday(rs.getNString(9));
				user.setUserType(rs.getNString(10));
				return user;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally { //���� ���� ���Ŀ��� ������ �ڿ����� ���� ���������μ� ������ ������ ���� �ʰ� ���־����
			try{if(conn != null) conn.close();} catch(Exception e) {e.printStackTrace();}
			try{if(pstmt != null) pstmt.close();} catch(Exception e) {e.printStackTrace();}
			try{if(rs != null) rs.close();} catch(Exception e) {e.printStackTrace();}
		}
		return null;	//������ ���̽� ����
	}
	 
	
}
