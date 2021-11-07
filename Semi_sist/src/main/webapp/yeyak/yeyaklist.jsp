<%@page import="java.util.Date"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.ResDto"%>
<%@page import="data.dao.ResDao"%>
<%@page import="data.dto.LoginDto"%>
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

<title>예약관리 버튼 눌렀을 때 나오는 화면</title>
<style type="text/css">

.line {
	border-bottom: 1px solid lightgray;
}

.topline {
	border-top: 2px solid black;
}

th, td {
	height: 30px;
}

th {
	background-color: #FDE8C8;
}


</style>
</head>
<%
String root = request.getContextPath();

//로그인 상태 확인 후 입력폼 나타내기
String loginok = (String) session.getAttribute("loginok");

ResDao dao = new ResDao();

int totalCount;  //총 글수
int totalPage;   //총 페이지수
int startPage;   //각 블럭의 시작페이지
int endPage;   //각 블럭의 끝페이지
int start;   //각페이지의 시작번호
int perPage=3;  //한페이지에 보여질 글수
int perBlock=5;  //한페이지에 보여지는 페이지 개수
int currentPage;  //현재페이지
int no;

//총개수
totalCount=dao.getTotalCount();

//현재페이지번호 읽기(단 null일경우 1페이지 설정)
if(request.getParameter("currentPage")==null){
	currentPage=1;
}else{
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
}

//총페이지개수구하기
totalPage = totalCount/perPage + (totalCount%perPage==0?0:1);

//각블럭의 시작페이지
//예: 현재페이지:3, startPage:1,endPage:5
//예: 현재페이지:6, startPage:6,endPage:10;
startPage = (currentPage-1)/perBlock*perBlock+1;
endPage = startPage+perBlock-1;

//만약 총페이지수가 8일경우
//2번째 블럭은 start:6, endPage:10되야?
//이때는 endpage를 8로 수정해준다
if(endPage>totalPage){
	endPage=totalPage;
}

//각 페이지에서 불러올 시작번호
//현재페이지가 1 일경우 start는 1,  2일 경우6...
start=(currentPage-1)*perPage;

//각페이지에서 필요한 게시글 가져오기...dao에서 만든거
List<ResDto> list = dao.getList(start, perPage);

//각 글앞에 붙힐 시작번호 구하기
//총글이 20개일경우 1페이지는 20, 2페이지는 15부터
//출력해서 1씩 감소해가며 출력할것
no = totalCount-(currentPage-1)*perPage;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");


%>
<body>
<script language="JavaScript1.2">
top.document.title = 'TasteBook | 예약정보';
</script>

<%
if(loginok!=null){ //로그인 중일때만 입력폼 보이게 한다
	%>
	<jsp:include page="yeyakform.jsp"/>
	<hr align="left" width="700">
<%}
%>

<!-- 예약정보 전체출력 -->
<div style="margin-left: 100px;">
 <b style="font-size: 15pt;">총 <%=totalCount %>개의 예약이 있습니다.</b><br>
 
<%
LoginDao ldao = new LoginDao();

for(ResDto dto:list){
	
	String num = dto.getLogin_num();
	
%>

<table style="width: 400px;">
	<tr>
		<th width="100" colspan="2" class="topline line">
			<!-- <b><span class="bangmun"></span>방문예정/방문완료/예약취소 넣을부분</b> -->
			<%
			String date2 = dto.getRes_date().substring(0, 10);
			Date date = sdf2.parse(date2);
			Date now = new Date();
			if(loginok != null) {
			if (date.before(now)) {
				%> 
				<span class="bangmun"><b>방문예정</b></span>
				
				|<a href="yeyak/delete.jsp?num=<%=dto.getNum() %> &currentPage=<%=currentPage %>"
				style="color: red;">예약취소</a> 
				<%
			 } else {
				  %> 
				 <span class="bangmun"><b>방문완료</b></span>
				 <button type="button" style="float: right;"
				 onclick="location.href='<%=root %>/realindex.jsp?main=shop/reviewform.jsp?shop_num=<%=dto.getShop_num() %>'">리뷰작성</button>
				<%
	    	  }
			}
			%>
	      	<span class="payday"><%=sdf.format(dto.getPaymentdate()) %></span>
			</th>
		</tr>

		<tr>
			<th width="100" class="line">가게명</th>
			<td class="line"><%=dto.getShop_name()%></td>
		</tr>


		<tr>
			<th width="100">인원</th>
			<td><%=dto.getPersons()%></td>
		</tr>
		
		<tr>
			<th width="100">날짜</th>
			<td><%=dto.getRes_date()%></td>
		</tr>
		
		<tr>
			<th width="100">좌석</th>
			<td><%=dto.getSeat()%></td>
		</tr>
		
		<tr>
			<th width="100">가격</th>
			<td><%=dto.getPrice()%></td>
		</tr>
		</table>
		<br><br>
		<%
		}
		%>
</div>

<!-- 페이징 처리 -->
<div class="container">
  <ul class="pagination">
  <%
  //이전
  if (startPage > 1) {
  %>
	  <li>
	    <a href="realindex.jsp?main=yeyak/yeyaklist.jsp?currentPage=<%=startPage-1%>">이전</a>
	  </li>
  <%}
  %>
    <%
    for(int p=startPage; p<=endPage; p++){
    	if(p==currentPage){%>
    		<li class="active">
    		  <a href="realindex.jsp?main=yeyak/yeyaklist.jsp?currentPage=<%=p%>"><%=p %></a>
    		</li>
    	<%}else{%>
    		<li>
    		  <a href="realindex.jsp?main=yeyak/yeyaklist.jsp?currentPage=<%=p%>"><%=p %></a>
    		</li>
    	<%}
    }
    
    //다음
    if(endPage<totalPage){%>
    	
    	<li>
    	  <a href="realindex.jsp?main=yeyak/yeyaklist.jsp?currentPage=<%=endPage+1%>">다음</a>
    	</li>
    <%}
    
    %>
  
  </ul>

</div>
</body>
</html>