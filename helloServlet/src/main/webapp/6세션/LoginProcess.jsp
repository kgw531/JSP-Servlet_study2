<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
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
	String id =	request.getParameter("user_id");
	String pw =	request.getParameter("user_pw");
	
	MemberDao dao = new MemberDao();
	Member member = dao.login(id, pw);
	
	if(member != null){
		//로그인 성공 -> 세션에 member객체를 저장
		session.setAttribute("userId", member.getId());
		session.setAttribute("member",member);
		
		response.sendRedirect("Board.jsp");
		
	}else{
		//로그인 실패 -> loginForm페이지로 이동, 오류메세지 출력
		request.setAttribute("loginErrMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		
		//loginForm.jsp로 이동
		// request 영역을 공유하기 위해 forward 사용
		request.getRequestDispatcher("Board.jsp").forward(request,response);
	}
	
%>

<h2>목록보기(List)</h2>
<table border='1'>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>id</th>
		<th>등록일</th>
		<th>조회수</th>
	</tr>
</table>

</body>
</html>