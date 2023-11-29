<%--
  Created by IntelliJ IDEA.
  User: sec
  Date: 2023-11-26
  Time: 오후 6:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <title>맘채널 - 임시 메인</title>
</head>
<body>
<div class="wrapper">
  <div class="container">
    <div class="header">
      <%-- 헤더의 타이틀 영역 : 로고, 검색창, 프로필 이미지 --%>
      <div class="header_title">
        <div class="logo" onclick="location.href='view/Main.jsp'">
          <div class="logo_inner">
            <p>맘채널</p>
          </div>
        </div>
        <div class="header_search_module">
          <div class="search_bar">
            <input type="text" placeholder="검색어를 입력하세요.">
            <button name="search" type="button" onclick="location.href=
            '../view/post.do?=${ searchWord }">
              검색
            </button>
          </div>
        </div>
        <div class="header_user_profile">
          <%-- 로그인 기능 구현 --%>
           <%--Todo: 로그인되어 있지 않은 경우, 프로필 이미지를 누르면 로그인 페이지로 이동--%>
          <%--Todo: 로그인되어 있는 경우, --%>
        </div>
      </div>
      <%-- nav 메뉴 --%>
      <nav class="menu">
        <ul>
          <li><a href="./post/by-region/Post.jsp">지역별</a></li>
          <li><a href="./post/by-grade/Post.jsp">학년별</a></li>
          <%--<li>전체 채널</li>--%>
          <li>서비스 안내</li>
        </ul>
      </nav>
    </div>
    <%-- header의 끝 --%>
    <div class="content">
      <div class="section" id="slider_container">
        <div class="slider_menu">
          <%-- Todo: 슬라이더 메뉴 구현 --%>
        </div>
      </div>
      <div class="section" id="best_posts">
        <%-- Todo: 추천 채널 영역 --%>
      </div>
      <div class="section" id="recent_posts">
        <%-- Todo: 최신 게시물 --%>
      </div>
      <div class="section" id="theme_1">
        <%-- Todo: 주제별 추천 게시물 --%>
      </div>
    </div>
    <%-- content의 끝 --%>
    <div class="footer">
      <div class="site_map">
        <div class="text_menu">
          <ul>
            <li>김지원</li>
            <li>이무현</li>
            <li>이양진</li>
          </ul>
        </div>
        <div class="select_box">
          <%--  --%>
        </div>
      </div>
      <%-- site_map 영역의 끝 --%>
      <div class="team_info">
        <div class="team_sns">
          <div class="github">
            <%-- Todo: 깃허브 로고와 주소 삽입 --%>
          </div>
          <div class="notion">
            <%-- Todo: 노션 로고와 주소 삽입 --%>
          </div>
        </div>
      </div>
    </div>
    <%-- footer 영역의 끝 --%>
  </div>
</div>
</body>
</html>
=======
<%@ include file="include/header.jsp"%>

<div class="content">

</div> <%-- content의 끝 --%>

<%@ include file="include/footer.jsp"%>

