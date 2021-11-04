<%@page import="data.dao.LoginDao"%>
<%@page import="data.dto.LoginDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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

<title>회원가입</title>
</head>
<body>
	<%
	//한글엔코딩
	request.setCharacterEncoding("utf-8");

	//업로드에 필요한 변수선언
	//업로드할 경로(톰캣에 올라가는 프로젝트 경로)
	String realFolder = getServletContext().getRealPath("/photo");
	System.out.println(realFolder);

	//업로드 사이즈
	int uploasSize = 1024 * 1024; //1mb

	try {
		//생성자파라미터
		//request,업로드폴더,업로드사이즈,한글타입,DefaultRename
		MultipartRequest multi = new MultipartRequest(request, realFolder, uploasSize, "utf-8",
		new DefaultFileRenamePolicy());

		//데이터 읽어서 dto담기
		String id = multi.getParameter("id");
		String pass = multi.getParameter("pass");
		String pass2 = multi.getParameter("pass2");
		String nick = multi.getParameter("nick");
		String hp = multi.getParameter("hp");
		String email = multi.getParameter("email1") + "@" + multi.getParameter("email2");

		//실제업로드 이미지이름 읽어오기
		String photo = multi.getFilesystemName("photo");

		LoginDto dto = new LoginDto();
		dto.setId(id);
		dto.setPass(pass);
		dto.setNick(nick);
		dto.setEmail(email);
		dto.setHp(hp);
		dto.setPhoto(photo);

		//dao선언후에 insert호출
		LoginDao dao = new LoginDao();

		dao.insertData(dto);

		//gaipsuccess로 이동
		response.sendRedirect("../realindex.jsp?main=gaip/gaipsuccess.jsp?id=" + id);
	} catch (Exception e) {
		System.out.println("업로드오류: " + e.getMessage());
	}
	%>
</body>
</html>