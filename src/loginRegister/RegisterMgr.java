package loginRegister;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;



public class RegisterMgr{
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String jDBC_URL = "jdbc:mysql://localhost:3306/jspdb?characterEncoding=utf-8";
	private final String USER = "root";
	private final String PASS = "rkdals29";
	
	public RegisterMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	}//MemberMgr()

	public Vector getMemberList() {

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		try {
			conn = DriverManager.getConnection(jDBC_URL, USER, PASS);
			String strQuery = "select * from membertbl";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next()) {
				RegisterBean regBean = new RegisterBean();
				regBean.setMemberid (rs.getString("memberid"));
				regBean.setPassword (rs.getString("password"));
				regBean.setName (rs.getString("name"));
				regBean.setEmail (rs.getString("email"));
				vecList.add(regBean);
			}
		} catch (Exception e) {
			System.out.println("Exception" + e);
		}
		return vecList;
	}
	
	public void insertMember(RegisterBean mem) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(jDBC_URL, USER, PASS);
			
			pstmt = conn.prepareStatement("insert into membertbl values (?, ?, ?, ?)");
			pstmt.setString(1, mem.getMemberid());
			pstmt.setString(2, mem.getPassword());
			pstmt.setString(3, mem.getName());
			pstmt.setString(4, mem.getEmail());
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e) {}
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return ;
	}
}