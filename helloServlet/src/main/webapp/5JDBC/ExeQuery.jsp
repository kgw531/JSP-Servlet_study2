<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.ConnectionUtill"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원목록 조회</h2>
	<table>
	
	<%
		Connection con = ConnectionUtill.getConnection();
		
		String sql = "select id, name, regidate from member";
		PreparedStatement psmt = con.prepareStatement(sql);
		
		ResultSet rs = psmt.executeQuery();
		
		while(rs.next()){
			String id = rs.getString("id");
			String name = rs.getString("name");
			String regidate = rs.getString("regidate");
			
			out.print(String.format("<tr><td>%s</td><td>%s</td><td>%s</td></tr>",id,name,regidate));
		}
		rs.close();
		psmt.close();
		con.close();
	%>
	
	</table>
</body>
</html>