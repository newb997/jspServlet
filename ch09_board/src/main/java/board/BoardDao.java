package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

// 231226
public class BoardDao {
	private DBConnectionMgr pool;
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public BoardDao() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 글쓰기 등록 231227
	public boolean insertBoard(Board board) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert into board values(seq_board.nextval, ?, ?, ?, 0, seq_board.currval, 0, sysdate, ?, ?, default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getPass());
			pstmt.setString(5, board.getIp());
			
			//pstmt.executeUpdate(); 이게 반환된게 1이면 잘된거 0이면 안된거
			if(pstmt.executeUpdate() == 1) {	// 데이터 바뀔때 사용  / select는 executeQuery
				flag = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con,pstmt);
		}
		
		return flag;
	}
	
	// 조회수 증가 231227
	public void upCount(int num) {
		
		try {
			con = pool.getConnection();
			sql = "update board set count = count + 1 where num ="+num;
			con.createStatement().executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt);   // stmt : createStatement()
		}
	}
	
	// 게시물 1개 상세보기 231227
	public Board getBoard(int num) {
		Board board = null;
		
		try {
			con = pool.getConnection();
			sql = "select * from board where num=" +num;
			rs = con.createStatement().executeQuery(sql);
			
			if(rs.next()) {
				//board.setNum(rs.getInt(1)); 생성자 만들어놔서 이렇게 11개 안만들고 밑에처럼 하면됨
				board = new Board(rs.getInt(1),
								  rs.getString(2),
								  rs.getString(3),
								  rs.getString(4),
								  rs.getInt(5),
								  rs.getInt(6),
								  rs.getInt(7),
								  rs.getString(8),
								  rs.getString(9),
								  rs.getString(10),
								  rs.getInt(11));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return board;
	}
	
	// 게시물 삭제 231227
		public boolean deleteBoard(int num) {
			boolean flag = false;
			
			try {
				con = pool.getConnection();
				sql = "select count(*) from board where ref=" +num;
				rs = con.createStatement().executeQuery(sql);
				
				if(rs.next()) {
					if(rs.getInt(1) <= 1 ) {
						sql = "delete from board where num=" +num;
						if(con.createStatement().executeUpdate(sql) ==1) {
							flag = true;
						}
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con);
			}
			return flag;
		}
		
		
	// 게시물 수정하기 231227
	public void updateBoard(Board board) {
		try {
			con = pool.getConnection();
			sql = "update board set subject=?, content=? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNum());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// 댓글 위치값 증가 231227
	public void replyUpBoard(int ref, int pos) {
		try {
			con = pool.getConnection();
			sql = "update board set pos = pos+1 where ref=? and pos > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	// 게시물 댓글 등록 231227
	public void replyBoard(Board board) {
		try {
			con = pool.getConnection();
			sql = "insert into board values(seq_board.nextval, ?, ?, ?, ?, ?, ?, sysdate, ?, ?, default)";
			
			int pos = board.getPos() + 1;
			int depth = board.getDepth() + 1;
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, pos);
			pstmt.setInt(5, board.getRef());
			pstmt.setInt(6, depth);
			pstmt.setString(7, board.getPass());
			pstmt.setString(8, board.getIp());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
	}
	
	// 게시물의 총 갯수
	public int getTotalCount(String keyField, String keyWord) {
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(num) from board";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(num) from board where " + keyField + " like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%");		
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	
	
	// 전체 게시글 또는 검색한 게시글 리스트 목록
	public ArrayList<Board> getBoardList(String keyField, String keyWord, int start, int end) {
		ArrayList<Board> alist = new ArrayList<Board>();
		
		try {
			con = pool.getConnection();
			if(keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * "
					+ "from (select * from board order by ref desc, pos) "
					+ "where ROWNUM >= ? AND ROWNUM <= ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setPos(rs.getInt("pos"));
				board.setRef(rs.getInt("ref"));
				board.setDepth(rs.getInt("depth"));
				board.setRegdate(rs.getString("regdate"));
				board.setCount(rs.getInt("count"));
				alist.add(board);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return alist;
	}
	
	
	
	
	
	
	
	
	// 복붙용
	public boolean Board(Board board) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return flag;
	}
}
