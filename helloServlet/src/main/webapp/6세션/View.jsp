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
<%
	BoardDao dao = new BoardDao();
	//게시글 1건을 조회 후 board 객체에 담아서 반환
	Board board = dao.selectOne(request.getParameter("num"));
	dao.updateVisitCount(request.getParameter("num"));
	
	if(board == null){
		JSFunction.alertBack("게시글이 존재하지 않습니다.", out);
		return;
	}


%>
<script>
	function deletPost(){
		var res = confirm("삭제하시겠습니까?");
		if(res){
			location.href="DeleteProcess.jsp?num=<%= board.getNum()%>"
		}
		
	}
</script>
</head>
<body>
<jsp:include page="Link.jsp" />

<h2>회원제 게시판 - 상세보기(View)</h2>

<form>
	<table border=1 width="90%">
		<tr>
			<td>번호</td>
			<td><%=board.getNum()%></td>
			<td>작성자</td>
			<td><%=board.getId() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=board.getPostdate() %></td>
			<td>조회수</td>
			<td><%=board.getVisitCount() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan='3'><%=board.getTitle() %></td>
		</tr>
		<tr height="200px">
			<td >내용</td>
			<td colspan='3'><%=board.getContent() %></td>
		</tr>
		<tr>
			<td colspan='4' align="center">
			<%
				if(session.getAttribute("userId") != null && board.getId().equals(session.getAttribute("userId"))){			
			%>
							<button type="button" onclick="">삭제하기</button>
			<%} %>
				<input type="button" onclick="location.href='Board.jsp'" value="목록보기">
			<%
				if(session.getAttribute("userId") != null && board.getId().equals(session.getAttribute("userId"))){			
			%>
							<button type="button" onclick="location.href='Edit.jsp?num=<%=board.getNum()%>>'")>수정하기</button>
			<%} %>
			</td>
		</tr>
	
	</table>
</form>






</body>
</html>