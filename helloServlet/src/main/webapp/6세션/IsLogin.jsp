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
	if(session.getAttribute("userId") == null){
%>
		<script>
			alert("세션이 만료되었습니다.");
			login.href="/helloServlet/6세션/LoginForm.jsp";
		</script>
<% 		
	}
%>
</body>
</html>