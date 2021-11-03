<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap"
rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%

//이미지 업로드 실제경로
String realPath = getServletContext().getRealPath("/save");
System.out.println(realPath);

int uploadSize = 1024*1024*2;  //2MB
MultipartRequest multi = null;



try{
	multi = new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());  //try catch하기!


	//multi로 모든 폼데이터 읽기
	//shop table data받기
	String name = multi.getParameter("name");
	String telephone = multi.getParameter("telephone");
	String tag = multi.getParameter("tag");
	String addr = multi.getParameter("addr");
	String photo = multi.getFilesystemName("photo");  //실제업로드된파일명
	String parking = multi.getParameter("parking");
	//System.out.print(parking);
	int opening = Integer.parseInt(multi.getParameter("opening"));
	int closing = Integer.parseInt(multi.getParameter("closing"));
	//schedule table data받기
	int hall = Integer.parseInt(multi.getParameter("hall"));
	int room = Integer.parseInt(multi.getParameter("room"));
	/* ******************stime아직안받음! 구현 필요********************** */
	
	//menu table data받기
	String []menu = multi.getParameterValues("menu");
	String []price = multi.getParameterValues("price");
			
	
	
	//shop table처리
	//dto
	ShopDto shdto = new ShopDto();
	shdto.setName(name);
	shdto.setTelephone(telephone);
	shdto.setTag(tag);
	shdto.setAddr(addr);
	shdto.setPhoto(photo);
	shdto.setParking(parking==null?"없음":"있음");
	shdto.setOpening(opening);
	shdto.setClosing(closing);
	
	//dao
	ShopDao shdao = new ShopDao();
	shdao.insertShop(shdto);
	
	//******************나중에 index하게되면 경로 추가해야됨***********************
	response.sendRedirect("../index.jsp");   

	

}catch(Exception e){
	System.out.println("오류 메세지: "+e.getMessage());
}
%>
</body>
</html>