<%--
  Created by IntelliJ IDEA.
  User: sec
  Date: 2023-11-30
  Time: 오후 8:15
  Description: 학년별 보기 페이지의 사이드메뉴 영역에 인클루드할 뷰
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>학년별 보기 사이드메뉴</title>
</head>
<body>
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
</body>
</html>
