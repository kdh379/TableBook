<%@page import="data.dto.ScheduleDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ScheduleDao"%>
<%@page import="java.util.Vector"%>
<%@page import="data.dto.MenuDto"%>
<%@page import="data.dao.MenuDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?
family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">

<%
String root = request.getContextPath();

int price = 50000; //menu 테이블에서 값 가져올 것
String shop_num = request.getParameter("shop_num");
System.out.println(shop_num);
ShopDao dao = new ShopDao();
ShopDto dto = dao.getOneShop(shop_num);

/* MenuDao mdao = new MenuDao();
Vector<MenuDto> mlist = new Vector<MenuDto>();
mlist = mdao.getMenu(shop_num);
 */

ScheduleDao sdao = new ScheduleDao();
List<ScheduleDto> slist = new Vector<ScheduleDto>();
slist = sdao.getSchedulData(shop_num);
 

%>

<link href='<%=root %>/fullcalendar/main.css' rel='stylesheet' />
<script src='<%=root %>/fullcalendar/main.js'></script>
<script src="<%=root %>/fullcalendar/ko.js"></script>
<%
Date now = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			},
			initialDate : '<%=sdf.format(now)%>',
			navLinks : true, // can click day/week names to navigate views
			businessHours : true, // display business hours
			editable : true,
			selectable : true,
			locale : "ko",
			dateClick : function(info) {
				//alert("Clicked on: " + info.dateStr); //클릭한 날짜
				//document.getElementById("info_date").innerHTML = info.dateStr;
				$("input[name=seldate]").attr("value",info.dateStr);
			}
		});
		calendar.render();
	});
</script>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}

.persons {
	width: 80px;
	height: 80px;
	float: left;
	border-radius: 100px;
	margin-left: 10px;
	font-size: 2em;
	text-align: center;
	line-height: 80px;
	border: 1px solid gray;
	cursor: pointer;
}
.clicked {
	background-color: orange;
	color: white;
}

.btn-normal {
	border: 0;
	outline: none;
}

.btn-active {
	border: 0;
	outline: none;
	background-color: #ffbe0a;
	color: white;
}

</style>

<%


