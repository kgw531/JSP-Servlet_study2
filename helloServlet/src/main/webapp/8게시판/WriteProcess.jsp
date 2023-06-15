<%@page import="common.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.NewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../6세션/IsLogin.jsp" %>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String userId = (String)session.getAttribute("userId");

	NewBoardDao dao = new NewBoardDao();
	Board board = new Board("",title,content,userId,"","");
	int res = dao.insert(board);
	
	
	if(res > 0){
		JSFunction.alertLocation("등록되었습니다.", "List.jsp",out);
	}else{
		JSFunction.alertBack("등록 중 오류가 발생하였습니다 관리자에게 문의해주세요.", out);
	}
	
%>
</body>
</html>