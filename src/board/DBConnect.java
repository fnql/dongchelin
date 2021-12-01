package board;

import java.sql.*;
import java.util.*;

public class DBConnect {
	Connection conn = null;
	PreparedStatement pstmt = null;


	public Connection getConnection() {
		String jdbc_driver = "com.mysql.cj.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost:3306/study?useUcode=true&characterEncoding=utf-8";
		String dbUser = "root";
		String dbPass = "1234";
		
		Connection conn = null;
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url,dbUser,dbPass);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
