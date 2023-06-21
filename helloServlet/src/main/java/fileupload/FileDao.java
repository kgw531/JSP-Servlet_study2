package fileupload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBconnPool;

public class FileDao {

	public FileDao() {
		// TODO Auto-generated constructor stub
	}
	
	public int insertFile(FileDto dto) {
		int res = 0;
		String sql = "insert into myfile(idx,name, title,cate, ofile, sfile) values(seq_board_num.nextval,?,?,?,?,?)";
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			res = psmt.executeUpdate();
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
	}
	
	public List<FileDto> getFileList(){
		List<FileDto> list = new ArrayList<FileDto>();
		String sql = "select * from myfile order by idx desc";
		
		try(Connection conn = DBconnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				FileDto dto = new FileDto();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 결과 집합 담기
		return list;
	}

}
