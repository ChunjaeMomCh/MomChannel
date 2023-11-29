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
  <link rel="stylesheet" href="/resources/css/style1.css">
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
<form name="writeFrm" method="post" enctype="multipart/form-data"
      action="../view/post/write.do" onsubmit="return validateForm(this);">
  <div class="title_container">
    <div class="title_inner">
      <div class="title_text_container">
        <%-- ToDo: 카테고리 선택 상자 2개 --%>
        <div class="categories">
          <Select name="post_category" id="post_region">
            <option value="national">전체</option>
            <option value="seoul">서울</option>
            <option value="kyeonggi">경기</option>
            <option value="kangwon">강원</option>
            <option value="chungcheong">충청</option>
            <option value="jeolla">전라</option>
            <option value="kyeongsang">경상</option>
            <option value="cheju">제주</option>
          </select>
          <select name="post_category" id="post_grade">
            <option value="1st-grade">1학년</option>
            <option value="2nd_grade">2학년</option>
            <option value="3rd-grade">3학년</option>
            <option value="4th-grade">4학년</option>
            <option value="5th-grade">5학년</option>
            <option value="6th-grade">6학년</option>
          </select>
        </div>
        <%-- ToDo: 제목 입력 창 --%>
        <div class="title_area">
          <input name="title" type="text" placeholder="제목을 입력하세요.">
        </div>
      </div>
      <div class="title_img_container">
        <%-- ToDo: 썸네일 이미지 설정 버튼 --%>
        <div class="title_img_inner">
          <div class="img_box"></div>
          <span>썸네일 설정</span>
        </div>
      </div>
    </div>
    <div class="input_file">
      <p><input type="file" name="ofile">첨부파일</p>
    </div>
  </div>
  <div class="content_container">
    <div class="content_input">
      <textarea name="content" placeholder="내용을 입력하세요."></textarea>
    </div>
    <div class="button_container">
      <button type="submit">등록</button>
      <button type="reset">취소</button>
    </div>
  </div>
</form>


<%--<div class="wrapper">--%>
<%--  <div class="container">--%>
<%--    <div class="header"></div>--%>
<%--    <div class="content">--%>
<%--      &lt;%&ndash; 타이틀 영역 &ndash;%&gt;--%>
<%--      <div class="title_wrapper">--%>
<%--        <div class="title_container">--%>
<%--          <div class="title_inner">--%>
<%--            &lt;%&ndash; 좌측 : 카테고리, 제목 등 텍스트 영역 &ndash;%&gt;--%>
<%--            <div class="title_text">--%>
<%--              <div class="title_text_inner">--%>
<%--                <div class="title_selectbox">--%>
<%--                  <select name="post_category" id="post_region">--%>
<%--                    <option value="national">전체</option>--%>
<%--                    <option value="seoul">서울</option>--%>
<%--                    <option value="kyeonggi">경기</option>--%>
<%--                    <option value="kangwon">강원</option>--%>
<%--                    <option value="chungcheong">충청</option>--%>
<%--                    <option value="jeolla">전라</option>--%>
<%--                    <option value="kyeongsang">경상</option>--%>
<%--                    <option value="cheju">제주</option>--%>
<%--                  </select>--%>
<%--                  <select name="post_category" id="post_grade">--%>
<%--                    <option value="1st-grade">1학년</option>--%>
<%--                    <option value="2nd_grade">2학년</option>--%>
<%--                    <option value="3rd-grade">3학년</option>--%>
<%--                    <option value="4th-grade">4학년</option>--%>
<%--                    <option value="5th-grade">5학년</option>--%>
<%--                    <option value="6th-grade">6학년</option>--%>
<%--                  </select>--%>
<%--                </div>--%>
<%--                <input class="post_title" type="text" placeholder="제목을 입력하세요.">--%>
<%--              </div>--%>
<%--            </div>--%>
<%--            &lt;%&ndash; 우측 : 썸네일 이미지 &ndash;%&gt;--%>
<%--            <div class="title_img">--%>
<%--              <div class="title_img_inner">--%>
<%--                <figure>--%>
<%--                  <img src="" alt="">--%>
<%--                </figure>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--        &lt;%&ndash; 파일 첨부 버튼 &ndash;%&gt;--%>
<%--        <div class="upload_file">--%>
<%--          <file>첨부파일</file>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      &lt;%&ndash; ====== &ndash;%&gt;--%>
<%--      &lt;%&ndash; 게시글 작성 영역 &ndash;%&gt;--%>
<%--        <div class="post_content">--%>
<%--          <div class="post_input">--%>
<%--            <textarea name="" id="" cols="30" rows="10"></textarea>--%>
<%--          </div>--%>
<%--          &lt;%&ndash; 등록 버튼 &ndash;%&gt;--%>
<%--          <div class="post_button">--%>
<%--            <button type="submit">등록</button>--%>
<%--            <button type="reset">취소</button>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="footer"></div>--%>
<%--  </div>--%>
<%--</div>--%>
</body>
</html>
