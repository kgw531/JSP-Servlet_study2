package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.ConnectionUtill;
import dto.Member;

public class MemberDao {

	public MemberDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 로그인
	 * 아이디/비밀번호가 일치하는 회원을 조회합니다.
	 * 
	 * 회원이 존재하는 경우 Member 객체 반환, 존재하지 않는 경우 null 반환
	 * @param id : 입력한 회원 id
	 * @param pw : 입력한 회원 pw
	 * @return
	 */
	public Member login(String id, String pw) {
		Member member = null;
		String sql = "select * from member where id = ? and pass = ?";
		
		// 리소스/자우너을 자동으로 반환
		try(Connection con = ConnectionUtill.getConnection();
			PreparedStatement psmt = con.prepareStatement(sql);){
			psmt.setString(1,id);
			psmt.setString(2,pw);
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				String loginId= rs.getString("id");
				String name = rs.getString("name");
				String regidate = rs.getString("regidate");
				
				member = new Member(loginId, "", name, regidate);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return member;

	}
	
	/**
	 * 회원등록
	 * @param member
	 * @return : 몇 건이 처리되었는 지 반환한다.
	 */
	public int insert(Member member) {
		int i = 0;
		String sql = "insert into member values(?,?,?,sysdate)";
		try(Connection conn = ConnectionUtill.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			psmt.setString(1, member.getId());
			psmt.setString(2, member.getPass());
			psmt.setString(3, member.getName());
			
			i = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	} 
	
}
