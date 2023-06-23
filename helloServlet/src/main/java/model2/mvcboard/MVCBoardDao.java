package model2.mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBconnPool;
import dto.Criteria;

public class MVCBoardDao {

	public MVCBoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<MVCBoardDto> getList(Criteria cri){
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();
		String sql = "select * from mvcboard ";
		
		if(cri.getSearchWord() != null && !"".equals(cri.getSearchWord())) {
			sql += "where " +  cri.getSearchField() + " like " + " '%"+ cri.getSearchWord() +"%' ";
		}
		sql += "order by idx desc";
		
		try (Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				MVCBoardDto dto = new MVCBoardDto();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getString("postdate"));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt("visitcount"));
				list.add(dto);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	public List<MVCBoardDto> getListPage(Criteria cri){
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();
		String sql = "select * from(select tb.*, rownum rn from(select * from mvcboard ";
		
		if(cri.getSearchWord() != null && !"".equals(cri.getSearchWord())) {
			sql += "where " +  cri.getSearchField() + " like " + " '%"+ cri.getSearchWord() +"%' ";
		}
		sql += "order by idx desc) tb) where rn between ? and ? ";
		
		try (Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setInt(1, cri.getStartNo());
			psmt.setInt(2, cri.getEndNo());
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				MVCBoardDto dto = new MVCBoardDto();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getString("postdate"));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt("visitcount"));
				list.add(dto);
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public int getTotalCnt(Criteria criteria) {
		int totalCnt = 0;
		String sql = "select count(*) from mvcboard ";
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

	public MVCBoardDto selectOne(String idx) {
		String sql = "select * from mvcboard where idx = ?";
		MVCBoardDto dto = new MVCBoardDto();
		
		
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, idx);
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getString(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				
			}
			
			
		} catch (SQLException e) {
			System.err.println("게시물 상세보기 중 오류가 발생하였습니다.");
			e.printStackTrace();
		}
		
		return dto;
	}

	public boolean confirmPassword(String pass, String idx) {
		boolean res = false;
		String sql = "select * from mvcboard where idx = ? and pass= ? ";
		
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1, idx);
			psmt.setString(2, pass);
			
			ResultSet rs = psmt.executeQuery();
			res = rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	public int delete(String idx) {
		int res  = 0;
		
		String sql = "delete from mvcboard where idx = " + idx;
		
		
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			
			res = psmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	

}
