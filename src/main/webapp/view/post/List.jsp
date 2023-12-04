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
<%@ include file="../include/header.jsp"%>
<div class="content">
  <div class="content_menu customer_box">
    <div class="inner">
      <%-- 게시판 전체 목록 table --%>
        <div class="content_tab_area" x-data="getPostList()" x-init="initFn">
          <form method="get" id="searchContent">
            <div class="customer_title_area">
              <p class="customer_title mo_none">전체 게시판
                <button type="button" class="btn btn-light input_form_btn" onclick="location.href='./write.do'">게시글 작성</button>
              </p>
              <div class="tab_btns select_search">
                <span class="content_num mo_none" id="pcTotalCount" x-text="'총 ' + totCnt + '개의 게시글이 있습니다.'"></span>
                <span class="content_num pc_none" id="mobileTotalCount" x-text="'총 ' + totCnt + '개'"></span>
                <div class="form_box">
                  <select class="form-select search_category" name="searchField">
                    <option value="post_time">최신순</option>
                    <option value="popularity">인기순</option>
                  </select>
                  <div class="search_bar_area border">
                    <input type="text" name="searchWord" class="search_bar" placeholder="검색어를 입력하세요." value="${ param.searchWord }"/>
                  </div>
                  <button type="submit" class="btn btn-light search_form_btn">검색</button>
                </div>
              </div>
            </div>
            
            <%-- 게시글 목록을 구현한다. --%>
            <div class="content_card_area">
              <a href="./write.do">글쓰기</a>
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
                      <a href="${pageContext.request.contextPath}/view/post/view.do?postNo=${ row.postNo }">  <%-- 게시글로 이동하는 링크 --%>
                        <div class="thumbnailImg" style="width: 320px; height: 280px;">
                          <figure class="content_img"><img src="/Uploads/${ row.postSFile }" alt=""></figure>
                        </div>
                        <div class="text_area">
                            <%-- 제목(상세보기 페이지로 바로가기 링크) --%>
                            <%-- 게시물의 일련번호를 매개변수로 사용한다. --%>
                            ${ row.postTitle }
                            <a class="content_name"
                              href="${pageContext.request.contextPath}/view/post/view.do?postNo=${ row.postNo }"
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
                </div>
            </div>
            
            <!-- 하단 메뉴(바로가기, 글쓰기) -->
            <div class="mo_none" id="pcPaging">
              <ul class="paging">
                ${ map.pagingImg }
              </ul>
            </div>
            
            <div class="pc_none">
              <a href="javascript:void(0);" class="btn list_load" x-show="list.length < totCnt" id="btnMobileMore" @click="addList" >더보기</a>
            </div>
            
    </div>
  </div>
</div>
          
          

<%@ include file="../include/footer.jsp"%>
