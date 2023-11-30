<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
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
<%--  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />--%>
<%--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>--%>
  <script>
    function doLogin() {
      let loginUrl = "${pageContext.request.contextPath}/view/Login/loginForm.jsp";
      location.href = loginUrl;
    }
  </script>
  <script src="${pageContext.request.contextPath}/resources/javascript/script.js"></script>

</head>
<body>

<div class="wrapper">
  <!-- header -->
  <div id="header">
    <div class="header_wrap " >
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
            <a href="javascript:void(0);" class="search_btn pc_none"><i class="ico search_01"></i></a>
            <div class="profile_group">
              <div class="profile_name">${loginMember.memId}님</div>
              <a href="javascript:void(0)" onclick="doLogin()" class="profile"></a>
              <a href="javascript:void(0)" class="profile_hover" onclick="doLogin()">로그인하기</a>
              <div class="mo_none">
              </div>
            </div>
          </div>
        </div>
        <nav class="header_nav ">
          <div class="inner">
            <ul class="header_menu">
              <!-- 선택 시 해당 li에 active 클래스 추가해주세요 -->
              <li class="pc_none"><a href="/">홈</a></li>
              <li><a href="${pageContext.request.contextPath}/view/post/post.do">전체 게시판</a></li>
              <li><a href="${pageContext.request.contextPath}/view/post/post.do">학년별 게시판</a></li>
              <li><a href="${pageContext.request.contextPath}/view/post/post.do">지역별 게시판</a></li>
              <li class="line"><a href="/channel/all.html">전체 채널</a></li>
              <li class="line"><a href="${pageContext.request.contextPath}/view/cs/introduce.jsp">서비스 안내</a></li>
            </ul>
          </div>
        </nav>
      </header>
    </div>
  </div> <!-- header 끝 -->
  <!-- 상단 고정 헤더 -->