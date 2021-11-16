package loginRegister;

import java.sql.*;
import java.util.*;

public class MemberBean { 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	/* MySQL 연결정보 */
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/study?useUcode=true&characterEncoding=utf-8";
	String dbUser = "root";
	String dbPass = "rkdals99";
	// DB연결 메서드
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
	
	private static MemberBean instance;
    
    // 싱글톤 패턴
    private MemberBean(){}
    
    public static MemberBean getInstance(){
        if(instance==null)
            instance=new MemberBean();
        return instance;
    }

	
	// 수정된 주소록 내용 갱신을 위한 메서드
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
	
	// 특정 주소록 게시글 삭제 메서드
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
	
	// 신규 주소록 메시지 추가 메서드
	public boolean insertDB(Member member) {
		connect();
				
		String sql ="insert into member(email,password,mfx,name,best,myself,admin) values(?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,member.getEmail());
			pstmt.setString(2,member.getPassword());
			pstmt.setString(3, member.getMfx());
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

	// 특정 주소록 게시글 가져오는 메서드
	public Member getDB(String email) {
		connect();
		
		String sql = "select * from member where email=?";
		Member member = new Member();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,email);
			ResultSet rs = pstmt.executeQuery();
			
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행 한다.
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
	
	// 전체 주소록 목록을 가져오는 메서드
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
				member.setPassword(rs.getString("password"));
				member.setMfx(rs.getString("mfx"));
				member.setName(rs.getString("name"));
				member.setBest(rs.getString("best"));
				member.setMyself(rs.getString("myself"));
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
	        String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
	        int x = -1;
	 
	        try {
	        	pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				ResultSet rs = pstmt.executeQuery();
	 
	            if (rs.next() ) // 입려된 아이디에 해당하는 비번 있을경우
	            {
	                dbPW = rs.getString("pw"); // 비번을 변수에 넣는다.
	 
	                if (dbPW.equals(pw)) 
	                    x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
	                else                  
	                    x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
	                
	            } else {
	                x = -1; // 해당 아이디가 없을 경우
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