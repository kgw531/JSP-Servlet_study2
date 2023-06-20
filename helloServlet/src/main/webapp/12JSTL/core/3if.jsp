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
	<h4>JSTL의 if 태그로 짝수/홀수 판단하기</h4>
	<c:set var="number" value="101"/>
	<!-- 
		test : if문에서 사용할 조건 지정(표현언어 사용가능)
		var : 조건의 결과를 저장할 변수명
		scope : 변수가 저장 될 영역
	 -->
	 
	 <c:if test="${number mod 2 eq 0 }" var="result">
	 <!-- 조건이 참인 경우 실행 -->
	 ${number }는 짝수입니다.<br>
	 </c:if>
	 
	 result : ${result } <br>
	 
	 <h4>문자열 비교와 else 구문 흉내내기</h4>
	 <c:if test="${not result }" var="result2">
	 	${number }는 홀수입니다.
	 </c:if>
	 
	 <h4>문자열 비교와 else 구문 흉내내기</h4>
	<!--  문자열 변수 선언 -->
	<c:set var="str" value="JSP"/>
	<c:if test="${str eq 'Java' }" var="result3">
		문자열은 Java입니다.
	</c:if>
	<c:if test="${not result3 }">
		'java'가 아닙니다.
	</c:if>
	
	<h4>조건식 주의사항</h4>
	<c:if test="100" var="result4"></c:if>
	<!--	 
		표현언어를 사용하지 않은 경우
	 -->
	 
	 <c:if test="100" var="result4">
	 
	 </c:if>
	 
</body>
</html>