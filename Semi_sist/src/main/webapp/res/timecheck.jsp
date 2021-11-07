<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dao.ScheduleDao"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.ScheduleDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src = "https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<style type="text/css">

.btn-active {
	border: 0;
	outline: none;
	background-color: #ffbe0a;
	color: white;
}

</style>

<title>Insert title here</title>
</head>
<body>
<%
String root = request.getContextPath();

String seldate = request.getParameter("seldate");
String shop_num = request.getParameter("shop_num");

ShopDao dao = new ShopDao();
ShopDto dto = dao.getOneShop(shop_num);

System.out.println(shop_num);
System.out.println(seldate);


ScheduleDao sdao = new ScheduleDao();
List<ScheduleDto> slist = new Vector<ScheduleDto>();
slist = sdao.getSchedulData(shop_num);

%>
<form action="" style="margin-left: 20px; width: 750px;" >
<b style="font-size: 2em;">시간 선택</b> <br>
<span style="font-size: 13pt;">가게명 : <b><%=dto.getName() %></b></span><br><br>


<img alt="" src="<%=root %>/res/room.jpg"> 개별룸<br>
<%
//개별룸 좌석 시간
for(ScheduleDto sdto : slist){
	int stime = sdto.getStime();
	String strdate = "";
	String strtime = "";
	if(sdto.getSdate().equals(seldate)) {
		if(stime > 12) {
			strtime = "오후 " + String.valueOf((stime-12)) + "시";
		}
		if(sdto.getRoom() == sdto.getRoom_cnt()) {
			%>
			<input type="button" name="time" class="btn-t btn-normal" value="룸 <%=strtime %>"
			style="width:100px; height: 40px; font-size: 13pt;" disabled="disabled">
			<%
		} else {
		%>
		<input type="button" name="time" class="btn-t btn-normal" value="룸 <%=strtime %>"
		style="width:100px; height: 40px; font-size: 13pt;">
		<%
		}
	}
}
//홀 좌석 시간
%>
<br><br>
<img alt="" src="<%=root %>/res/hall.jpg"> 홀<br>
<%
for(ScheduleDto sdto : slist){
	int stime = sdto.getStime();
	String strdate = "";
	String strtime = "";
	if(sdto.getSdate().equals(seldate)) {
		if(stime > 12) {
			strtime = "오후 " + String.valueOf((stime-12)) + "시";
		}
		if(sdto.getHall() == sdto.getHall_cnt()) {
			%>
			<input type="button" name="time" class="btn-t btn-normal" value="홀 <%=strtime %>"
			style="width:100px; height: 40px; font-size: 13pt;" disabled="disabled">
			<%
		} else {
		%>
		<input type="button" name="time" class="btn-t btn-normal" value="홀 <%=strtime %>"
		style="width:100px; height: 40px; font-size: 13pt;">
		<%
		}
	}
}
%>
<br>
<div align="right">
<input type="hidden" name="seltime">
<button type="button" class="btn btn-warning btn-lg" id="btnuse">확인</button>
</div>
</form>
<script type="text/javascript">

var timeLinks = document.querySelectorAll(".btn-t");


function clickTimeHandler() {
	for(var i=0; i<timeLinks.length; i++) {
		timeLinks[i].classList.remove("btn-active");
	}
	this.classList.add("btn-active");
}

for (var i=0; i<timeLinks.length; i++) {
	timeLinks[i].addEventListener("click", clickTimeHandler);
	timeLinks[i].addEventListener("click", function () {
		alert($(this).attr("value"));
		$("input[name=seltime]").attr("value",$(this).attr("value"));
	});
}

$("#btnuse").click(function () {
	
	//값 얻기
	var seltime = $("input[name=seltime]").val();
	
	//부모창에 값 보내기
	opener.pay.selseat.value=seltime;
	
	//현재창 닫기
	window.close();
});

</script>
</body>
</html>