%>
<title>TasteBook</title>
<!-- Favicon 즐겨찾기 아이콘(favorites icon)-->
<link rel="icon" type="image/x-icon" href="../assets/logo1.ico" />
</head>
<body>
	<form name="pay" action="paymentform.jsp" method="post" style="width: 1200px; margin-left: 200px;">
		<input type="hidden" name="shop_num" value="<%=shop_num %>"> <!-- 가게번호 -->
		<span class="glyphicon glyphicon-chevron-left" onclick="history.back()"
		style="font-size: 2em; cursor: pointer;"></span>
		<b style="font-size: 2.5em;"><%=dto.getName() %></b>
		<div>
		<div id='calendar' style="width: 600px; position: absolute; margin-left: 20px; margin-top: 50px;" align="left"></div>
		<div style="margin-left: 700px;">
		<br><br>
		
		
		<!-- 날짜 선택 -->
		<div id="seldate" align="left">
			<b style="font-size: 15pt; display: inline;">예약날짜: </b>
			<!-- <span id="info_date" style="font-size: 15pt;"></span> -->
			<input type="text" name="seldate" style="font-size: 15pt; width: 150px; display: inline;" class="form-control"
			required="required" readonly="readonly">
			<div align="right" style="display: inline; float: right;">
				<input type="button" value="시간 선택" style="display: inline;" class="btn btn-warning btn-lg" onclick = "timecheck()">
			</div>
			<input type="hidden" name="seldate" required="required">
		</div>
		<br>
		
		
		<!-- 시간 확인 -->
		
		<div id="time" align="left">
			<input type="hidden" name="seltime">
		</div>
		<br>
		
		<!-- 룸/홀 선택 -->
		<div id="seatsel">
			<span style="font-size: 13pt; display: inline; font-weight: bold;">좌석 및 시간</span>
			<input type="text" name="selseat" maxlength="8" class="form-control"
				required="required" style="width: 120px; font-size: 13pt; font-weight: bold; margin-left: 10px; display: inline;" readonly="readonly">
			<span id="seltime" style="font-size: 15pt; font-weight: bold;"></span>
		</div>
		<br>
		
		<!-- 인원선택 -->
		
		<div class="perlist" align="left">
		<b style="font-size: 13pt;">인원수</b>
		<% for(int i=1; i<=5; i++) {
			%>
			<%-- <input type="radio" name="persons" value="<%=i %>"
			style="width: 20px; height: 20px;" required="required">
			<b style="font-size: 15pt;"><%=i %>명</b> --%>
			<input type="button" name="person" class="btn-p btn-normal" value="<%=i %>명"
			style="border-radius: 50%; width: 70px; height: 70px; font-size: 13pt;" required="required">
			<%
		}%>
			<input type="hidden" name="selper">
		</div>
		<br>
		
		<!-- 결과 div -->
		
		<b style="font-size: 20pt;">메뉴 선택</b>
	<br>
	<table class="table table-bordered" style="width: 500px;">
		<caption><span class="label label-warning">인원에 따른 예약 보증금이 발생합니다.</span></caption>
		<tr>
			<th width="150px;">
				<span style="color: gray">1인당 예약금</span>
			</th>
			<td align="right">
				<span><%=price %>원</span>
				<input type="hidden" name="price" value="<%=price %>">
			</td>
		</tr>
		
		<tr>
			<th width="150px;">
				<span style="color: gray">x 총 예약 인원</span>
			</th>
			<td align="right">
				<span id="persons"></span>
			</td>
		</tr>
		
		<tr>
			<th align="left">
				<b style="text-align: left; font-size: 15pt; font-weight: 2px;">합계</b>
			</th>
			<td align="right">
				<span id="totalPrice" style="text-align: right; font-size: 15pt; font-weight: 2px;"></span>
				<input type="hidden" name="totalPrice">
			</td>
		</tr>
		
		<tr>
			<td style="background-color: lightgray" colspan="2">
				<span style="font-size: 8pt;">*3일전 취소: 100% 환불</span><br>
				<span style="font-size: 8pt;">*2일전 취소: 50% 환불</span>
			</td>
		</tr>
	</table>
	<div align="right">
		<input type="button" class="btn btn-warning" value="결제"
		style="width: 120px; height: 60px; font-size: 15pt;" onclick="payment()">
	</div>
	</div>
	</div>
	</form>
	
	<script type="text/javascript">
	
	var menuLinks = document.querySelectorAll(".btn-t");
	var perLinks = document.querySelectorAll(".btn-p");
	var seatLinks = document.querySelectorAll(".btn-s");
	
	function clickTimeHandler() {
		for(var i=0; i<menuLinks.length; i++) {
			menuLinks[i].classList.remove("btn-active");
		}
		this.classList.add("btn-active");
	}
	
	function clickPersonHandler() {
		for(var i=0; i<perLinks.length; i++) {
			perLinks[i].classList.remove("btn-active");
		}
		this.classList.add("btn-active");
	}
	
	function clickSeatHandler() {
		for(var i=0; i<seatLinks.length; i++) {
			seatLinks[i].classList.remove("btn-active");
		}
		this.classList.add("btn-active");
	}
	
	for (var i=0; i<menuLinks.length; i++) {
		menuLinks[i].addEventListener("click", clickTimeHandler);
		menuLinks[i].addEventListener("click", function () {
			//alert($(this).attr("value"));
			$("input[name=seltime]").attr("value",$(this).attr("value"));
		});
	}
	
	for (var i=0; i<perLinks.length; i++) {
		perLinks[i].addEventListener("click", clickPersonHandler);
		perLinks[i].addEventListener("click", function () {
			
			//alert($(this).attr("value"));
			$("input[name=selper]").attr("value",$(this).attr("value"));
			document.getElementById("persons").innerHTML = $(this).attr("value");
			
			
			var person = $(this).attr("value");
			var num = person.substring(0,1);
			var totalPrice = <%=price %> * num;
			
			document.getElementById("totalPrice").innerHTML = totalPrice;
			$("input[name=totalPrice]").attr("value",totalPrice);
		});
	}
	
	for (var i=0; i<seatLinks.length; i++) {
		seatLinks[i].addEventListener("click", clickSeatHandler);
		seatLinks[i].addEventListener("click", function () {
			//alert($(this).attr("value"));
			$("input[name=selseat]").attr("value",$(this).attr("value"));
		});
	}
	
	function payment() {
		
		var pop_title = "Payment";
		
		var _left = Math.ceil((window.screen.width - 550)/2);
		var _top = Math.ceil((window.screen.height - 900)/2);
		
		var payWin = window.open("", pop_title, "width=550, height=900, toolbar=no, left="+_left+", top="+_top);
		var frm = document.pay;
		frm.target = pop_title;
		frm.action = "<%=root%>/res/paymentform.jsp";
		frm.submit();
	}
	
	function timecheck() {
		
		var pop_title = "TimeCheck";
		
		var chkWin = window.open("", pop_title, "width=1000, height=500, toolbar=no");
		var frm = document.pay;
		frm.target = pop_title;
		frm.action = "<%=root%>/res/timecheck.jsp";
		frm.submit();
		
	}
	
	</script>
	
</body>
</html>