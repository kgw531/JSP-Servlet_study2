<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String num = request.getParameter("num");
	Board board = new Board();
	BoardDao dao = new BoardDao();
	int res = dao.delete(num);
	
	if(res > 0 ){
		JSFunction.alertLocation("삭제되었습니다.", "Board.jsp", out);
	}else{
		JSFunction.alertBack("삭제 중 오류가 발생하였습니다 관리자에게 문의해주세요.", out);
	}
	
%>


</body>
</html>