<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function go(page){
		document.searchForm.pageNo.value = page;
		document.searchForm.submit();
	}
</script>
</head>
<body>

<c:set var="pageDto" value="${pageDto }"/>
	
	<c:if test="${pageDto.prev }">
		<input type="button" value="이전" onclick="go(${pageDto.StartNo-1})">
		
	</c:if>

<c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" step="1" var="i">
	<input type="button" value="${i }" onclick="go(${i})">
</c:forEach>

<c:if test="${pageDto.next }">
	<input type="button" value="다음" onclick="go(${pageDto.endNo+1})">
	
</c:if>



</body>
</html>