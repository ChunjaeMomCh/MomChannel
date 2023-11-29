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
      <div class="content-menu">
        <div class="inner">
          <%-- 사이드바 --%>
          <div class="content_snb mo_none">
            <%-- 현재 조회 중인 메뉴 이름 표시, 비활성화 메뉴는 표기만 --%>
            <p class="snb_title">지역별</p>
            <div class="snb_menu"></div>
              <%-- 게시글 작성 버튼 --%>
            <div class="snb_btns">
              <button class="btn large gray reset" type="reset">초기화</button>
              <button class="btn large unit_add" type="submit" onclick="location.href='../post/write.do'">게시글 등록하기</button>
            </div>
          </div>
          <div class="content_tab_area">
            <%-- 추천 게시글 목록 --%>
            <div class="top_channel_area">
              <%-- 슬라이드 버튼 --%>
              <div class="channel_arrow">
                <h2 class="top_channel_title">지역별<span>추천 포스트</span></h2>
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
            <%-- 총 게시물 수와 게시글 정렬 버튼 --%>
            <div class="tab_btns">
              <div class="select_area"><span class="content_num">게시물의 총 개수</span></div>
              <select name="arrangement" id="arrangement">
                <option value="post_time">최신순</option>
                <option value="popularity">인기순</option>
              </select>
            </div>
          </div>
          <%-- 게시글 목록을 구현한다. --%>
          <div class="content_card_area">
            <div class="inner">
              <ul class="card_area">  <%-- 게시글들을 배치 --%>
                <c:choose>
                  <c:when test="${ empty postLists }">  <%-- 게시물이 없을 때 --%>
                    <p>등록된 게시물이 없습니다 ☺️</p>
                  </c:when>
                  <c:otherwise>  <%-- 게시물이 있을 때 --%>
                    <%-- 게시물이 있으면 목록에 출력할 가상번호를 계산하고, 반복 출력한다. --%>
                    <c:forEach items="${ postLists }" var="row" varStatus="loop">
                     <li class="content_card">  <%-- 개별 게시글을 카드 형태로 노출 --%>
                        <a href="../view/post/postview.do?postNo=${ row.postNo }">  <%-- 게시글로 이동하는 링크 --%>
                          <figure class="content_img"></figure>
                          <div class="text_area">
                          <%-- 제목(상세보기 페이지로 바로가기 링크) --%>
                          <%-- 게시물의 일련번호를 매개변수로 사용한다. --%>
                            <a class="content_name"
                              href="../view/post/postview.do?postNo=${ row.postNo }"
                              style="text-decoration: none; color: black;">
                              ${ row.postTitle }
                            </a>
                            <p class="user_name"><i></i><span>${ row.memId }</span></p>
                          </div>
                        </a>
                        <a href="#">${ row.postLikes }</a>  <%-- 좋아요 버튼 --%>
                        <div class="tag_area">  <%-- 게시글 태그 --%>
                          <span class="badge">${ row.postRegion }</span>
                          <span class="badge">${ row.postGrade }</span>
                        </div>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>
                </li>
              </ul>
              <div class="pagination-module">
                <nav aria-level="Page navigation">
                  <ul class="pagination">
                    <li class="page-item">
                      <a href="#" class="page-link" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a></li>
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%-- 푸터 --%>
  <div class="footer"></div>
</div>
</body>
</html>
