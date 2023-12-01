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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/froala_style.css"
        type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"
        type="text/css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=
  Public+Sans&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
<div class="wrapper">
  <%-- 헤더 --%>
  <div class="header"></div>

  <%-- 메인 영역 --%>
    <div class="content">
      <aside>
        <div class="inner">
          <%-- 사이드바 --%>
          <div class="content_snb mo_none">
            <%-- 현재 조회 중인 메뉴 이름 표시, 비활성화 메뉴는 표기만 --%>
            <p class="snb_title">학년별</p>
            <%-- 학년별 조회: 학년 선택 박스 --%>
            <form name="gradeSearchFrm" method="get" action="../by-grade/post.do">
              <ul class="grades">
                <li>
                  <input type="radio" name="grade" class="grade"
                         id="all_graders" value="0">
                  <label for="first_grader">전체</label>
                </li>
                <li>
                  <input type="radio" name="grade" class="grade"
                         id="first_grader" value="1">
                  <label for="first_grader">1학년</label>
                </li>
                <li>
                  <input type="radio" name="grade" class="grade"
                         id="second_grader" value="2">
                  <label for="second_grader">2학년</label>
                </li>
                <li>
                  <input type="radio" name="grade" class="grade"
                         id="third_grader" value="3">
                  <label for="third_grader">3학년</label>
                </li>
                <li>
                  <input type="radio" name="grade" class="grade"
                         id="fourth_grader" value="4">
                  <label for="fourth_grader">4학년</label>
                </li>
                <li>
                  <input type="radio" name="grade" class="grade"
                         id="fifth_grader" value="5">
                  <label for="fifth_grader">5학년</label>
                </li>
                <li>
                  <input type="radio" name="grade" class="grade"
                         id="sixth_grader" value="6">
                  <label for="sixth_grader">6학년</label>
                </li>
              </ul>
              <input type="submit" value="학년별 게시글 찾기">
            </form>
          </div>
          <%-- 게시글 작성 버튼 --%>
          <div class="snb_btns">
            <button class="btn large unit_add" type="submit" onclick="location.href='.././write.do'">게시글 등록하기</button>
          </div>
        </div>
        <%-- 사이드바 끝 --%>
      </aside>
      <main>
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
                    <a href="../view/post/postview.do?postNo=${ row.postNo }">
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
            <div class="select_area"><span class="content_num">게시물의 총 개수</span></div>
            <select name="arrangement" id="arrangement">
              <option value="post_time">최신순</option>
              <option value="popularity">인기순</option>
            </select>
          </div>
          <%-- 게시글 목록 인클루드 --%>
          <%@ include file="../Post.jsp" %>
      </main>
        
        </div>
        
        
  
    <%-- 푸터 --%>
  <div class="footer"></div>
</div>
</body>
</html>
