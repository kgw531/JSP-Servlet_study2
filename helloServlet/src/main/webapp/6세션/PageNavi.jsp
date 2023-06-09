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
</head>
<body>
<script>
	function go(page){
		document.searchForm.pageNo.value=page;
		document.searchForm.submit();
	}
</script>
<c:set var="pageDto" value="${pageDto }"/>

<%
	if(pageDto.isPrev()){
		//1 페이지 호출
		out.print("<input type='button' value='<<'onclick = 'go(1)'>");
		
		// 이전페이지로 가기
		out.print("<input type='button' value='<'onclick = 'go("+ (pageDto.getStartNo()-1) +")'>");
	}
	
	for(int i = pageDto.getStartNo(); i<=pageDto.getEndNo(); i++){
		out.print("<input type='button' value='" + i + "' onclick='go(" + i + ")'>");
	}
	if(pageDto.isNext()){
		// 다음 페이지로 가기
		out.print("<input type='button' value='>' onclick = 'go("+(pageDto.getEndNo()+1)+")'>");
		
		//마지막 페이지 블럭
		out.print("<input type='button' value='>>' onclick = 'go("+ pageDto.getRealEnd() +")'>");
	}

	
	
%>



</body>
</html>