package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class DAO {
	DBConnect dbconnect = null;
	String sql="";
	
	public DAO() {
		dbconnect = new DBConnect();
	}
	
	
	
	public int count() {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		
		try {
			sql = "SELECT COUNT(*) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt=rs.getInt(1);
			}
			
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return cnt;
	}
	
	public String pasing(String data) {
		try {
			data = new String(data.getBytes("8859_1"), "euc-kr");
		}catch (Exception e){
		}
		return data;
	}
	
	
	//멤버리스트
	public ArrayList<VO> getMemberList() throws Exception {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<VO> alist = new ArrayList<VO>();
		
		try {
			sql = "SELECT NUM, USERNAME, TITLE, TIME, HIT, INDENT, NLIST,shop from board order by ref desc, step asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				VO vo = new VO();
				boolean dayNew = false;
				vo.setNum(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setChecklist(rs.getString(7));
				vo.setShop(rs.getString(8));
				Date date = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
				String year = (String)simpleDate.format(date);
				//String yea = rs.getString(4).substring(0,10);
				
				//if(true){
				//	dayNew = true;
				//}
				
				//vo.setTime(yea);
				vo.setHit(rs.getInt(5));
				vo.setIndent(rs.getInt(6));
				vo.setDayNew(dayNew);
				alist.add(vo);
			}
			
		}catch(Exception e) {
			throw e;
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return alist;
	}
	
	public int getMax() {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int max = 0;
		
		try {
			sql = "SELECT MAX(NUM) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				max=rs.getInt(1);
			}
			
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return max;
	}
	
	
	//insertWrite 글 입력
	public void insertWrite(VO vo, int max) throws Exception {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			sql = "INSERT INTO board(USERNAME,PASSWORD,TITLE,MEMO,REF,nlist,shop) VALUES(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pasing(vo.getName()));
			pstmt.setString(2, pasing(vo.getPassword()));
			pstmt.setString(3, pasing(vo.getTitle()));
			pstmt.setString(4, pasing(vo.getMemo()));
			pstmt.setInt(5, max+1);
			pstmt.setString(6, vo.getChecklist());
			pstmt.setString(7, pasing(vo.getShop()));
			
			pstmt.execute();
		}catch(Exception e) {
			throw e;
		}finally {
			DBClose.close(con,pstmt);
		}
	}
	
	public VO getView(int idx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		VO vo = null;
		
		try {
			sql = "SELECT USERNAME, TITLE, MEMO, TIME, HIT, PASSWORD, REF, INDENT, STEP, NLIST,shop FROM board WHERE NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new VO();
				vo.setName(rs.getString(1));
				vo.setTitle(rs.getString(2));
				vo.setMemo(rs.getString(3));
				vo.setTime(rs.getString(4));
				vo.setHit(rs.getInt(5)+1);
				vo.setPassword(rs.getString(6));
				vo.setRef(rs.getInt(7));
				vo.setIndent(rs.getInt(8));
				vo.setStep(rs.getInt(9));
				vo.setChecklist(rs.getString(10));
				vo.setShop(rs.getString(11));
			}
			
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return vo;
	}
	
	
	// HitUpdate 조회수 업데이트
	public void UpdateHit(int idx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			sql = "UPDATE board SET HIT=HIT+1 where NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			 
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt);
		}
	}
	
	
	//password check 비밀번호검사
	public boolean checkPassword(VO vo, int idx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean ch = false;
		
		try {
			sql = "SELECT NUM FROM board where NUM=? and PASSWORD=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, vo.getPassword());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ch = true;
			} else {
				ch = false;
			}
			
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return ch;
	}
	
	// delete = 삭제
	public void delete(int idx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			sql = "DELETE FROM board WHERE NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt);
		}
	}
	
	
	// modify = 수정
	public void modify(VO vo, int idx) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;	
		
		try {
			sql = "UPDATE board SET TITLE=?, MEMO=?, NLIST=?,shop=? where NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pasing(vo.getTitle()));
			pstmt.setString(2, pasing(vo.getMemo()));
			pstmt.setString(3, pasing(vo.getChecklist()));
			pstmt.setString(4, pasing(vo.getShop()));
			pstmt.setInt(5, idx);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt);
		}
	}
	
	
	public void UpdateStep(int ref, int step) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			sql = "UPDATE board SET STEP=STEP+1 where REF=? and STEP>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(1, step);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt);
		}
	}
	
	public void insertReply(VO vo, int ref, int indent, int step) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			sql = "INSERT INTO board(USERNAME, PASSWORD, TITLE, MEMO, REF, INDENT, STEP) "+
					"VALUES(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pasing(vo.getName()));
			pstmt.setString(2, pasing(vo.getPassword()));
			pstmt.setString(3, pasing(vo.getTitle()));
			pstmt.setString(4, pasing(vo.getMemo()));
			pstmt.setInt(5, ref);
			pstmt.setInt(6, indent+1);
			pstmt.setInt(7, step+1);
			
			pstmt.execute();
		}catch(Exception e) {
			
		}finally {
			DBClose.close(con,pstmt);
		}
	}

	public ArrayList<VO> getSearch(String searchField, String searchText) throws Exception {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<VO> alist = new ArrayList<VO>();
		sql ="select * from board WHERE "+searchField.trim();
		System.out.println(searchText);
		try {
			if(searchText != null && !searchText.equals("") ){
				sql +=" LIKE '%"+searchText.trim()+"%' order by username desc limit 10";
            }
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				VO vo = new VO();
				boolean dayNew = false;
				vo.setNum(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setShop(rs.getString(6));
				vo.setChecklist(rs.getString(12));
				Date date = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd"); 
				String year = (String)simpleDate.format(date);
				//String yea = rs.getString(4).substring(0,10);
				
				//if(true){
				//	dayNew = true;
				//}
				
				//vo.setTime(yea);
				alist.add(vo);
			}
			
		}catch(Exception e) {
			throw e;
		}finally {
			DBClose.close(con,pstmt,rs);
		}
		return alist;
	}
}
