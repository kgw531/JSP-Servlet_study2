<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키값 출력하기</title>
</head>
<body>
	<h2>2. 쿠키값 확인하기</h2>
	<p>처음 접속 시 저장된 쿠키강벗는 경우 빈 페이지가 출력될 수 있다.</p>
	<%
		Cookie[] cookies = request.getCookies();
	
		if(cookies != null){
			for(Cookie cookie : cookies){
				String cookieName = cookie.getName();
				String cookieValue = cookie.getValue();
				
				out.print("쿠키 명 : " + cookieName + "<br>");
				out.print("쿠키 값 : " + cookieValue + "<br>");
				
			}
		}
	%>
</body>
</html>