<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
<script>
	window.onload = function(){
		// 만약 '하루 동안 열지 않음' 체크박스를 체크하고 새로고침하면 에러가 뜨는 것을 알 수 있다.
		// 그 이유는 window.onload가 실행되었는데 closeBtn이 없기 때문에 'undefined'가 떠서 오류가 난 것이므로 밑의 코드처럼
		// 에러 처리해주었다.
		if(typeof closeBtn != 'undefined'){
			let closeBtn = document.querySelector("#closeBtn");
			closeBtn.addEventListener("click",function(){
				let popup = document.querySelector("#popup");
				if(document.querySelector("#inactiveToday").checked){
				// 체크박스가 체크되어 있으면 popFrm폼을 서브밋 처리 -> PopupCookie.jsp요청
				popFrm.submit();
					
				}else{
					popup.style.display = 'none';
				}
				// 쿠키를 생성 후 Main1로 redirect해준다.
	
			})
			
		}
			
		
		
		
	}
</script>
<title>쿠키를 이용한 팝업창 제어 ver 1.0 </title>
</head>
<body>

	<h1>쿠키를 이용한 팝업창 제어</h1>
	
	<% 
		// 쿠키에 PopupClose값이 등록되어 있지 않으면 팝업창을 보여준다.
		String cValue = CookieManager.readCookie(request, "PopupClose");
		if(!cValue.equals("Y")){
	%>
    <div id="popup">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	        <form name="popFrm" action="PopupCookie.jsp">
	            <input type="checkbox" id="inactiveToday" value="1" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
	        </form>
        </div>
    </div>
    <%} %>
</body>
</html>