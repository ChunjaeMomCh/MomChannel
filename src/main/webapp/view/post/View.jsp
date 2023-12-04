<%--
  Created by IntelliJ IDEA.
  User: sec
  Date: 2023-11-26
  Time: 오후 6:50
  Title: 게시글 상세보기 페이지
  Description:
    - 게시글 카테고리 (지역), (학년)
    - 제목, 작성일시, 게시자 이미지+채널이름(채널 링크)
    - 좋아요 수, 공유 링크
    - 첨부파일 리스트
    - 게시글 내용
    - 사이드 - 글쓴이의 다른 글 썸네일+제목
    - 게시글 내용
    - 댓글 수
    - 댓글 입력 창
    - 댓글 입력 버튼
    - 댓글 목록
    - 작성자 이미지, 아이디, 내용, 입력 시간
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <title>맘채널 - 게시글 상세 보기</title>
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
<%-- 게시판 상세 보기 --%>
<!-- contents -->
<div class="content">
  <div class="content_menu customer_box">
    <div class="inner">
      <div class="content_tab_area">
        <div class="customer_title_area">
          <input type="hidden" name="postNo" value="${ vo.postNo }"/>
          <input type="hidden" name="memId" value="${ vo.memId }"/>
        </div>
        <%-- 게시글 제목 영역 --%>
        <div class="detail_area" >
          <div class="detail_title_area">
            <%-- 지역별, 학년별 태그 요소 --%>
            <div class="text_area">
              <span class="tag" style="background-color: #0a64ff">${ vo.postRegion }</span>
              <span class="tag" style="background-color: #00b69e">${ vo.postGrade }</span>
            </div>
            <%-- 게시글 제목, 날짜, 작성자 아이디--%>
            <p>${ vo.postTitle }</p>
            <span class="date">${ vo.postDate }</span>
            <span class="date">| ${ vo.memId }</span>
            <%-- 수정, 삭제 버튼 --%>
            <p class="customer_title">
              <button type="button" class="btn btn-light input_form_btn" onclick="location.href='./edit.do?postNo=${ param.postNo }';">수정하기</button>
              <button type="button" class="btn btn-light input_form_btn" onclick="location.href='./delete.do?postNo=${ param.postNo }';">삭제하기</button>
            </p>
          </div>
          <%-- 게시글 내용 영역 --%>
          <div class="text_box">
            <p>${ vo.postContent }</p>
            <%-- 이미지 첨부 파일이 있다면 <img> 태그를 이용해 이미지를 출력한다. --%>
            <c:if test="${ not empty vo.postOFile and isImage eq true }">
              <br><img src="/Uploads/${ vo.postSFile }"
              <%-- 이미지가 출력될 영역보다 작으면 원본 크기로, 크다면 해당 영역만큼만 출력한다. --%>
                       style="max-width: 100%;">
            </c:if>
          </div>
          <div class="notice_page">
            <a href="/view/post/list.do" class="btn large gray list_load">목록</a>
          </div>
        </div>
      </div>
    </div><!-- inner -->
  </div>
</div>
<!--// contents -->

<div class="content"></div>
<%--<table>--%>
<%--  <colgroup>--%>
<%--    <col width="15%"><col width="35%">--%>
<%--    <col width="15%"><col width="*">--%>
<%--  </colgroup>--%>
<%--</table>--%>
<%--<div class="wrapper">
  <div class="header"></div>
  <div class="content">
    <div class="innter detail">
      <div class="content_detail_area">
        &lt;%&ndash; main &ndash;%&gt;
        <div class="content_post">
          &lt;%&ndash; 제목 영역 &ndash;%&gt;
          <div class="post_title_area">
            &lt;%&ndash; 게시글 정보 영역 &ndash;%&gt;
            <div class="text_area">
              <span class="tag" style="background-color: #0a64ff">${ vo.postRegion }</span>
              <span class="tag" style="background-color: #00b69e">${ vo.postGrade }</span>
              <h4 class="content_title">${ vo.postTitle } </h4>
              <span class="date">${ vo.postDate }</span>
            </div>
            &lt;%&ndash; 게시자 정보 영역 &ndash;%&gt;
            <div class="author_area">
              &lt;%&ndash; ToDo: 게시자 정보 영역 - 프로필 이미지, 채널명 (링크) &ndash;%&gt;
              &lt;%&ndash;              <div class="author_profile"></div>&ndash;%&gt;
              &lt;%&ndash;                <a href="#" class="author_channel">채널명</a>&ndash;%&gt;
              &lt;%&ndash;            </div>&ndash;%&gt;
              &lt;%&ndash; 수정, 삭제 버튼 영역 : 게시자일 경우에만 &ndash;%&gt;
              <div &lt;%&ndash;class="post_edit_area"&ndash;%&gt;>
                <ul &lt;%&ndash;class="option_list post_edit_menu"&ndash;%&gt;>
                  <li>
                    <a href="./update.do?postNo=${vo.postNo}">수정하기</a>
                  </li>
                  <li>
                    <button type="button" onclick="location.href='../post/delete.do?postNo=${ param.postNo }';">삭제하기</button>
                  </li>
                </ul>
              </div>
            </div>
            &lt;%&ndash; 버튼 및 첨부파일 영역 &ndash;%&gt;
            <div class="post_btns_area">
              &lt;%&ndash; 좋아요 및 공유 &ndash;%&gt;
              <div class="post_btns">
                <a href="#" class="like_btn">Likes ${ vo.postLikes }</a>
                <a href="#" class="url_share_btn"></a>
              </div>
              &lt;%&ndash; 첨부파일 &ndash;%&gt;
              <div class="attached_file_area">
                &lt;%&ndash; ToDo: 첨부파일 리스트 &ndash;%&gt;
              </div>
            </div>
            &lt;%&ndash; 게시글 내용 영역 &ndash;%&gt;
            <div class="text_body">
              <p>${ vo.postContent }</p>
            </div>
            &lt;%&ndash; 댓글 영역 &ndash;%&gt;
            <div class="comments_area"></div>
          </div>
          &lt;%&ndash; aside &ndash;%&gt;
          <div class="related_posts"></div>
        </div>
      </div>
    </div>
  </div>--%>
  <%@ include file="../include/footer.jsp"%>
