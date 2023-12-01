<%--
  Created by IntelliJ IDEA.
  User: sec
  Date: 2023-11-24
  Time: 오후 3:51
  Description: 학년별 보기 페이지의 스와이퍼 메뉴 영역에 인클루드하여 추천 포스트를 게시할 뷰
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
  </div>
</body>
</html>
