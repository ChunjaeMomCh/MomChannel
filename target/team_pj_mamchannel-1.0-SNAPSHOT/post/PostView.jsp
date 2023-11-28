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
<%--  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>--%>
</head>
<body>
<div class="wrapper">
  <div class="header"></div>
  <div class="content">
    <div class="innter detail">
      <div class="content_detail_area">
        <%-- main --%>
        <div class="content_post">
          <%-- 제목 영역 --%>
          <div class="post_title_area">
            <%-- 게시글 정보 영역 --%>
            <div class="text_area">
              <span class="tag">${ dto.postRegion }</span>
              <span class="tag">${ dto.postGrade }</span>
              <h4 class="content_title">${ dto.postTitle } </h4>
              <span class="date">${ dto.postDate }</span>
            </div>
            <%-- 게시자 정보 영역 --%>
            <div class="author_area">
              <%-- ToDo: 게시자 정보 영역 - 프로필 이미지, 채널명 (링크) --%>
              <div class="author_profile"></div>
                <a href="#" class="author_channel">채널명</a>
            </div>
            <%-- 수정, 삭제 버튼 영역 : 게시자일 경우에만 --%>
            <div class="post_edit_area">
              <ul class="option_list post_edit_menu">
                <li>
                  <a href="#">수정하기</a>
                </li>
                <li>
                  <a href="#">삭제하기</a>
                </li>
              </ul>
            </div>
          </div>
          <%-- 버튼 및 첨부파일 영역 --%>
          <div class="post_btns_area">
            <%-- 좋아요 및 공유 --%>
              <div class="post_btns">
                <a href="#" class="like_btn">Likes ${ dto.postLikes }</a>
                <a href="#" class="url_share_btn"></a>
              </div>
            <%-- 첨부파일 --%>
              <div class="attached_file_area">
                <%-- ToDo: 첨부파일 리스트 --%>
              </div>
          </div>
          <%-- 게시글 내용 영역 --%>
          <div class="text_body">
            <p>${ dto.postContent }</p>
          </div>
          <%-- 댓글 영역 --%>
          <div class="comments_area"></div>
        </div>
        <%-- aside --%>
        <div class="related_posts"></div>
      </div>
    </div>
  </div>
  <div class="footer"></div>
</div>


<%--<table class="table table-bordered" style="width: 90%">--%>
<%--  <colgroup>--%>
<%--    <col style="width: 15%" /> <col style="width: 35%" />--%>
<%--    <col style="width: 15%" /> <col style="width: auto" />--%>
<%--  </colgroup>--%>
<%--  --%>
<%--  &lt;%&ndash; 게시글 정보 &ndash;%&gt;--%>
<%--  &lt;%&ndash; 서블릿에서 request 영역에 저장한 DTO 객체의 내용을 EL로 출력한다. &ndash;%&gt;--%>
<%--  <tr>--%>
<%--    <th class="table-light">번호</th> <td>${ dto.idx }</td> &lt;%&ndash; ${ 속성명.멤버변수 }&ndash;%&gt;--%>
<%--    <th class="table-light">작성자</th> <td>${ dto.name }</td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <th class="table-light">작성일</th> <td>${ dto.postdate }</td>--%>
<%--    <th class="table-light">조회수</th> <td>${ dto.visitcount }</td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <th class="table-light">제목</th> <td colspan="3">${ dto.title }</td>--%>
<%--  </tr>--%>
<%--  <tr>--%>
<%--    <th class="table-light">내용</th>--%>
<%--    <td colspan="3" height="100px">${ dto.content }--%>
<%--      &lt;%&ndash; 이미지 첨부 파일이 있다면 <img> 태그를 이용해 이미지를 출력한다. &ndash;%&gt;--%>
<%--      <c:if test="${ not empty dto.ofile and isImage eq true }">--%>
<%--        <br><img src="../Uploads/${ dto.sfile }"--%>
<%--        &lt;%&ndash; 이미지가 출력될 영역보다 작으면 원본 크기로, 크다면 해당 영역만큼만 출력한다. &ndash;%&gt;--%>
<%--                 style="max-width: 100%;">--%>
<%--      </c:if>--%>
<%--    </td>--%>
<%--  </tr>--%>
<%--  --%>
<%--  &lt;%&ndash; 첨부 파일 &ndash;%&gt;--%>
<%--  <tr>--%>
<%--    <th class="table-light">첨부 파일</th>--%>
<%--    <td>--%>
<%--      <c:if test="${ not empty dto.ofile }">--%>
<%--        ${ dto.ofile }--%>
<%--        <button class="btn btn-light btn-sm" type="button"--%>
<%--                onclick="../mvcboard/download.do?ofile=${ dto.ofile }--%>
<%--                        &sfile=${ dto.sfile }&idx=${ dto.idx }">--%>
<%--          다운로드--%>
<%--        </button>--%>
<%--      </c:if>--%>
<%--    </td>--%>
<%--    <th class="table-light">다운로드수</th>--%>
<%--    <td>${ dto.downcount}</td>--%>
<%--  </tr>--%>
<%--  --%>
<%--  &lt;%&ndash; 하단 메뉴(버튼) - 수정, 삭제, 목록 바로가기 버튼 &ndash;%&gt;--%>
<%--  <tr>--%>
<%--    <td colspan="4" style="text-align: center">--%>
<%--      &lt;%&ndash; 수정하기 및 삭제하기 버튼은 비밀번호 검증 페이지로 이동 &ndash;%&gt;--%>
<%--      <button class="btn btn-outline-secondary btn-sm" type="button"--%>
<%--              onclick="location.href='../mvcboard/pass.do?' +--%>
<%--                      'mode=edit&idx=${ param.idx }';">--%>
<%--        수정하기--%>
<%--      </button>--%>
<%--      <button class="btn btn-outline-secondary btn-sm" type="button"--%>
<%--              onclick="location.href='../mvcboard/pass.do?' +--%>
<%--                      'mode=delete&idx=${ param.idx }';">--%>
<%--        삭제하기--%>
<%--      </button>--%>
<%--      <button class="btn btn-outline-secondary btn-sm" type="button"--%>
<%--              onclick="location.href='../mvcboard/list.do?';">--%>
<%--        목록 바로가기--%>
<%--      </button>--%>
<%--    </td>--%>
<%--  </tr>--%>
<%--</table>--%>
</body>
</html>
