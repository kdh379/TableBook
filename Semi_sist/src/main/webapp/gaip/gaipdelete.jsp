<%@page import="java.io.File"%>
<%@page import="data.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>회원삭제</title>
</head>
<body>
<!-- dao에서 만든 비번체크, 삭제 메서드를 가져와서 처리 -->
<%
String num = request.getParameter("num");
String pass = request.getParameter("pass");

//DAO선언
LoginDao dao = new LoginDao();

boolean b=dao.isPassEqual(num, pass);

//비번체크 후 맞을경우 삭제 틀리면 경고후 이전으로
if(b){
	
	//게시글 지우기전에 업로드 이미지
		String photo=dao.getOneData(num).getPhoto();
		//업로드 경로 구하기
		String uploadPath=getServletContext().getRealPath("/photo");
		
		//파일생성
		File file=new File(uploadPath+"\\"+photo);
		//파일삭제
		if(file.exists()) //파일이 존재하면
			file.delete(); //파일삭제
	
	dao.deleteData(num);
	response.sendRedirect("../index.jsp?main=gaip/gaiplist.jsp");
	
}else{%>
	
	<script type="text/javascript">
	alert("비밀번호가 틀렸습니다");
	history.back();
	</script>
	
<%}
	


%>
</body>
</html>