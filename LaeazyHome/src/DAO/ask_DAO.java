package DAO;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import DTO.ask;

public class ask_DAO {

	
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
	
	//문의 insert
	
	public boolean ask_Insert(String id, int ask_category, String ask_title, String ask_content) {
		
		PreparedStatement pstm = null;
		String query = "insert into questions(users_id,q_cate_num,q_title,q_content,q_regdate) values(?,?,?,?,now());";
		
		openConnection();
		int count = 0;
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, id);
			pstm.setInt(2, ask_category);
			pstm.setString(3, ask_title);
			pstm.setString(4, ask_content);
			
			count = pstm.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
				
		return count > 0 ? true : false;
	}
	
	//문의 내역 가져오기
	public ArrayList<ask> getAskList(String id){
	ArrayList<ask> datas = new ArrayList<>();
	String query = "select * from ask where users_id = ? ;";
	PreparedStatement pstm = null;
	
	openConnection();
	
	try {
		pstm = (PreparedStatement)conn.prepareStatement(query);
		pstm.setString(1, id);
		ResultSet rs = pstm.executeQuery();
		
		while(rs.next()) {
			ask list = new ask();
			
			list.setQnum(rs.getInt("q_num"));
			list.setQcate_num(rs.getInt("q_cate_num"));
			list.setQtitle(rs.getString("q_title"));
			list.setQcontent(rs.getString("q_content"));
			list.setQregdate(rs.getTimestamp("q_regdate"));
			list.setAnsweryn(rs.getString("answeryn"));
			list.setAns_content(rs.getString("ans_content"));
			list.setAns_regdate(rs.getTimestamp("ans_regdate"));
			
			datas.add(list);
			
		}
		rs.close();
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		closeConnection();
	}
	return datas;
	
	}
	
	
}
