package loginRegister;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

public class ShopBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/study?useUcode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPass = "1234";
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	
	
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,dbUser,dbPass);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}	
	
	public boolean updateDB(Shop shop) {
		connect();
		
		String sql ="update eated set eat=?, visit=? where email=?";		
		 
		try {
			LocalDate todaysDate = LocalDate.now();
			todaysDate.minusDays(1);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,shop.getEat());
			pstmt.setString(2,todaysDate.toString());
			pstmt.setString(3,shop.getEmail());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	
	public Shop getDB(String email) {
		connect();
		LocalDate todaysDate = LocalDate.now();
		todaysDate = todaysDate.minusDays(1);
		String sql = "select * from eated where email=? and visit='"+todaysDate+"'";
		Shop shop = new Shop();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,email);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
			do{shop.setEmail(rs.getString("email"));
			shop.setEat(rs.getString("eat"));
			shop.setVisit(rs.getString("visit"));} while(rs.next());
			} else {
				shop.setEmail("0");
				shop.setEat("0");
				shop.setVisit("0");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return shop;
	}
	
	public boolean insertDB(Shop shop) {
		connect();
		LocalDate todaysDate = LocalDate.now();
		todaysDate = todaysDate.minusDays(1);
		String sql ="insert into eated(email,eat,visit) values(?,?,'"+todaysDate+"')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,shop.getEmail());
			pstmt.setString(2,shop.getEat());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}
	public boolean deleteDB(String email) {
		return false;
	}
	
	public ArrayList<String> getDBList() {
		connect();
		ArrayList<String> sdatas = new ArrayList<String>();
		
		String sql = "select * from eated where email = 'db@naver.com' and visit between date_add(now(),interval -1 month) and now();";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				sdatas.add(rs.getString(2));
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return sdatas;
	}

}