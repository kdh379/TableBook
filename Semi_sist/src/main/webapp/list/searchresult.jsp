<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>TasteBook</title>
<!-- Favicon 즐겨찾기 아이콘(favorites icon)-->
<link rel="icon" type="image/x-icon" href="../assets/logo1.ico" />
<!--검색결과 CSS-->
<link href="css/liststyles.css" rel="stylesheet" />
</head>
<%-- <%
//db선언
MyBoardDao db=new MyBoardDao();

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

int totalCount; //총 글 수
int totalPage; //총 페이지 수
int startPage; //각 블럭의 시작페이지
int endPage; //각 블럭의 끝페이지
int start; //각 페이지의 시작번호
int perPage=3; //한 페이지에 보여질 글의 개수
int perBlock=5; //한 패이지에 보여지는 페이지 개수
int currentPage; //현재페이지
int no;


//총갯수
totalCount=db.getTotalCount();

//현재 페이지번호 읽기(단 null일 경우는 1페이지 설정)
if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

//총 페이지 개수 구하기
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각 블럭의 시작페이지
//예) 현재페이지:3 startPage:1, endPage:5
//예) 현재페이지:6 startPage:6, endPage:10
startPage=(currentPage-1)/perBlock*perBlock+1;

endPage=startPage+perBlock-1;

//만약 총 페이지 수가 8일 경우
//2번째 블럭은 start가 6 end가 10이 되어야 한다
//이때는 endPage를 8로 수정해줘야함
if(endPage>totalPage)
	endPage=totalPage;

//각 페이지에서 불러올 시작번호
//현재 페이지가 1일 경우 start는 1, 2일 경우 6
start=(currentPage-1)*perPage;

//각 페이지에서 필요한 게시글 가져오기...dao에서 만들었음
List<MyBoardDto>list=db.getList(start, perPage);

//각 글앞에 붙일 시작번호 구하기
//총 글이 20개일 경우 1페이지 20, 2페이지 15부터
//출력해서 1씩 감소해가면서 출력할것
no=totalCount-(currentPage-1)*perPage;
%> --%>
<body>
<div class="wrapper">
<div class="container">
<div class="row ng-scope">
    <div class="col-md-12">
       <%--  <p class="search-results-count"><b style="font-size: 20pt; font-weight: bold;">총 <%=totalCount %>개의 결과가 있습니다</b></p> --%>
        <section class="search-result-item">
            <a class="image-link" href="#"><img class="image" src="assets/img/food_img/fish.jpg">
            </a>
            <div class="search-result-item-body">
                <div class="row">
                    <div class="col-sm-9">
                        <h4 class="search-result-item-heading"><a href="#">제주향 생선구이</a></h4>
                        <p class="info">서울시 관악구 봉천동 238-9 1층</p>
                        <p class="description">30년째 자리를 지키고 있는 동네 맛집! 제주도에서 당일 올라온 생선! 신선함이 남달라요~</p>
                    </div>
                    <div class="col-sm-3 text-align-center">
                    	<p class="value3 mt-sm">1만 2천원~</p>
                        <p class="fs-mini text-muted">셋째주 일요일 휴무</p><button type="button" class="btnplus" onclick="location.href='#'">더보기</button>
                    </div>
                </div>
            </div>
        </section>
        <section class="search-result-item">
            <a class="image-link" href="#"><img class="image" src="assets/img/food_img/bbq.jpg">
            </a>
            <div class="search-result-item-body">
                <div class="row">
                    <div class="col-sm-9">
                        <h4 class="search-result-item-heading"><a href="#">훈스바베큐</a> <span class="badge bg-danger fw-normal pull-right">Hot!</span></h4>
                        <p class="info">서울시 용산구 이태원동 747-13</p>
                        <p class="description">고기 장인이 수년간 개발한 레시피! 최고급 생고기를 72시간 숙성하여 고기가 입에서 살살녹아요~</p>
                    </div>
                    <div class="col-sm-3 text-align-center">
                        <p class="value3 mt-sm">2만원 3천원~</p>
                        <p class="fs-mini text-muted">연중무휴</p><button type="button" class="btnplus" onclick="location.href='#'">더보기</button>
                    </div>
                </div>
            </div>
        </section>
        <section class="search-result-item">
            <a class="image-link" href="#"><img class="image" src="assets/img/food_img/curry.jpg">
            </a>
            <div class="search-result-item-body">
                <div class="row">
                    <div class="col-sm-9">
                        <h4 class="search-result-item-heading"><a href="#">마살라커리</a></h4>
                        <p class="info">경기도 안산시 단원구 원곡동 542-3 4층</p>
                        <p class="description">인도 현지인이 직접 요리하는 인도요리 전문점 현지의 맛을 느껴보세요~</p>
                    </div>
                    <div class="col-sm-3 text-align-center">
                        <p class="value3 mt-sm">1만 4천원~</p>
                        <p class="fs-mini text-muted">연중무휴</p><button type="button" class="btnplus" onclick="location.href='#'">더보기</button>
                    </div>
                </div>
            </div>
        </section>
        <section class="search-result-item">
            <a class="image-link" href="#"><img class="image" src="assets/img/food_img/sushi.jpg">
            </a>
            <div class="search-result-item-body">
                <div class="row">
                    <div class="col-sm-9">
                        <h4 class="search-result-item-heading"><a href="#">스시혼</a></h4>
                        <p class="info">강원도 춘천시 석사동 1033-1 1층</p>
                        <p class="description">혼을 담아 만들었어요~ 서울에서도 먹으러 오는 한국 최고의 스시 맛집! 예약없이는 먹지도 못해요!</p>
                    </div>
                    <div class="col-sm-3 text-align-center">
                        <p class="value3 mt-sm">1만 5천원~</p>
                        <p class="fs-mini text-muted">매주 월요일 휴무</p><button type="button" class="btnplus" onclick="location.href='#'">더보기</button>
                    </div>
                </div>
            </div>
        </section>
    
    <%-- <!-- 페이징처리 -->
	<div style="width: 600px; text-align: center;" class="container">
	<ul class="pagination">
	<%
	//이전
	if(startPage>1){%>
		<li>
			<a href="index.jsp?main=myboard/myboardlist.jsp?currentPage=<%=startPage-1%>">이전</a>
		</li>
	<%}
	
	for(int p=startPage;p<=endPage;p++){
		
		if(p==currentPage){
			%>
			<li class="active">
				<a href="index.jsp?main=myboard/myboardlist.jsp?currentPage=<%=p%>"><%=p %></a>
			</li>
		<%} else{
			%>
			<li>
				<a href="index.jsp?main=myboard/myboardlist.jsp?currentPage=<%=p%>"><%=p %></a>
			</li>
		<%}
	}
	
	//다음
	if(endPage<totalPage){%>
		
		<li>
			<a href="index.jsp?main=myboard/myboardlist.jsp?currentPage=<%=endPage+1%>">다음</a>
		</li>
		
	<%}
	
	%>
	
	</ul>
	</div> --%>
  </div>
</div>
</div>
</div>
</body>
</html>