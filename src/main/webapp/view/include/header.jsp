<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>천재 맘채널</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/froala_style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style2.css">
  <script>
    function doLogin() {
      let loginUrl = "${pageContext.request.contextPath}/view/Login/loginForm.jsp";
      location.href = loginUrl;
    }
    $(document).ready(function(){
      setProfileImage();

      $('.profile_group > a, .upload_area > a').on('click',function(e){
        e.preventDefault();
        $(this).siblings('.option_list').fadeIn(50);
      });
      // 정렬하기 버튼 클릭 시
      $('.option_list a, .modal_close').on('click',function(e){
        e.preventDefault();
        $('.option_list, #profileSidePopup, #menuPopup, #searchRecommend').fadeOut(50);
      });
      // 외부영역 클릭시 팝업 닫기
      $(document).mouseup(function (e){
        if($(".option_list, #profileSidePopup, #menuPopup, #searchRecommend").has(e.target).length === 0){
          $(".option_list, #profileSidePopup, #menuPopup, #searchRecommend").hide();
        }
      });
      // 프로필 이미지에 마우스 hover 시
      $('.profile_group > a').on('mouseover',function(e){
        e.preventDefault();
        $('.profile_hover').stop().fadeIn(100);
      });
      $('.profile_group > a').on('mouseout',function(e){
        e.preventDefault();
        $('.profile_hover').stop().fadeOut(100);
      });

      // 스크롤 시 헤더 상단 고정
      var navHeight = $("header").height();
      $(window).scroll(function(){
        var rollIt = $(this).scrollTop() >= navHeight;
        if(rollIt){
          $(".fix_header").fadeIn(150);
        }
        else{
          $(".fix_header").fadeOut(150);
        }
      });

      $('.menu_list > li, .profile_menu.dropdown > li').on('click',function(e){
        //    e.preventDefault();
        $(this).toggleClass('on');
      });
      $('.menu_btn').on('click',function(e){
        $('#menuPopup').fadeIn(100);
      });
      $('.search_btn').on('click',function(e){
        $('#searchRecommend').fadeIn(100);
      });

    });

    function setProfileImage(){
    }

    $(function(){
      const path = window.location.pathname;
      // 모바일 header 메뉴 노출 여부
      if(path.indexOf('/community/E-community-list.html') > -1
              || path.indexOf('/index.html') > -1){
        $("#_app_header").removeClass("header_02");
        $("#_header_nav").removeClass("mo_none");
      }

      // header 선택 메뉴 밑줄 표시
      $("ul.header_menu > li").removeClass("active");
      if(path.indexOf("/cs/") > -1){
        $("ul.header_menu > li:eq(5)").addClass("active");
      }else if(path.indexOf("/channel/") > -1){
        $("ul.header_menu > li:eq(4)").addClass("active");
      }else if(path.indexOf("/community/") > -1){
        $("ul.header_menu > li:eq(1)").addClass("active");
      }

      // 올리기 메뉴 클릭
      $("ul.upload_menu > li > a").click(function(){
        location.href = this.href;
      });

      // 프로필
      $("ul.profile_menu > li > a").click(function(){
        location.href = this.href;
      });

      $("#keywordSearch").keyup(function(e){
        if(e.keyCode==13){
          search($(this).attr("id"));
        }
      });

      $("#keywordSearch2").keyup(function(e){
        if(e.keyCode==13){
          search($(this).attr("id"));
        }
      });

      $("#mKeywordSearch").keyup(function(e){
        if(e.keyCode==13){
          search($(this).attr("id"));
        }
      });

    });
    function doLogin() {
      let loginUrl = "/view/Login/loginForm.jsp";
      location.href = loginUrl;
    }
    function logout() {
      $.post("/ssoLogout.do")
              .done(function (data) {
                if (data.success) {
                  let returnUrl = location.protocol + '//' + location.host + '/index.html';
                  document.location.href = "https://sso.chunjae.co.kr:446/api/auth/logout?returnUrl=" + returnUrl;
                } else {
                  alert(data.message);
                }

              });
    }
    function search(id){
      const keywordSearch = document.getElementById(id).value;
      if(keywordSearch.trim().length == 0){
        alert("검색어를 입력하세요.");
        return;
      }
      location.href = "/search/search_result.html?keyword=" + keywordSearch;
    }

  </script>
  <script src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/js/jquery-1.12.4.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/javascript/script.js"></script>
  <script src="javascript/jquery-1.12.3.js"></script>
  <script>
  jQuery(document).ready(function () {
    $('.navi>li').mouseover(function () {
      $('.submenu').stop().slideDown(500);
      $("#menu_bg").stop().slideDown(500);
    }).mouseout(function () {
      $('.submenu').stop().slideUp(500);
      $("#menu_bg").stop().slideUp(500);
    });
  });
  </script>

