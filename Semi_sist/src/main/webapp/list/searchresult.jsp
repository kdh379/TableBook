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
<!--검색결과 CSS-->
<link href="../css/liststyles.css" rel="stylesheet" />
</head>
<body>
<div class="wrapper">
<div class="container">
<div class="row ng-scope">
    <div class="col-md-9 col-md-pull-3">
        <p class="search-results-count"><b style="font-size: 20pt; font-weight: bold;">총 ##개의 결과가 있습니다</b></p>
        <section class="search-result-item">
            <a class="image-link" href="#"><img class="image" src="../assets/img/food_img/fish.jpg">
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
            <a class="image-link" href="#"><img class="image" src="../assets/img/food_img/bbq.jpg">
            </a>
            <div class="search-result-item-body">
                <div class="row">
                    <div class="col-sm-9">
                        <h4 class="search-result-item-heading"><a href="#">훈스바베큐</a> <span class="badge bg-danger fw-normal pull-right">Hot!</span></h4>
                        <p class="info">서울시 용산구 이태원동 747-13 2층</p>
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
            <a class="image-link" href="#"><img class="image" src="../assets/img/food_img/curry.jpg">
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
            <a class="image-link" href="#"><img class="image" src="../assets/img/food_img/sushi.jpg">
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
        <div class="text-align-center">
            <ul class="pagination pagination-sm">
                <li class="disabled"><a href="#">Prev</a>
                </li>
                <li class="active"><a href="#">1</a>
                </li>
                <li><a href="#">2</a>
                </li>
                <li><a href="#">3</a>
                </li>
                <li><a href="#">4</a>
                </li>
                <li><a href="#">5</a>
                </li>
                <li><a href="#">Next</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</div>
</div>
</body>
</html>