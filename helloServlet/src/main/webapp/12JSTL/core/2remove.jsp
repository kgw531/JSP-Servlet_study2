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
<c:set var="scopeVar" value="page Value"/><!-- 스코프를 지정하지 않으면 page영역 -->
<c:set var="scopeVar" value="Request Value" scope ="request"/>
<c:set var="scopeVar" value="Session Value" scope = "session"/>
<c:set var="scopeVar" value="Application Value" scope="application"/>

<h4>출력하기</h4>

<ul>
	<li>page : ${scopeVar }</li>
	<li>request : ${requestScope.scopeVar }</li>
	<li>session : ${sessionScope.scopeVar }</li>
	<li>application : ${applicationScope.scopeVar }</li>
</ul>

<h4>session 영역에서 삭제하기</h4>
<c:remove var="scopeVar" scope="ssession"/>
<ul>
	<li>page : ${scopeVar }</li>
	<li>request : ${requestScope.scopeVar }</li>
	<li>session : ${sessionScope.scopeVar }</li>
	<li>application : ${applicationScope.scopeVar }</li>
</ul>

<!-- 영역을 지정하지 않고 삭제하기 : 모든 영역에서 변수를 삭제 -->
<c:remove var="scopeVar"/>
</body>
</html>