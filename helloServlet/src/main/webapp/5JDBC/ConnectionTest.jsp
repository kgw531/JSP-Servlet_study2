<%@page import="dao.MemberDao"%>
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
<title>외부 설정파일로 부터 DB접속정보를 읽어오기</title>
</head>
<body>
<%
	Connection conn = ConnectionUtill.getConnection(application);

	PreparedStatement psmt = conn.prepareStatement("select sysdate from dual");
	
	ResultSet rs = psmt.executeQuery();
	rs.next();
	out.print(rs.getString(1));
%>
	
</body>
</html>