<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>자바빈을 활용한 매개변수 전달</h2>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="person" class="dto.Person" scope="request"></jsp:useBean>
	이름 : <jsp:getProperty property="name" name="person"/><br>
	나이 : <jsp:getProperty property="age" name="person"/>
	
	<h2>forward된 페이지에서 매개변수 확인!</h2>
	<%=request.getParameter("param1") %><br>
	<%=request.getParameter("param2") %><br>
	<%=request.getParameter("param3") %><br>
	
	<h2>jsp:include 페이지에 파라메터 넘기기</h2>
	<jsp:include page="inc/ParamInclude.jsp">
		<jsp:param value="서울 구로구" name="loc1"/>
		<jsp:param value="개봉동" name="loc2">
	</jsp:include>
</body>
</html>