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
</script>

<!-- contents -->
<div class="content">
  <div class="content_menu customer_box">
    <div class="inner">
      <div class="content_tab_area">
        <div class="customer_title_area">
          <p class="customer_title"><i class="ico back pc_none" onclick="history.back();"></i>게시물 등록</p>
        </div>
        <div class="detail_area">
          <div class="text_box">
            <div class="input_form">
              <form name="writeFrm" method="post" enctype="multipart/form-data" action="./write.do" onsubmit="return validateForm(this);">
                <div class="select_post">
                  <span class="input_form_title" style="display: inline-block">지역</span>
                  <select name="postRegion" id="postRegion" class="form-select" style="display: inline-block;">
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
                  <span class="input_form_title" style="display: inline-block">학년</span>
                  <select name="postGrade" id="postGrade" class="form-select" style="display:  inline-block;">
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
                  <input class="form-control" type="file" id="postOFile" name="postOFile">
<%--                  <figure style="position: relative;">--%>
<%--                    <img src="${pageContext.request.contextPath}/resources/images/default_thumbnail.jpg" height="150px" alt="썸네일 디폴트 이미지">--%>
<%--                  </figure>--%>
                </div>
                <div class="mb-3 mt-3">
                  <label for="postTitle" class="input_form_title">제목</label>
                  <input type="text" class="form-control" id="postTitle" name="postTitle" placeholder="제목을 입력하세요."autofocus>
                </div>
                <div class="mb-3 mt-3">
                  <label for="postContent" class="input_form_title">내용</label>
                  <textarea class="form-control" rows="5" id="postContent" name="postContent"></textarea>
                </div>
                <button type="submit" class="btn btn-light input_form_btn">작성 완료</button>
<%--                <button type="reset" class="btn btn-secondary input_form_btn" onclick="location.href='./list.do'">취소</button>--%>
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
