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

<c:set var="list" value="${requestScope.list}"></c:set>
<form>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
			<th>첨부</th>
		</tr>
		<c:forEach items="${list }" var="row" varStatus="loof">
		<tr>
			<td>${row.idx }</td>
			<td>${row.title }</td>
			<td>${row.name }</td>
			<td>${row.visitcount }</td>
			<td>${row.postdate }</td>
			<td><a href="">[Down]</a></td>
		</tr>
		</c:forEach>
		
	</table>
</form>

</body>
</html>