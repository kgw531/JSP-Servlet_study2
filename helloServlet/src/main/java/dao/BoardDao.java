package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtill;
import common.DBconnPool;
import dto.Board;
import dto.Criteria;


public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 게시글 번호를 입력받아 게시글을 조회한다.
	 * @param num
	 * @return
	 */
	public Board selectOne(String num) {
		Board board = null;
		String sql = "select * from board where num = ? " ;
		
		if(num == null || "".equals(num)) {
			return null;
		}
		try(Connection conn = DBconnPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, num);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				board = new Board();
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(
						// 줄 바꿈 처리
						rs.getString("content").replace("\r\n", "<br/>"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setVisitCount(rs.getString("visitcount"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return board;
	}
	
	public static int insert(Board board) {
		int res = 0;
		String sql = "insert into board  (num, title, content, id, postdate, visitcount)"
				+ "	values (seq_board_num.nextval, ?, ?, ?, sysdate, 0)";
		
		String title = board.getTitle();
		String content = board.getContent();
		String id = board.getId();
		
		
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, id);
			
			res = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	
	}
	// 게시글의 갯수를 반환합니다.
	public int getTotalCnt(Criteria criteria) {
		int totalCnt = 0;
		String sql = "select count(*) from board ";
		if(criteria.getSearchWord() != null && !"".equals(criteria.getSearchWord())) {
			sql += "where "+criteria.getSearchField()+" like '%"+criteria.getSearchWord() +"%'";
		}
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			ResultSet rs = psmt.executeQuery();
			rs.next();
			totalCnt = rs.getInt(1);
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return totalCnt;
	}

	/**
	 * 게시글을 조회합니다.
	 * 
	 * 검색조건을 추가한다.
	 * @return
	 */
	public List<Board> getList(String searchField, String searchWord) {
		String sql = "select * from board ";
		if(searchWord != null && !"".equals(searchWord)) {
			sql += "where "+searchField+" like '%"+searchWord +"%'";
		}
		sql += "order by num desc";
		List<Board> boardList = new ArrayList<Board>();
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {

			ResultSet rs = psmt.executeQuery();
			while(rs.next()){
				Board board = new Board();
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setVisitCount(rs.getString("visitcount"));
				
				boardList.add(board);
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
		}
		return boardList;
	}
	public List<Board> getListPage(Criteria criteria) {
		List<Board> boardList = new ArrayList<Board>();
		String sql = ""
				+ "select * from("
				
				+ "select board.*, rownum rn from board ";
		if(criteria.getSearchWord() != null && !"".equals(criteria.getSearchWord())) {
			sql += "where "+criteria.getSearchField()+" like '%"+criteria.getSearchWord() +"%'";
		}
		sql += "order by num desc" + ")"
				+"where rn between " + criteria.getStartNo()
				+ " and " + criteria.getEndNo();
		
		
		
		
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			
			ResultSet rs = psmt.executeQuery();
			while(rs.next()){
				Board board = new Board();
				board.setNum(rs.getString("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setVisitCount(rs.getString("visitcount"));
				
				boardList.add(board);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); 
		}
		return boardList;
	}
	
	
	/**
	 * 게시물의 조회수를 1 증가시킵니다.
	 * @param num : 게시물 번호
	 * @return 업데이트된 갯수
	 */
	public int updateVisitCount(String num) {
		int res = 0;
		String sql = "update board set visitcount = visitcount + 1 where num= ?";

		
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			psmt.setString(1, num);
			res = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return res;
	}
	
	public int update(Board board) {
		int res = 0;
		String sql = "UPDATE BOARD SET title = ?, content = ? where num = ?";
		
		try (Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1,board.getTitle());
			psmt.setString(2,board.getContent());
			psmt.setString(3,board.getNum());
			
			res = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;
	}
	
	public int delete(String num) {
		int res = 0;

		String sql = "delete board where num = ?";
		
		try (Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1,num);
			
			res = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return res;

	}
	


	

}
