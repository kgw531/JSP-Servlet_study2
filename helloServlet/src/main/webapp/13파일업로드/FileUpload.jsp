<%@page import="fileupload.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function validateForm(form){
	if(form.name.value == ''){
		alert("작성자를 입력해주세요.");
		form.name.focus();
		return false;
	}
	if(form.title.value == ''){
		alert("제목을 입력해주세요.");
		form.title.focus();
		return false;
	}
	if(form.attachedFile.value == ''){
		alert("첨부파일을 넣어주세요.");
		return false;
	}
	
	if(document.querySelectorAll("[name=category]:checked").length==0){
		alert("카테고리를 선택해주세요.");
		return false;
	}



}
</script>
</head>
<body>
	<h3>파일 업로드</h3>
	
	<!-- 
	파일을 업로드 하기 위해 라이브러리(cos.jar) 추가 후  form태그의 속성을 변경 
	method : post
	enctype : multipart/form-data
	-->
	
	<!-- 사용자 입력 체크 로직 추가(유효성검사 or validation check) -->
	<form action="UploadProcess.jsp" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
		<p>
			작성자 : <input type="text" name="name" value="하니">
		</p>
		<p>
			제목 : <input type="text" name="title" value="제목">
		</p>
		<p>
			카테고리 : 
			<input type="checkbox" name="category" value="사진" checked>사진
			<input type="checkbox" name="category" value="과제">과제
			<input type="checkbox" name="category" value="워드">워드
			<input type="checkbox" name="category" value="음원">음원

		</p>
		<p>
			첨부파일 : <input type="file" name="attachedFile" multiple="multiple">
		</p>


		<input type="submit" value="전송하기">
	</form>

	
	
	<!-- 
		붙여넣기
	 -->
	 
	 <h3>다운로드</h3>
	 <a href="${pageContext.request.contextPath }/upload/화면 캡처 2023-06-20 170958.png" download="파일명">다운로드</a>
</body>
</html>