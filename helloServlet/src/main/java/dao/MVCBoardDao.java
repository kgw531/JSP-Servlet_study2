package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBconnPool;
import dto.MVCBoardDto;

public class MVCBoardDao {

	public MVCBoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<MVCBoardDto> getList(){
		List<MVCBoardDto> list = new ArrayList<MVCBoardDto>();
		String sql = "select * from mvcboard order by idx";
		
		
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

}