</head>
<body>

<div class="wrapper">
  <!-- header -->
  <div id="header">
    <div class="header_wrap " >
      <div id="menu_bg"></div>
      <header>
        <div class="inner">
          <a href="#none" class="menu_btn pc_none"><i class="ico menu"></i></a>
          <div class="header_group">
            <h1 class="logo"><a href="${pageContext.request.contextPath}/"></a></h1>
            <div class="search_bar_area mo_none">
              <input type="text" class="search_bar" id="keywordSearch" placeholder="검색어를 입력하세요." value="">
              <a href="javascript:search('keywordSearch')"><i class="ico search_01"></i></a>
            </div>
          </div>
          <div class="header_btn_area">
            <div>
              <c:choose>
                <c:when test="${empty loginMember.memId}">
                  <a href="/view/Login/loginForm.jsp">로그인</a>
                  <a href="/view/Login/signForm.jsp">회원가입</a>
                </c:when>
                <c:when test="${not empty loginMember.memId}">
                  <a href="javascript:void(0);" class="search_btn pc_none"><i class="ico search_01"></i></a>
                  <div class="profile_group">
                    <div class="profile_name">${loginMember.memId}님</div>
                    <a href="javascript:void(0)" onclick="doLogin()" class="profile"></a>
                    <a href="javascript:void(0)" class="profile_hover" onclick="doLogin()">로그인하기</a>
                    <div class="mo_none">
                    </div>
                  </div>
                  <a href="/member/logout.do">로그아웃</a>
                  <a href="/member/myinfo.do">내정보</a>
                </c:when>
              </c:choose>
            </div> <%-- content의 끝 --%>
          </div>
        </div>

        <nav class="header_nav">
          <div class="inner">
            <ul class="header_menu navi">
              <!-- 선택 시 해당 li에 active 클래스 추가해주세요 -->
              <li class="pc_none"><a href="/">홈</a></li>
              <li><a href="${pageContext.request.contextPath}/view/post/list.do">전체 게시판</a>
                <ul class="submenu" >
                  <li><a href="#"></a></li>
                  <li><a href="#"></a></li>
                  <li><a href="#"></a></li>
                  <li><a href="#"></a></li>
                </ul>
              </li>
              <li><a href="${pageContext.request.contextPath}/view/post/list.do">학년별 게시판</a>
                <ul class="submenu" >
                  <li><a href="#">1-2학년</a></li>
                  <li><a href="#">3-4학년</a></li>
                  <li><a href="#">5-6학년</a></li>
                  <li><a href="#"></a></li>
                </ul>
              </li>
              <li><a href="${pageContext.request.contextPath}/view/post/list.do">지역별 게시판</a>
                <ul class="submenu" >
                  <li><a href="#">서울/경기</a></li>
                  <li><a href="#">강원/충청</a></li>
                  <li><a href="#">경상/전라</a></li>
                  <li><a href="#">전라/제주</a></li>
                </ul>
              </li>
              <li class="line"><a href="${pageContext.request.contextPath}/ch/chlist.do">전체 채널</a>
                <ul class="submenu" >
                  <li><a href="#"></a></li>
                  <li><a href="#"></a></li>
                  <li><a href="#"></a></li>
                  <li><a href="#"></a></li>
                </ul>
              </li>
              <li class="line"><a href="${pageContext.request.contextPath}/view/cs/introduce.jsp">서비스 안내</a>
                <ul class="submenu" >
                  <li><a href="${pageContext.request.contextPath}/view/cs/introduce.jsp">맘채널 소개</a></li>
                  <li><a href="${pageContext.request.contextPath}/view/cs/notice/list.do">공지사항</a></li>
                  <li><a href="${pageContext.request.contextPath}/view/cs/qna/list.do">문의하기</a></li>
                  <li><a href="#"></a></li>
                </ul>
              </li>

            </ul>
          </div>
        </nav>
      </header>
    </div>
  </div>  <!-- header 끝 -->
  <!-- 상단 고정 헤더 -->
