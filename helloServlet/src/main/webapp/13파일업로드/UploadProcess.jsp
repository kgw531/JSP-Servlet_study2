<%@page import="common.JSFunction"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fileupload.FileDao"%>
<%@page import="fileupload.FileDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	// 저장할 디렉토리의 실제 경로
	String saveDirectory = "C:/upload";
	//saveDirectory = "C:/Users/user/git/JSP-Servlet_study2/helloServlet/src/main/webapp/upload";

	// 파일의 최대 크기(1MB/
	int maxPostSize = 1024 * 1000;
	
	// 인코딩 방식
	String encoding = "utf-8";
	
	try{
		MultipartRequest mr = new MultipartRequest(request,saveDirectory,maxPostSize,encoding);
		
		// 2. 새로운 파일명 생성
		// 동일한 파일명이 업로드 되는 경우, 기존 파일이 소실될 위험이 있으므로 파일명을 변경한다.
		String fileName = mr.getFilesystemName("attachedFile");
		
		
		
		// 첨부파일의 확장자.
		String ext = fileName.substring(fileName.lastIndexOf("."));
		
		// H: 0~23, S : millisecond
		// 현재 시간을 파일 이름으로 저장
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String oFileName = fileName.substring(0,fileName.lastIndexOf("."));
		
		String newFileName = oFileName + "_" + now + ext;
		
		System.out.println("원본 파일명 : " + fileName);
		System.out.println("신규 파일명 : " + newFileName);
		
		// 3. 파일명 변경
		File oldFile = new File(saveDirectory + File.separator+ fileName);
		File newFile = new File(saveDirectory + File.separator+ newFileName);
		oldFile.renameTo(newFile);

		
		
		
		out.print("파일이 저장되었습니다.");
		
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		// 체크박스인 경우, 배열로 반환받아 문자열로 연결하여 저장
		String[] categoryArr = mr.getParameterValues("category");
		StringBuffer sb = new StringBuffer();
		
		if(categoryArr == null){
			sb.append("선택없음");
		}else{
			for(String category : categoryArr){
				sb.append(category + ",");
			}
		}
		
		
		String ofileName = mr.getFilesystemName("attachedFile");
		
		System.out.println("title : " + title);
		System.out.println("category : " + sb.toString());
		System.out.println("ofileName : " + fileName);
		
		// DTO 생성
		FileDto dto = new FileDto("",name, title, sb.toString(), fileName,newFileName,"");

		// DAO 호출
		FileDao dao = new FileDao();
		int res = dao.insertFile(dto);
		
		if(res>0){
			out.print("등록되었습니다.");
			// 리스트 페이지 이동
			JSFunction.alertLocation("등록되었습니다.", "List.jsp", out);
		}else{
			out.print("db등록에 실패하였습니다.");
			// 이전 페이지로 이동
			JSFunction.alertBack("파일 등록에 실패했습니다.", out);
		}
		
	}catch (Exception e){
		e.printStackTrace();
		out.print(e);
		request.setAttribute("errorMassage", "파일 업로드 오류");
		
		// 이전 페이지로 이동
		JSFunction.alertBack("파일 등록에 실패했습니다.", out);
	}

%>
</body>
</html>