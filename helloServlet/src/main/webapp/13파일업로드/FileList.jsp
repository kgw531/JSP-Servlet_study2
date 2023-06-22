<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.FileDto"%>
<%@page import="fileupload.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>DB에 등록된 파일 목록 보기</h1>
<a href="FileUpload.jsp">파일 등록하기</a><br>
<form>
	<table border="1">
	<tr>
		<th>No</th>
		<th>작성자</th>
		<th>제목</th>
		<th>카테고리</th>
		<th>원본 파일명</th>
		<th>저장된 파일명</th>
		<th>작성일</th>
		<th></th>
	<tr>
	
	<c:set var="fileList" value="${requestScope.list }"/>
	<c:forEach items="${fileList }" var="dto">
	<tr>
		<td>${dto.idx}</td>
		<td>${dto.name}</td>
		<td>${dto.title}</td>
		<td>${dto.cate}</td>
		<td>${dto.ofile}</td>
		<td>${dto.sfile}</td>
		<td>${dto.postdate}</td>
		<td>
			<a href="Download.jsp?oName=${dto.ofile }&sName=${dto.sfile }">다운로드</a>
		</td>
	</tr>
	</c:forEach>
	
	</table>
</form>

</body>
</html>