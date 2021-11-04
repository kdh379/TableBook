<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.time.format.TextStyle"%>
<%@page import="java.time.DayOfWeek"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
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

<title>TasteBook</title>
<!-- Favicon 즐겨찾기 아이콘(favorites icon)-->
<link rel="icon" type="image/x-icon" href="../assets/logo1.ico" />
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

//데이터 받아오기
String seldate = request.getParameter("seldate"); //예약날짜
String seltime = request.getParameter("seltime"); //예약시간
String selper = request.getParameter("selper"); //인원수
String selseat = request.getParameter("selseat"); //좌석
String username = "닉네임"; //login테이블 nick 만들어야 함
String userhp = "010-1111-2222"; //login테이블 hp 만들어야 함
String totalPrice = request.getParameter("totalPrice"); //총 가격
String Shopname = "가게명"; //shop 테이블 name
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

//날짜
Date date = new Date(sdf.parse(seldate).getTime());
Calendar calendar = Calendar.getInstance();
calendar.setTime(date);	
String dayofweek = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, Locale.KOREAN);
String totalDate = seldate + "(" + dayofweek + ") " + seltime;

//가격 ###,###
NumberFormat nf = NumberFormat.getInstance();
totalPrice = nf.format(Integer.parseInt(totalPrice));

%>

<form name = "pay" action="paymentaction.jsp" style="display: inline-block; margin-left: 20px; margin-top: 30px; width: 500px;" class="form form-inline">

<span class="glyphicon glyphicon-chevron-left" onclick="history.back()"
style="font-size: 2em; cursor: pointer;"></span>
<b style="font-size: 3em;"><%=Shopname %></b>
<input type="hidden" name="shop_name" value="<%=Shopname %>"> <!-- Shop테이블 name 필요 -->
<input type="hidden" name="seat" value="<%=selseat %>">

<br><br>

<b style="font-size: 2em;">예약 정보</b><br><br>
<b style="font-size: 15pt;">일정</b>
<span style="font-size: 15pt; margin-left: 50px;"><%=totalDate %></span><br><br>
<input type="hidden" name="res_date" value="<%=totalDate %>"> <!-- 예약 일정 -->

<b style="font-size: 15pt;">인원</b>
<span style="font-size: 15pt; margin-left: 50px;"><%=selper %></span><br><br>
<input type="hidden" name="persons" value="<%=selper %>"> <!-- 선택한 인원수 -->

<b style="font-size: 15pt;">예약자</b>
<span style="font-size: 15pt; margin-left: 30px;"><%=username %>&nbsp;<%=userhp %></span><br>
<input type="hidden" name="login_num" value=""> <!-- login테이블 num 필요 -->

<hr style="border: 0; width: 500px; background: gray; height: 3px;
position: absolute;"><br><br><br>

<b style="font-size: 2em;">예약금 결제</b><br>
<span style="font-size: 8pt; color: blue;">예약금은 방문 시 환불처리되거나 차감 후 결제됩니다.</span><br><br>
<span style="font-size: 15pt;">1인 예약금 x<%=selper %></span>
<span style="font-size: 15pt; margin-left: 250px;"><%=totalPrice %>원</span><br>


<hr style="width: 500px; border: 0; background: lightgray; height: 1px; position: absolute;"><br><br>

<span style="font-size: 15pt; font-weight: bold;">총 예약금</span>
<span style="font-size: 15pt; font-weight: bold; margin-left: 310px;"><%=totalPrice %>원</span><br><br>
<input type="hidden" name="price" value="<%=totalPrice %>"> <!-- 총 가격 -->

<hr style="border: 0; width: 500px; background: gray; height: 3px;
position: absolute;"><br><br><br>

<b style="font-size: 2em;">결제 정보</b><br><br>


<span style="font-size: 15pt;">카드번호</span>
<input type="text" name="cardnumber" style="width: 70px; font-size: 13pt; text-align: center; margin-left: 120px;"
onkeyup="this.value=this.value.replace(/[^0-9]/g, '')" placeholder="****" required="required" maxlength="4">

<input type="password" name="cardnumber" style="width: 70px; font-size: 13pt; text-align: center;"
onkeyup="this.value=this.value.replace(/[^0-9]/g, '')" placeholder="****" required="required" maxlength="4">

<input type="password" name="cardnumber" style="width: 70px; font-size: 13pt; text-align: center;"
onkeyup="this.value=this.value.replace(/[^0-9]/g, '')" placeholder="****" required="required" maxlength="4">

<input type="text" name="cardnumber" style="width: 70px; font-size: 13pt; text-align: center;"
onkeyup="this.value=this.value.replace(/[^0-9]/g, '')" placeholder="****" required="required" maxlength="4">
<br><br>

<span style="font-size: 15pt;">유효기간</span>
<input type="text" name="cardexpiry" style="width: 100px; text-align: center; margin-left: 20px;"
placeholder="MM/YY" onkeyup="inputSlashFormat(this)" required="required" maxlength="5">

<span style="font-size: 15pt; margin-left: 100px;">CVC</span>
<input type="text" name="cardnumber" style="width: 70px; font-size: 13pt; text-align: center; margin-left: 20px;"
onkeyup="this.value=this.value.replace(/[^0-9]/g, '')" placeholder="***" required="required" maxlength="3">

<br><br>

<button type="button" class="btn btn-danger btn-block" value="<%=totalPrice %>원 결제하기"
style="font-size: 15pt; font-weight: bold;" onclick="payment()"><%=totalPrice %>원 결제하기</button>

</form>

<script type="text/javascript">
	$("#card").keyup(function () {
		if(this.value.length >= this.maxLength) {
			$(this).next().focus();
		}
	});
	
	function inputSlashFormat(obj) {
	     obj.value = slash(unslash(obj.value));
	 }

	 function slash(str) {
	     str = String(str);
	     return str.replace(/(\d)(?=(?:\d{2})+(?!\d))/g, '$1/');
	 }

	 function unslash(str) {
	     str = String(str);
	     return str.replace(/[^\d]+/g, '');
	 }
	 
	 
	 //팝업 닫은 후 submit 액션
	 function payment() {
		
		 var f = document.forms.pay;
		 
		opener.name = "parentPage";
		f.target = opener.name;
		f.submit();
		self.close();
	}
</script>
</body>
</html>