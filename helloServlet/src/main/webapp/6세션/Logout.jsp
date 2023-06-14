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
	// 로그아웃 방법1
	// 회원인증정보 속성 삭제
	session.removeAttribute("userId");
	session.removeAttribute("member");
	
	// 로그아웃 방법2
	// 세션 무효화
	session.invalidate();
	
	// 페이지 이동
	response.sendRedirect("LoginForm.jsp");
	

%>
</body>
</html>