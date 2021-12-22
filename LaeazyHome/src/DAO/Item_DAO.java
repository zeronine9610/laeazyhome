package DAO;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.sun.corba.se.impl.orbutil.RepositoryIdUtility;

import DTO.cart;
import DTO.category;
import DTO.item;

public class Item_DAO {
	
	
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
	
	// 카테고리 클릭시 카테고리 정보 가져오기
	public category getCategory(String category_code) {
		category category = new category();
		PreparedStatement pstm = null;
		String query = "select * from category where code = ? ";
		
		openConnection();
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			pstm.setString(1, category_code);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
			
				category.setCode(rs.getInt("code"));
				category.setName(rs.getString("name"));
				category.setMonth(rs.getString("name"));
				category.setTag(rs.getString("tag"));
				category.setContent(rs.getString("content"));
			}
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return category;
	}
	
	// 카테고리 진입시 카테고리에 해당 되는 상품정보 가져오기
	public ArrayList<item> getItemList(String category_code){
		ArrayList<item> datas = new ArrayList<>();
		
		String query = "select * from product where category_code = ?;";
		PreparedStatement pstm =null;
		
		openConnection();
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			pstm.setString(1, category_code);
			ResultSet rs= pstm.executeQuery();
			
			while(rs.next()) {
				item item = new item();
				
				item.setPrcode(rs.getInt("prcode"));
				item.setPrname(rs.getString("prname"));	
				item.setCategory_code(rs.getInt("category_code"));
				item.setPrbrand(rs.getString("prbrand"));
				item.setPrimg(rs.getString("primg"));
				item.setPrprice(rs.getInt("prprice"));
				
				
				
				datas.add(item);
			}
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return datas;
	}
	
	// 상품상세 페이지로 값 가져가기
	
	public item getItem(int prcode) {
		item item = new item();
		PreparedStatement pstm = null;
		String query = "select * from product where prcode = ? ";
		
		openConnection();
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setInt(1, prcode);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {

				item.setPrcode(rs.getInt("prcode"));
				item.setPrname(rs.getString("prname"));	
				item.setCategory_code(rs.getInt("category_code"));
				item.setPrbrand(rs.getString("prbrand"));
				item.setPrimg(rs.getString("primg"));
				item.setPrprice(rs.getInt("prprice"));
				item.setPrcontent(rs.getString("prcontent"));
			}
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return item;
	}
	
	
	//검색결과 상품 가져오기
	
	public ArrayList<item> getSearchResult(String search){
		ArrayList<item> searchResult = new ArrayList<>();
		
		String query = "select * from product where prname like ? or prbrand like ? or hashtag like ? or prcontent like ?;";
		PreparedStatement pstm =null;
		
		openConnection();
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			pstm.setString(1, "%"+search+"%");
			pstm.setString(2, "%"+search+"%");
			pstm.setString(3, "%"+search+"%");
			pstm.setString(4, "%"+search+"%");
			
			ResultSet rs= pstm.executeQuery();
			
			while(rs.next()) {
				item item = new item();
				
				item.setPrcode(rs.getInt("prcode"));
				item.setPrname(rs.getString("prname"));	
				item.setCategory_code(rs.getInt("category_code"));
				item.setPrbrand(rs.getString("prbrand"));
				item.setPrimg(rs.getString("primg"));
				item.setPrprice(rs.getInt("prprice"));
				item.setPrcontent(rs.getString("prcontent"));
				
				searchResult.add(item);
			}
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return searchResult;
	}
	
	//메인페이지 하단 노출되는 이미지 
	
	public ArrayList<item> getRandIMG(){
		
		ArrayList<item> datas = new ArrayList<>();
		String query = "select * from mainpage_img order by rand() limit 6";
		Statement stmt;
		ResultSet rs;
		
		openConnection();
		try {
			stmt = (Statement) conn.createStatement();
			rs=stmt.executeQuery(query);
			
			while(rs.next()) {
				
				item item = new item();
				
				item.setPrcode(rs.getInt("prcode"));
				item.setPrname(rs.getString("prname"));	
				item.setCategory_code(rs.getInt("category_code"));
				item.setPrbrand(rs.getString("prbrand"));
				item.setPrimg(rs.getString("primg"));
				item.setPrprice(rs.getInt("prprice"));
				datas.add(item);
			}
			rs.close();
			stmt.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return datas;
	}
	
	//제품 등록
	
	public boolean pr_insert(String prname, int category_code, String prbrand,String primg,int prprice, String hashtag ) {
		PreparedStatement pstm = null;
		String query = "insert into product (prname,category_code,prbrand,prcontent,primg,prprice,hashtag,regdate) values(?,?,?,'Red pillow cover Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin',?,?,?,now());";
		
		openConnection();
		int count = 0;
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, prname);
			pstm.setInt(2, category_code);
			pstm.setString(3, prbrand);
			pstm.setString(4, primg);
			pstm.setInt(5, prprice);
			pstm.setString(6, hashtag);
			
			count = pstm.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return count > 0 ? true : false;
	}
	
	//장바구니 목록 중복 확인
	
	public int cart_chek(String id, int prcode) {
		int cnt = 0;
		PreparedStatement pstm = null;
		String query = "select * from cart where id = ? and prcode = ?;";
		openConnection();
		
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, id);
			pstm.setInt(2, prcode);
			
			ResultSet rs = pstm.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("prcode");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return cnt;
	}
	
	// 장바구니 등록
	
	public boolean pr_cart(String id , int prcode, int quantity) {
		PreparedStatement pstm = null;
		String query = "insert into cart(id,prcode,quantity,indate) values(?,?,?,now());";
		
		openConnection();
		int count = 0;
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, id);
			pstm.setInt(2, prcode);
			pstm.setInt(3, quantity);
			
			count = pstm.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return count > 0 ? true : false;
	}
	
	// cart list 가져오기
	
	public ArrayList<cart> getCartList(String id){
		ArrayList<cart> cartList = new ArrayList<>();
		
		String query = "select * from cart_list where id = ?";
		PreparedStatement pstm = null;
		
		openConnection();
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			pstm.setString(1, id);
			
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {
				cart item = new cart();
				
				item.setPrname(rs.getString("prname"));
				item.setId(rs.getString("id"));
				item.setQuantity(rs.getInt("quantity"));
				item.setPrprice(rs.getInt("prprice"));
				item.setPrimg(rs.getString("primg"));
				item.setTotal(rs.getInt("total"));
				item.setPrcode(rs.getInt("prcode"));
				
				cartList.add(item);
			}
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return cartList;
	}
	
	
	//카트 리스트 삭제
	public boolean cartlistDel(String id, String prcode) {
		PreparedStatement pstm = null;
		String query = "delete from cart where id = ? and prcode = ? ;";
		
		openConnection();
		int count = 0;
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, id);
			pstm.setString(2, prcode);

			
			count = pstm.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return count > 0 ? true : false;
	}
	
	//총 주문내역
	
	public cart getTotal(String id) {
		cart alltotal = new cart();
		PreparedStatement pstm = null;
		String query = "select sum(total) as alltotal from cart_list  where id = ? ;";
		
		openConnection();
		
		try {
			pstm = (PreparedStatement)conn.prepareStatement(query);
			
			pstm.setString(1, id);
			ResultSet rs = pstm.executeQuery();
			
			while(rs.next()) {

				alltotal.setAlltotal(rs.getInt("alltotal"));
			}
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return alltotal;
	}
	
}
