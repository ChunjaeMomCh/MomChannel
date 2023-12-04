<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

<script type="text/javascript">
  function validateForm(form) {  // 필수 항목 입력 확인
    // 폼값을 서버로 전송하기 전에 필수 항목 중 빈 값이 있는지를 확인한다.
    if (form.postTitle.value == "") {
      alert("제목을 입력하세요.");
      form.postTitle.focus();
      return false;
    }

    if (form.postContent.value == "") {
      alert("내용을 입력하세요.");
      form.postContent.focus();
      return false;
    }
  }
  function setThumbnail(event){
    var reader = new FileReader();

    reader.onload = function(event){
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.setAttribute("class", "col-lg-6");
      document.querySelector("div#image_container").appendChild(img);
    };

    reader.readAsDataURL(event.target.files[0]);
  }
</script>

<!-- contents -->
<div class="content">
  <div class="content_menu customer_box">
    <div class="inner">
      <div class="content_tab_area">
        <div class="customer_title_area">
          <p class="customer_title"><i class="ico back pc_none" onclick="history.back();"></i>게시물 수정</p>
        </div>
        <div class="detail_area">
          <div class="text_box">
            <div class="input_form">
              <form name="updateFrm" method="post" enctype="multipart/form-data" action="./edit.do" onsubmit="return validateForm(this);">
                <div class="select_post">
                  <span class="input_form_title">지역</span>
                  <select name="postRegion" id="postRegion" class="form-select" style="width: 20%;display: inline-block;">
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
                <div class="select_post">
                  <span class="input_form_title">학년</span>
                  <select name="postGrade" id="postGrade" class="form-select" style="width: 20%;display:  inline-block;">
                    <option value="전학년">전학년</option>
                    <option value="1학년">1학년</option>
                    <option value="2학년">2학년</option>
                    <option value="3학년">3학년</option>
                    <option value="4학년">4학년</option>
                    <option value="5학년">5학년</option>
                    <option value="6학년">6학년</option>
                  </select>
                </div>
                <input type="hidden" name="memId" val="memId">
                <div class="mb-3">
                  <label for="postOFile" class="input_form_title">썸네일 이미지</label>
                  <input class="form-control" type="file" id="postOFile" name="postOFile" onchange="setThumbnail(event);">
                  <figure style="position: relative;">
                    <img id="image_container" src="${pageContext.request.contextPath}/resources/images/default_thumbnail.jpg" height="150px" alt="썸네일 디폴트 이미지">
                  </figure>
                  <input type="file" name="memImg" onchange="setThumbnail(event);"/>
                  <%--                <% originImg =  mvo.memImg }%>--%>
<%--                  <div id="image_container"></div>--%>
                </div>
                <div class="mb-3 mt-3">
                  <label for="postTitle" class="input_form_title">제목</label>
                  <input type="text" class="form-control" id="postTitle" name="postTitle" placeholder="제목을 입력하세요." value="${vo.postTitle}">
                </div>
                <div class="mb-3 mt-3">
                  <label for="postContent" class="input_form_title">내용</label>
                  <textarea class="form-control" rows="5" id="postContent" name="postContent">${vo.postContent}</textarea>
                </div>
                <button type="reset" class="btn btn-secondary input_form_btn" onclick="location.href='./list.do'">취소</button>
                <button type="submit" class="btn btn-light input_form_btn">수정 완료</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div><!-- inner -->
  </div>
</div>
<!--// contents -->

<%@ include file="../include/footer.jsp"%>



