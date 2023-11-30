<%--
  Created by IntelliJ IDEA.
  User: sec
  Date: 2023-11-24
  Time: 오후 3:51
  Description: 학년별 게시글 목록 보기를 구현하는 뷰
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>맘채널</title>
  <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/froala_style.css"
        type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"
        type="text/css">--%>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=
  Public+Sans&display=swap" rel="stylesheet">
<%--  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>--%>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>

<%@include file="../../include/header.jsp" %>
  <%-- 메인 영역 --%>
    <div class="content" style="display: flex;" >
      <aside style="display: inline-block; width: 20%; height: 400px;">
        <div class="inner">
          <%-- 사이드바 --%>
          <div class="content_snb mo_none">
            <%-- 현재 조회 중인 메뉴 이름 표시, 비활성화 메뉴는 표기만 --%>
            <p class="snb_title">학년별</p>
            <%-- 학년별 조회: 학년 선택 박스 --%>
            <form name="gradeSearchFrm" method="get" action="../by-grade/post.do">
              <select name="post_category" id="post_grade" style="width: 90%;">
                <option label="전체">전체</option>
                <option value="1st-grade">1학년</option>
                <option value="2nd_grade">2학년</option>
                <option value="3rd-grade">3학년</option>
                <option value="4th-grade">4학년</option>
                <option value="5th-grade">5학년</option>
                <option value="6th-grade">6학년</option>
              </select>
              <input type="submit" class="btn large unit_search" value="학년별 게시글 찾기">
            </form>
          </div>
          <%-- 게시글 작성 버튼 --%>
          <div class="snb_btns">
            <button class="btn large unit_add" type="submit"
                    onclick="location.href='.././write.do'">게시글 등록하기</button>
          </div>
        </div>
      </aside>
        <%-- 사이드바 끝 --%>
      <main style="display: inline-block; width: 75%;">
        <%-- 게시글 영역 --%>
        <div class="content_tab_area">
          <%-- 추천 게시글 목록 --%>
          <div class="top_channel_area">
            <%-- 슬라이드 버튼 --%>
            <div class="channel_arrow">
              <h2 class="top_channel_title">학년별<span>추천 포스트</span></h2>
              <div class="swiper-button-next channel_next swiper-button-disabled" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true"></div>
              <div class="swiper-button-prev channel_prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true"></div>
            </div>
            <%-- 슬라이드 메뉴 구현 --%>
            <div class="swiper top_channel swiper-container-initialized swiper-container-horizontal swiper-container-free-mode">
              <ul class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
                <c:forEach items="${ postLists }" var="row" varStatus="loop">
                  <li class="swiper-slide swiper-slide-active" style="width: 137.333px;">
                    <a href="${pageContext.request.contextPath}/view/post/postview.do?postNo=${ row.postNo }">
                      <figure><img src="" alt=""></figure>
                      <p class="content_name">${ row.postTitle }</p>
                      <p class="channel_name">${ row.memId }</p>
                      <span class="tag">${ row.postGrade }</span>
                    </a>
                  </li>
                </c:forEach>
              </ul>
              <%--                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>--%>
            </div>
          </div>
          <%-- 추천 게시글 끝 --%>
          <%-- 총 게시물 수와 게시글 정렬 버튼 --%>
          <div class="tab_btns">
            <div class="select_area"><span class="content_num">총 ${ map.end } 개의 게시글이 존재합니다.</span></div>
            <select name="arrangement" id="arrangement">
              <option value="post_time">최신순</option>
              <option value="popularity">인기순</option>
            </select>
          </div>
          <%-- 게시글 목록 인클루드 --%>
          <%@ include file="../Post.jsp" %>
      </main>
    </div>
</body>
 <%-- 푸터 --%>
<%@ include file="../../include/footer.jsp" %>
</html>
