package DAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import java.sql.ResultSet;

import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;


import DTO.Login;

public class Log_DAO {
	

	Connection conn = null;
	
	String url = "jdbc:mysql://localhost:3306/laeazyhome2";
	String user = "root";
	String pass = "1234";
	
	//DB연결
	
	private Connection openConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = (Connection)DriverManager.getConnection(url,user,pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//DB연결해제
	
	private void closeConnection() {
		try {
			if(conn != null) {
				conn.close();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 로그인시 아이디 , 비밀번호 체크

	public Login getLogin(String id, String pass) {
		Login member = new Login();
		PreparedStatement pstm = null;
		String query = "select id,pwd,name from users where id = ?;";

		
		openConnection();
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, id);
			
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
			
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setName(rs.getString("name"));
			
			}
			rs.close();
		}catch (NullPointerException e) {
			System.out.println("<script>alert('아이디가 틀렸습니다. 다시 입력해주세요');document.location.href=\"./loginPage.jsp\";</script>");
		}catch (Exception e) {
				e.printStackTrace();
		}
		finally {
			closeConnection();
		}
		return member;
	}
	
	//회원가입 체크
	
	public boolean User_Insert(String id, String pwd, String name, String phone,String email,String post_code,String address) {
		PreparedStatement pstm = null;
		String query = "insert into users values(?,?,?,?,?,?,?,1,now());";
		
		openConnection();
		int count = 0;
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, id);
			pstm.setString(2, pwd);
			pstm.setString(3, name);
			pstm.setString(4, email);
			pstm.setString(5, post_code);
			pstm.setString(6, address);
			pstm.setString(7, phone);
			
			count = pstm.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return count > 0 ? true : false;
		
	}
	
	//회원정보 가져오기
	
	public Login getUser_info(String id) {
		Login member = new Login();
		PreparedStatement pstm = null;
		String query = "select * from users where id = ?";
		
		openConnection();
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, id);
			
			ResultSet rs = pstm.executeQuery();
			while(rs.next()) {
				member.setId(rs.getString("id"));
				member.setPwd(rs.getString("pwd"));
				member.setName(rs.getString("name"));
				member.setPost_code(rs.getString("post_code"));
				member.setAddress(rs.getString("address"));
				member.setRegdate(rs.getTimestamp("regdate"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));

			}
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return member;
	}
	
	
	//회원정보 수정
	
	public boolean UpdateUser_info(String pwd, String phone,String post_code,String address,String email, String id) {

		PreparedStatement pstm = null;
		String query = "update users set pwd = ?, email = ?, post_code = ?, address =?, phone = ? where id = ? ";
		
		openConnection();
		int count = 0;
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, pwd);
			pstm.setString(2, email);
			pstm.setString(3, post_code);
			pstm.setString(4, address);
			pstm.setString(5, phone);
			pstm.setString(6, id);
			
			count = pstm.executeUpdate();

		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return count > 0 ? true : false;
	}
	
	// 아이디 중복확인
	
	public int checkID(String id) {
		int cnt = 0;
		PreparedStatement pstm = null;
		String query = "select count(id) as cnt from users where id = ?";
		openConnection();
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, id);
			
			ResultSet rs = pstm.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return cnt;
	}
	
}
