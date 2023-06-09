<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - UseBean</title>
</head>
<body>
	<h2> userBean 액션태그 </h2>
	<h3>자바빈즈 생성하기</h3>
	
	
	<!-- 
		id : 자바빈즈 이름
		class : 패키지명을 포함한 클래스명
		scope : 저장될 영역
		
		dto패키지의 Person 객체를 생성 후 request영역에 저장(객체를 생성한 것과 같다)
		액션태그를 통해 자바빈을 생성시 기본 생성자를 `이용
		값을 세팅하기 위해 jsp:setProperty를 이용한다.
	-->
	<jsp:useBean id="person" class="dto.Person" scope="request"></jsp:useBean>
	
	<h3>setProperty 액션 태그로 자바빈스 속성 지정하기</h3>
	
	<!-- 
		name : 자바빈즈 이름
		property : 필드명
		value : 필드값
		
	 -->
	
	<jsp:setProperty property="name" name="person" value="하니"/>
	<jsp:setProperty property="age" name="person" value="20"/>
	
	<h3>setProperty 액션 태그로 자바빈스 속성 읽어오기</h3>
	<ul>
		<li>이름 : <jsp:getProperty property="name" name="person" /></li>
		<li>나이 : <jsp:getProperty property="age" name="person" /></li>
	</ul>
	
	<h3>request객체를 이용하여 자바빈즈 속성 읽기</h3>
	<%
		Person p = (Person)request.getAttribute("person");
	%>
	나이 : <%= p.getName() %><br>
	이름 : <%= p.getAge() %>
</body>
</html>