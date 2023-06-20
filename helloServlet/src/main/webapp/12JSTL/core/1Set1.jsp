<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="java.util.Date"%>
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
	JSTL(JSP Standard Tag Library)
	 - JSP의 표준 태그 라이브러리를 이용하면 스크립틀릿을 사용하지 않고 태그를 사용하여 제어문, 반복문을 사용할 수 있다.
	 - 기본태그가 아닌 확장태그 이므로 사용하기위해 별도의 라이브러리가 필요하다.
	 - 메이븐레파지토리로 접근하여 jstl-1.2.jar 파일을 다운 받고 lib 폴더에 넣어준다.
	 
	 JSTL의 종류
	 	Core 태그 : 변수선언, 조건문/반복문. URL처리
	 	접두어 : C
	 	
	 	Formatting 태그 : 숫자, 날짜, 시간 포맷지정
	 	접두어 : fmt
	 	
	 JSTL을 사용하기 위한 순서 : 라이브러리 추가 - taglib 지시어 추가
 -->
 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 <!-- 
 	복붙 
 -->
 
 <!-- 
 	1. 변수선언
 	var : 변수명
 	value : 값
 	scope : 저장 영역

  -->
  <c:set var="directVar" value ="100" /> 
  <c:set var="elVar" value ="${directVar mod 5 }" /> 
  <c:set var="expVar" value ="<%=new Date() %>" /> 
  <c:set var="betweenVar">변수값 이렇게 설정</c:set>
  
  <h4>EL을 이용하여 변수 출력</h4>
  <ul>
  	<li>directVar : ${pageScope.directVar }</li>
  	<li>elVar : ${ elVar }</li>
  	<li>expVar : ${expVar }</li>
  	<li>betweenVar: ${betweenVar }</li>
  </ul>
  
  <h4>자바빈즈 생성1 - 생성자 사용</h4>
  <c:set var="personVal1" value='<%=new Member("id","","하니","2023-06-20") %>' scope="request"/>
  
  <ul>
  	<li>${personVal1.id }</li>
 	<li>${requestScope.personVal1.name }</li>
  </ul>
  
  <h3>자바빈즈 생성 후 값을 확인하기</h3>
  <h4>자바빈즈 생성2 - target,property 사용</h4>
  <!-- 
  	자바빈즈 생성 후 값을 변경해보자
  	target : 자바빈즈 변수명
  	property : 자바빈즈 속성명(멤버변수명)
  	value : 값 지정
   -->
   
   <c:set var="personVal2" value='<%=new Member("id","","하니","2023-06-20")  %>' scope="request"/>
  <ul>
  	<li>변경 전 name : ${personVal2.name }</li>
  	<li>변경 전 id : ${requestScope.personVal2.id }</li>
  </ul>
  
  <c:set target="${ personVal2}" property="id" value="hani1234"></c:set>
  <c:set target="${ personVal2}" property="name" value="하니1234"></c:set>
   
   <ul>
  	<li>변경 후 name : ${personVal2.name }</li>
  	<li>변경 후 id : ${requestScope.personVal2.id }</li>
  </ul>
  
  <h4>List 컬렉션</h4>
  
  <%
  	ArrayList<Member> list = new ArrayList<Member>();
  	list.add(new Member("hani","","하니",""));
  	list.add(new Member("nani","","나니",""));
  %>
  <c:set var="pList" value="<%=list %>" scope="request"/>
  
  <ul>
  	<li>name : ${pList[0].name }</li>
  	<li>id : ${requestScope.pList[0].id }</li>
  </ul>
  <ul>
  	<li>name : ${pList[1].name }</li>
  	<li>id : ${requestScope.pList[1].id }</li>
  </ul>
  
  <h4>Map 컬렉션 이용하기</h4>
  
  <%
  	Map<String,Member> map = new HashMap<String, Member>();
  	map.put("pArgs1",new Member("1","","1번",""));
  	map.put("pArgs2",new Member("2","","2번",""));

  %>
  <c:set var="map" value="<%=map %>" scope="request"/>
  <ul>
  	<li>name : ${map.pArgs1.name }</li>
  	<li>id : ${requestScope.map.pArgs1.id }</li>
  </ul>



</body>
</html>