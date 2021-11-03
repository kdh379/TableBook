<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="data.dao.ScheduleDao"%>
<%@page import="data.dto.ScheduleDto"%>
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
	String introduce = multi.getParameter("introduce");
	//System.out.print(parking);
	int opening = Integer.parseInt(multi.getParameter("opening"));
	int closing = Integer.parseInt(multi.getParameter("closing"));
	int reststart = Integer.parseInt(multi.getParameter("reststart"));
	int restend = Integer.parseInt(multi.getParameter("restend"));
	//schedule table data받기
	int hall = Integer.parseInt(multi.getParameter("hall"));
	int room = Integer.parseInt(multi.getParameter("room"));
	/* ******************stime아직안받음! 구현 필요********************** */
	
	//menu table data받기
	String []menu = multi.getParameterValues("menu");
	String []price = multi.getParameterValues("price");
			
	
	
	//shop table처리
	//shdto
	ShopDto shdto = new ShopDto();
	shdto.setName(name);
	shdto.setTelephone(telephone);
	shdto.setTag(tag);
	shdto.setAddr(addr);
	shdto.setPhoto(photo);
	shdto.setParking(parking==null?"없음":"있음");
	shdto.setIntroduce(introduce);
	shdto.setOpening(opening);
	shdto.setClosing(closing);
	
	//shdao
	ShopDao shdao = new ShopDao();
	shdao.insertShop(shdto);
	
			
	//schedule table처리
	//scdto, scdao
	String shop_num = shdao.getRecentNum();  //방금 받은 shop데이터의 num값 (외래키로사용)
			
	ScheduleDao scdao = new ScheduleDao();
	//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	LocalDate now = LocalDate.now();
	
	//오픈 ~ 쉬는시간 시작
	String sdate="";
	for(int i=1; i<=5; i++){  //5일 가능하게
		
		sdate = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
	
		for(int j=opening; j<reststart; j++){
			ScheduleDto scdto = new ScheduleDto();
			scdto.setSdate(sdate);
			scdto.setStime(j);
			scdto.setHall(hall);
			scdto.setRoom(room);
			scdto.setShop_num(shop_num);
			
			scdao.insertSchedule(scdto);
		}
		
		now = LocalDate.now().plusDays(i);
		
	}
	LocalDate now2 = LocalDate.now();
	//쉬는시간 끝 ~ 마감
	String sdate2="";
	for(int i=1; i<=5; i++){  //5일 가능하게
		
		sdate2 = now2.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		//System.out.println(sdate2);
	
		for(int j=restend; j<closing; j++){
			ScheduleDto scdto = new ScheduleDto();
			scdto.setSdate(sdate2);
			scdto.setStime(j);
			scdto.setHall(hall);
			scdto.setRoom(room);
			scdto.setShop_num(shop_num);
			
			scdao.insertSchedule(scdto);
		}
		
		now2 = LocalDate.now().plusDays(i);
		
	}
	
	
	
	
	//menu table 처리
	MenuDao mdao = new MenuDao();
	for(int i=0; i<menu.length; i++){
		
		MenuDto mdto = new MenuDto();
		mdto.setShop_num(shop_num);
		mdto.setMenu(menu[i]);
		mdto.setPrice(Integer.parseInt(price[i]));
		
		mdao.insertMenu(mdto);
		
	}
	//******************나중에 index하게되면 경로 추가해야됨***********************
	response.sendRedirect("../index.jsp"); 


}catch(Exception e){
	System.out.println("오류 메세지: "+e.getMessage());
}
%>
</body>
</html>