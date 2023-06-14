<%@page import="dto.Member"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
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
	request.setCharacterEncoding("utf-8");
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	// 검색어가 null이 아니면 검색기능을 추가!!
	if(searchWord == null || "".equals(searchWord)){
		searchWord = "";
	}
	
	
	BoardDao dao = new BoardDao();
	
	
	List<Board> boardList = dao.getList(searchField,searchWord);
	
	int totalCnt = dao.getTotalCnt(searchField,searchWord);

%>

<jsp:include page="Link.jsp"></jsp:include>

<h2>목록보기(List)</h2>

총건수 : <%=totalCnt %>

<!-- 검색폼 -->
<form method="get">
<table border="1" width="90%">
	<tr >
		<td align="center">
			<select name="searchField">
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
		<input type="text" name="searchWord" value="<%= searchWord%>">
		<input type="submit" value="검색하기">
		</td>
		
	</tr>
</table>
</form>
	<table border='1' width="90%">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>id</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		
<%
	if(boardList.isEmpty()){
%>
<tr>
	<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
</tr>

<%}else{
	for(Board board : boardList){
	
%>
	<tr >
		<td><%=board.getNum() %></td>
		<td><a href="View.jsp?num=<%=board.getNum()%>"><%=board.getTitle() %></a></td>
		<td><%=board.getContent() %></td>
		<td><%=board.getId() %></td>
		<td><%=board.getPostdate() %></td>
		<td><%=board.getVisitCount() %></td>
	</tr>
	<%} 

}%>
</table>


<%if(session.getAttribute("userId") != null){
	
	
%>
<table border="1" width="90%">
	<tr>
		<td align="right">
			<input type="button" value="글쓰기" onclick="location.href='Write.jsp'">
		</td>
	</tr>
</table>
<%} %>






</body>
</html>