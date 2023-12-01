<%--
  Created by IntelliJ IDEA.
  User: sec
  Date: 2023-11-27
  Time: 오후 2:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
  <title>맘채널 - 글 작성</title>
  <script type="text/javascript">
      function validateForm(form) {  // 필수 항목 입력 확인
          // 폼값을 서버로 전송하기 전에 필수 항목 중 빈 값이 있는지를 확인한다.
          if (form.title.value == "") {
              alert("제목을 입력하세요.");
              form.title.focus();
              return false;
          }

          if (form.content.value == "") {
              alert("내용을 입력하세요.");
              form.content.focus();
              return false;
          }
      }
  </script>
</head>
<body>
<%@ include file="../include/header.jsp"%>
<form name="writeFrm" method="post" enctype="multipart/form-data"
      action="./write.do" onsubmit="return validateForm(this);">
  <div class="content" align="center">
    
    <%-- Todo: 로그인 정보 받아오기 --%>
    
    
    <table width="80%" border="1px solid black" margin="0 auto">
      <%-- 글 제목 영역 : 카테고리, 제목 입력 --%>
      <tr class="title_area">
        <td width="50%" style="vertical-align: middle"><%-- 게시물 카테고리 선택상자 --%>
          <div class="select_region" width="100%">
            <select name="postRegion" id="postRegion" style="width: 75%;">
            <option value="전국">전국</option>
            <option value="서울">서울</option>
            <option value="경기">경기</option>
            <option value="강원">강원</option>
            <option value="충청">충청</option>
            <option value="전라">전라</option>
            <option value="경상">경상</option>
            <option value="제주">제주</option>
          </select>
          </div>
          <div class="select_grade" width="100%">
            <select name="postGrade" id="postGrade" style="width: 75%;">
              <option value="전학년">전학년</option>
              <option value="1학년">1학년</option>
              <option value="2학년">2학년</option>
              <option value="3학년">3학년</option>
              <option value="4학년">4학년</option>
              <option value="5학년">5학년</option>
              <option value="6학년">6학년</option>
            </select>
          </div>
          <br>
          <input type="text" name="postTitle" placeholder="제목을 입력하세요." style="width: 75%; font-size: 32px;">
        </td>
        <td width="25%" height="160px">
          <%-- 썸네일 선택 --%>
          <figure style="position: relative;">
            <img src="${pageContext.request.contextPath}/resources/images/default_thumbnail.png" height="150px" alt="썸네일 디폴트 이미지">
          </figure>
          <div style="z-index: 1; text-align: center;"><input type="file" name="postOFile"></div>
        </td>
      </tr>
    </table>
      <%-- 글 작성 영역 --%>
    <table border="1px solid black" width="80%">
      <tr>
        <td width="100%" padding="0" align="center">
          <textarea name="postContent" id="content_input" cols="80" rows="24" style="border: 1px solid; padding: 1rem; font-size: 24px;" placeholder="내용을 입력하세요." ></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2" style="text-align: right">
          <button type="submit">등록</button>
          <button type="reset" onclick="location.href='./list.do'">취소</button>
        </td>
      </tr>
    </table>
  </div>
</form>
<%@ include file="../include/footer.jsp"%>
</body>
</html>
