<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	쿠키, 헤더값을 읽을 수 있는 내장객체를 제공
	
	cookie : 쿠키를 읽을 때 사용
	header : request.getHeader(헤더명)와 동일하게 헤더값을 읽을 때 사용
	headerValues : request.getHeaders(헤더명)와 동일하게 헤더값을 배열 형태로 읽을 때 사용
	initParam : web.xml에 설정한 컨텍스트 초기화 매개변수를 읽을 때 사용
	pageContext : JSP의 pageContext 내장 객체와 동일한 역할
	
-->
<%
	// 쿠키 생성
	CookieManager.makeCookie(response, "ELCookie", "EL좋아요", 10);
%>

<h3>쿠키 값 읽기</h3>

<ul>
	<li>${cookie.ELCookie.value}</li>
</ul>
<h3>HTTP 해더 읽기</h3>
<ul>
	<li>host : ${header.host}</li>
	<li>user-agent : ${heder['user-agent'] }</li>
	<li>cookie : ${header.cookie }</li>
</ul>

<h3>컨텍스트 초기화 매개변수</h3>
<li>${initParam.INIT_PARAM }</li>
<li>${initParam.OracleDriver }</li>

<h3>컨텍스트 루트 경로 읽기</h3>
<li>${pageContext.request.contextPath }




</body>
</html>