<%--
  Created by IntelliJ IDEA.
  User: sec
  Date: 2023-11-30
  Time: 오후 1:38
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<head>--%>
<%--  <title>맘채널 - 글 수정</title>--%>
<%--  <script type="text/javascript">--%>
<%--      function validateForm(form) {  // 필수 항목 입력 확인--%>
<%--          // 폼값을 서버로 전송하기 전에 필수 항목 중 빈 값이 있는지를 확인한다.--%>
<%--          if (form.title.value == "") {--%>
<%--              alert("제목을 입력하세요.");--%>
<%--              form.title.focus();--%>
<%--              return false;--%>
<%--          }--%>

<%--          if (form.content.value == "") {--%>
<%--              alert("내용을 입력하세요.");--%>
<%--              form.content.focus();--%>
<%--              return false;--%>
<%--          }--%>
<%--      }--%>
<%--  </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<%@ include file="../include/header.jsp"%>--%>
<%--<form name="updateFrm" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this);">--%>
<%--  <div class="content" align="center">--%>
<%--    <input type="hidden" name="postNo" value="${vo.postNo}">--%>
<%--    <input type="hidden" name="memId" value="${vo.memId}">--%>
<%--    <table width="80%" border="1px solid black" margin="0 auto">--%>
<%--      &lt;%&ndash; 글 제목 영역 : 카테고리, 제목 입력 &ndash;%&gt;--%>
<%--      <tr class="title_area">--%>
<%--        <td width="50%" style="vertical-align: middle">&lt;%&ndash; 게시물 카테고리 선택상자 &ndash;%&gt;--%>
<%--          <div class="select_region" width="100%">--%>
<%--            <select name="postRegion" id="postRegion" style="width: 75%;">--%>
<%--              <option value="전국">전국</option>--%>
<%--              <option value="서울">서울</option>--%>
<%--              <option value="경기">경기</option>--%>
<%--              <option value="강원">강원</option>--%>
<%--              <option value="충청">충청</option>--%>
<%--              <option value="전라">전라</option>--%>
<%--              <option value="경상">경상</option>--%>
<%--              <option value="제주">제주</option>--%>
<%--            </select>--%>
<%--          </div>--%>
<%--          <div class="select_grade" width="100%">--%>
<%--            <select name="postGrade" id="postGrade" style="width: 75%;">--%>
<%--              <option value="전학년">전학년</option>--%>
<%--              <option value="1학년">1학년</option>--%>
<%--              <option value="2학년">2학년</option>--%>
<%--              <option value="3학년">3학년</option>--%>
<%--              <option value="4학년">4학년</option>--%>
<%--              <option value="5학년">5학년</option>--%>
<%--              <option value="6학년">6학년</option>--%>
<%--            </select>--%>
<%--          </div>--%>
<%--          <br>--%>
<%--          <input type="text" name="postTitle" value="${vo.postTitle}" style="width: 75%; font-size: 32px;">--%>
<%--        </td>--%>
<%--        <td width="25%" height="160px">--%>
<%--          &lt;%&ndash; 썸네일 선택 &ndash;%&gt;--%>
<%--          <figure style="position: relative;">--%>
<%--            <img src="${pageContext.request.contextPath}/resources/images/default_thumbnail.png" height="150px" alt="썸네일 디폴트 이미지">--%>
<%--          </figure>--%>
<%--            <div style="z-index: 1; text-align: center;"><input type="file" name="postOFile"></div>--%>
<%--        </td>--%>
<%--      </tr>--%>
<%--    </table>--%>
<%--    &lt;%&ndash; 글 작성 영역 &ndash;%&gt;--%>
<%--    <table border="1px solid black" width="80%">--%>
<%--      <tr>--%>
<%--        <td width="100%" padding="0" align="center">--%>
<%--          <textarea name="postContent" id="postContent" cols="80" rows="24" style="border: 1px solid; padding: 1rem; font-size: 24px;" >${vo.postContent}</textarea>--%>
<%--        </td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <td colspan="2" style="text-align: right">--%>
<%--          <button type="submit" onclick="location.href='./update.do'">등록</button>--%>
<%--          <button type="reset">취소</button>--%>
<%--        </td>--%>
<%--      </tr>--%>
<%--    </table>--%>
<%--  </div>--%>
<%--</form>--%>
<%--<%@ include file="../include/footer.jsp"%>--%>
<%--</body>--%>
<%--</html>--%>
