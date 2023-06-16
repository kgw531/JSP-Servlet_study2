package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBconnPool;
import dto.Board;
import dto.Criteria;

public class NewBoardDao {

	public NewBoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Board> getList(Criteria criteria){
		List<Board> list = new ArrayList<>();
		
		String sql = "select NUM,TITLE,CONTENT,ID, decode(trunc(sysdate),trunc(POSTDATE), to_char(POSTDATE,'hh24:mi:ss'),to_char(POSTDATE,'yyyy-mm-dd')),visitcount from board";
		
		if(criteria.getSearchWord() != null && !"".equals(criteria.getSearchWord())){
			sql += " where " + criteria.getSearchField()+ " like " + "'%"+ criteria.getSearchWord() +"%'";
		}
		
		sql += " order by num desc";
		
		try(Connection conn = DBconnPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				String num = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String id = rs.getString(4);
				String postdate = rs.getString(5);
				String visitcount = rs.getString(6);
				Board board = new Board(num,title,content,id,postdate,visitcount);
				list.add(board);				
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public List<Board> getListPage(Criteria criteria){
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
	
	public int insert(Board board) {
		int res = 0;
		String sql = "insert into board (num, title, content, id, postdate, visitcount) values (seq_board_num.nextval, ?, ?, ?, sysdate, 0)";
		
		
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1, board.getTitle());
			psmt.setString(2, board.getContent());
			psmt.setString(3, board.getId());
			
			res = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	public Board selectOne(String num) {
		String sql = "select * from board where num = ?";
		Board board = null;
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1,num);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				board = new Board();
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setNum(rs.getString("num"));
				board.setPostdate(rs.getString("postdate"));
				board.setTitle(rs.getString("title"));
				board.setVisitCount(rs.getString("visitcount"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return board;
	}
	
	public void updateVisitCount(String num) {
		String sql = "update board set visitcount = visitcount + 1 where num = ?";
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1, num);
			psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
