package loginRegister;

import java.sql.*;
import java.util.*;

public class MemberBean { 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	/* MySQL �뿰寃곗젙蹂� */
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/study?useUcode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPass = "admin";
	// DB�뿰寃� 硫붿꽌�뱶
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
	
	// �닔�젙�맂 二쇱냼濡� �궡�슜 媛깆떊�쓣 �쐞�븳 硫붿꽌�뱶
	public boolean updateDB(Member member) {
		connect();
		
		String sql ="update member set pw=?, mfx=?, best=?, myself=? where email=?";		
		 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,member.getPassword());
			pstmt.setString(2,member.getMfx());
			pstmt.setString(3, member.getBest());
			pstmt.setString(4,member.getMyself());
			pstmt.setString(5,member.getEmail());
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
	
	// �듅�젙 二쇱냼濡� 寃뚯떆湲� �궘�젣 硫붿꽌�뱶
	public boolean deleteDB(String email) {
		connect();
		
		String sql ="delete from member where email=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,email);
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
	
	// �떊洹� 二쇱냼濡� 硫붿떆吏� 異붽� 硫붿꽌�뱶
	public boolean insertDB(Member member) {
		connect();
				
		String sql ="insert into member(email,pw,mfx,name,best,myself,admin) values(?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,member.getEmail());
			pstmt.setString(2,member.getPassword());
			pstmt.setString(3,member.getMfx());
			pstmt.setString(4,member.getName());
			pstmt.setString(5,member.getBest());
			pstmt.setString(6,member.getMyself());
			pstmt.setString(7,"user");
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

	// �듅�젙 二쇱냼濡� 寃뚯떆湲� 媛��졇�삤�뒗 硫붿꽌�뱶
	public Member getDB(String email) {
		connect();
		
		String sql = "select * from member where email=?";
		Member member = new Member();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,email);
			ResultSet rs = pstmt.executeQuery();
			
			// �뜲�씠�꽣媛� �븯�굹留� �엳�쑝誘�濡� rs.next()瑜� �븳踰덈쭔 �떎�뻾 �븳�떎.
			rs.next();
			member.setEmail(rs.getString("email"));
			member.setPassword(rs.getString("pw"));
			member.setMfx(rs.getString("mfx"));
			member.setName(rs.getString("name"));
			member.setBest(rs.getString("best"));
			member.setMyself(rs.getString("myself"));
			member.setAdmin(rs.getString("admin"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return member;
	}
	
	// �쟾泥� 二쇱냼濡� 紐⑸줉�쓣 媛��졇�삤�뒗 硫붿꽌�뱶
	public ArrayList<Member> getDBList() {
		connect();
		ArrayList<Member> datas = new ArrayList<Member>();
		
		String sql = "select * from member order by email desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Member member = new Member();
				
				member.setEmail(rs.getString("email"));
				member.setPassword(rs.getString("pw"));
				member.setMfx(rs.getString("mfx"));
				member.setName(rs.getString("name"));
				member.setBest(rs.getString("best"));
				member.setMyself(rs.getString("myself"));
				member.setAdmin(rs.getString("admin"));
				datas.add(member);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
	
	 public int loginCheck(String id, String pw) 
	    {
		 	connect();
		 	String sql="SELECT pw FROM member WHERE email=?"; 
	        String dbPW = ""; // db�뿉�꽌 爰쇰궦 鍮꾨�踰덊샇瑜� �떞�쓣 蹂��닔
	        int x = -1;
	 
	        try {
	        	pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				ResultSet rs = pstmt.executeQuery();
	 
	            if (rs.next()) // �엯�젮�맂 �븘�씠�뵒�뿉 �빐�떦�븯�뒗 鍮꾨쾲 �엳�쓣寃쎌슦
	            {
	                dbPW = rs.getString("pw"); // 鍮꾨쾲�쓣 蹂��닔�뿉 �꽔�뒗�떎.
	 
	                if (dbPW.equals(pw)) 
	                    x = 1; // �꽆寃⑤컺�� 鍮꾨쾲怨� 爰쇰궡�삩 諛곕쾲 鍮꾧탳. 媛숈쑝硫� �씤利앹꽦怨�
	                else                  
	                    x = 0; // DB�쓽 鍮꾨�踰덊샇�� �엯�젰諛쏆� 鍮꾨�踰덊샇 �떎由�, �씤利앹떎�뙣
	                
	            } else {
	                x = -1; // �빐�떦 �븘�씠�뵒媛� �뾾�쓣 寃쎌슦
	            }
	 
	            return x;
	 
	        } catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
	        } finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
	        }
	    } 

}