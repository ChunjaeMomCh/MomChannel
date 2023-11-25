<%--
  Created by IntelliJ IDEA.
  User: sec
  Date: 2023-11-26
  Time: 오전 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
  <title>맘채널</title>
  <link rel="stylesheet" href="${path}/resources/css/post/style.css?after"
        type="text/css">
  <%-- 웹폰트 적용 --%>
  <style>
      @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Public+Sans&display=swap');
      body {
          font-family: 'Noto Sans KR', sans-serif;
          font-family: 'Public Sans', sans-serif;
      }
  </style>
</head>
<body>
<%-- 게시글 목록을 구현한다. --%>
<div class="content">
<div class="content-menu">
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
          <a href="#">  <%-- 게시글로 이동하는 링크 --%>
            <figure class="content_img"></figure>
            <div class="text_area">
            <%-- 제목(상세보기 페이지로 바로가기 링크) --%>
            <%-- 게시물의 일련번호를 매개변수로 사용한다. --%>
              <a class="content_name"
              href="../mvcboard/view.do?idx=${ row.postNo }"
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
        </li>
        </c:forEach>
</c:otherwise>
</c:choose>
    </ul>
  </div>
</div>
</div>
</div>
</body>
</html>
