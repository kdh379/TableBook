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

<link href='../fullcalendar/main.css' rel='stylesheet' />
<script src='../fullcalendar/main.js'></script>
<script src="../fullcalendar/ko.js"></script>
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
				document.getElementById("info_date").innerHTML = info.dateStr;
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

.btn-active {
	outline: none;
	background-color: red;
	color: white;
}

</style>

<%
int price = 50000; //menu 테이블에서 값 가져올 것

%>
<title>Insert title here</title>
</head>
<body>
	<form action="paymentform.jsp">
		<div id='calendar' style="width: 600px; position: absolute; margin-left: 20px;" align="left"></div>
		<div style="margin-left: 700px;">
		<br><br>
		<div id="seldate" align="left">
			<b style="font-size: 15pt;">예약날짜: </b>
			<span id="info_date" style="font-size: 15pt;"></span>
			<input type="hidden" name="seldate" required="required">
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
			<input type="button" name="person" class="btn-p" value="<%=i %>명"
			style="border-radius: 50%; width: 70px; height: 70px; font-size: 13pt;" required="required">
			<%
		}%>
			<input type="hidden" name="selper">
		</div>
		<br>
		
		<!-- 시간선택 -->
		
		<div id="time" align="left">
			<input type="button" name="time" class="btn-t" value="오후 12:00"
			style="width:120px; height: 60px; font-size: 15pt;">
			<input type="button" name="time" class="btn-t" value="오후 1:00"
			style="width:120px; height: 60px; font-size: 15pt;">
			<input type="button" name="time" class="btn-t" value="오후 5:00"
			style="width:120px; height: 60px; font-size: 15pt;">
			<input type="button" name="time" class="btn-t" value="오후 6:00"
			style="width:120px; height: 60px; font-size: 15pt;">
			
			<input type="hidden" name="seltime">
		</div>
		
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
	<div align="right" style="margin-right: 200px;">
		<input type="submit" class="btn btn-danger" value="결제"
		style="width: 120px; height: 60px; font-size: 15pt;">
	</div>
	</div>
	</form>
	
	<script type="text/javascript">
	
	var menuLinks = document.querySelectorAll(".btn-t");
	var perLinks = document.querySelectorAll(".btn-p");
	
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
	
	for (var i=0; i<menuLinks.length; i++) {
		menuLinks[i].addEventListener("click", clickTimeHandler);
		menuLinks[i].addEventListener("click", function () {
			alert($(this).attr("value"));
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
	
	
	
	
	
	</script>
	
</body>
</html>