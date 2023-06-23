<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>MVC모델2 게시판</h2>
<h4>총 게시물 수: ${totalCnt }</h4>
<c:set var="list" value="${requestScope.list}"></c:set>


<form method="get" name="searchForm">
<input type="hidden" name="pageNo">
	<table border="1" width="90%">
		<tr>
			<td align="center" colspan="6">
			
				<select name="searchField">
					<option value = "title" ${param.searchField eq "title" ? "selected" : "" }>제목</option>
					<option value = "content" ${param.searchField eq "content" ? "selected" : "" }>내용</option>
				</select>
				<input  type="text" name="searchWord" value="${param.searchWord}" >
				<input type="submit" value="검색하기">
			</td>
		</tr>
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<!-- 조회된 게시물이 없는경우 -->
				<tr>
					<td colspan="6">등록된 게시물이 없습니다.</td>
				</tr>
			</c:when>
		
		<c:otherwise>
		<c:forEach items="${list }" var="row" varStatus="loof">
		<tr>
			<td>${row.idx }</td>
			<td><a href="../mvcboard/view.do?idx=${row.idx }">${row.title }</a></td>
			<td>${row.name }</td>
			<td>${row.visitcount }</td>
			<td>${row.postdate }</td>
			<td><a href="">[Down]</a></td>
		</tr>
		</c:forEach>
		
		</c:otherwise>
		</c:choose>
		
		<tr>
			<td colspan="6" align="center"><%@ include file="../9페이지/PageNavi.jsp" %></td>
		</tr>
		<tr>
		
		
		<td colspan="6" align="right"><input type="button" value="글쓰기" onclick="location.href='../mvcboard/write.do'"></td>
		</tr>
	</table>
</form>


</body>
</html>