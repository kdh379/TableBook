<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.Header {
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    display: -webkit-box;
    display: -webkit-flex;
    -moz-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    -webkit-flex-direction: row;
    -webkit-box-direction: normal;
    -webkit-box-orient: horizontal;
    -moz-justify-content: flex-start;
    justify-content: flex-start;
    -webkit-justify-content: flex-start;
    -webkit-box-pack: start;
    -ms-flex-pack: start;
    -moz-align-items: center;
    align-items: center;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 900;
    width: 100%;
    height: 61
px
;
    border-bottom: 1
px
 solid #DBDBDB;
    box-sizing: border-box;
    box-shadow: 0 4px 11px rgb(0 0 0 / 10%);
    background-color: #FFFFFF;
}
</style>
</head>
<body>
<header class="Header Header--Transparent" data-page="home">
  <a href="/"
     class="Header__Logo"
     onclick="trackEvent('CLICK_HEADER_LOGO');">
    <i class="Header__LogoIcon"></i>
  </a>

  <div class="Header__SearchBox">
    <i class="Header__SearchIcon"></i>

    <label class="Header__SearchInputWrap">
      <input type="text" class="Header__SearchInput" placeholder="지역, 식당 또는 음식" value="" autocomplete="off" maxlength="50"/>
    </label>

    <button class="Header__SearchInputClearButton">CLEAR</button>
  </div>

  <ul class="Header__MenuList">
      <li class="Header__MenuItem Header__MenuItem--New">
        <a href="/eat_deals"
           class="Header__MenuLink"
           onclick="trackEvent('CLICK_EAT_DEALS')">
          <span class="Header__MenuText">EAT딜</span>
        </a>
      </li>

    <li class="Header__MenuItem">
      <a href="/top_lists"
         class="Header__MenuLink"
         onclick="trackEvent('CLICK_TOP_LIST')">
        <span class="Header__MenuText">맛집 리스트</span>
      </a>
    </li>

    <li class="Header__MenuItem">
      <a href="/mango_picks"
         class="Header__MenuLink"
         onclick="trackEvent('CLICK_MANGO_PICK')">
        <span class="Header__MenuText">망고 스토리</span>
      </a>
    </li>
  </ul>

  <ul class="Header__IconButtonList">
    <li class="Header__IconButtonItem only-mobile Header__IconButtonItem--MenuButton">
      <button class="MenuButton"
              onclick="trackEvent('CLICK_MENU');">
        <i class="MenuButton__Icon"></i>
      </button>
    </li>

    <li class="Header__IconButtonItem Header__IconButtonItem--UserRestaurantHistory">
      <button class="UserProfileButton"
              onclick="trackEvent('CLICK_PROFILE');">
        <i class="UserProfileButton__Picture"></i>
        <i class="UserProfileButton__PersonIcon"></i>
        <span class="UserProfileButton__HistoryCount">0</span>
      </button>
    </li>

    <li class="Header__IconButtonItem Header__IconButtonItem--CloseButton Header__IconButtonItem--Hide">
      <button class="Header__CloseButton"></button>
    </li>
  </ul>
</header>
</body>
</html>