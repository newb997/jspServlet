package ch06;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//231220
public class RegisterMgr {
//	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
//	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
//	private final String USER = "aie";
//	private final String PASS = "aie";
	//connection풀에 있어서 안해도됨
	
	private DBConnectionMgr pool = null;
	
	public RegisterMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("커넥션 얻어오기 실패");
		}
	}
	
	//내가 필요한 select, insert, delete, upadate등을 메소드로 정의
	public boolean login(String id, String pw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginFlag = false;
		
		try {
			con = pool.getConnection();
			String query = "select count(*) from member where mem_id=? and mem_pw=?";	// ?가 들어있는곳 빼고 미리 컴파일 해놓음
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next() && rs.getInt(1) > 0) {
				loginFlag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);	//반납 안하면 과부하걸림
		}
		return loginFlag;
	}
}
	

