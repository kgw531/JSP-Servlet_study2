<%@page import="dto.Criteria"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
<%@ include file="../6세션/Link.jsp" %>

<%	
	// 검색조건
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	int pageNo = request.getParameter("pageNo") == null ? 1: Integer.parseInt(request.getParameter("pageNo"));
	
	Criteria criteria = new Criteria(searchField, searchWord, pageNo);
	NewBoardDao dao = new NewBoardDao();
	List<Board> list = dao.getList(criteria);
	//List<Board> list = dao.getListPage(criteria);
	
	
%>
	<h1>new</h1>
    <h2>목록 보기(List)</h2>
    <!-- 검색폼 --> 
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
        <!-- 목록의 내용 --> 
		<%
			if(list.isEmpty()){
				
		%>
		<tr>
			<td colspan="4" align="center">등록된 게시물이 없습니다.<td>
		</tr>
		<%}else{ 
			for(Board board : list){

		%>
        <tr align="center">
        	<td><%= board.getNum() %></td>
        	<td align="left"><a href="View.jsp?num=<%= board.getNum() %>"><%= board.getTitle() %></a></td>
        	<td align="center"><%= board.getId() %></td>
        	<td align="center"><%= board.getVisitCount() %></td>
        	<td align="center"><%= board.getPostdate() %></td>
        </tr>
        
       <%} %> 	
<%} %>

    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <%
    	if(session.getAttribute("userId") != null && !"".equals(session.getAttribute("userId"))){
    	
    %>
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button" onclick="location.href='Write.jsp'">글쓰기</button></td>
        </tr>
    </table>
    <%} %>
</body>
</html>
