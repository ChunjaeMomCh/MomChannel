<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/header.jsp"%>

<script type="text/javascript">
    function validateForm(form) {  // 필수 항목 입력 확인
        if (form.qnaTitle.value == "") {
            alert("제목을 입력하세요.");
            form.qnaTitle.focus();
            return false;
        }
        if (form.qnaContent.value == "") {
            alert("내용을 입력하세요.");
            form.qnaContent.focus();
            return false;
        }
    }
</script>


<!-- contents -->
<div class="content">
    <div class="content_menu customer_box">
        <div class="inner">
            <%@ include file="../../include/submenu_cs.jsp"%>

            <div class="content_tab_area">
                <div class="customer_title_area">
                    <p class="customer_title"><i class="ico back pc_none" onclick="history.back();"></i>공지사항</p>
                </div>
                <div class="detail_area">
                    <div class="text_box">
                        <div class="input_form">
                            <form method="post" action="./write.do" onsubmit="return validateForm(this);">
                                <input type="hidden" name="memId" val="memId">
                                <div class="mb-3 mt-3">
                                    <label class="input_form_title">공지 카테고리</label>
                                    <div class="form-check radio_opt">
                                        <input type="radio" class="form-check-input" id="radio1" name="noticeCategory" value="공지" checked>공지
                                        <label class="form-check-label" for="radio1"></label>
                                    </div>
                                    <div class="form-check radio_opt">
                                        <input type="radio" class="form-check-input" id="radio2" name="noticeCategory" value="중요">중요
                                        <label class="form-check-label" for="radio2"></label>
                                    </div>
                                    <div class="form-check radio_opt">
                                        <input type="radio" class="form-check-input" name="noticeCategory" value="이벤트">이벤트
                                        <label class="form-check-label"></label>
                                    </div>

                                </div>
                                <div class="mb-3 mt-3">
                                    <label for="noticeTitle" class="input_form_title">제목</label>
                                    <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" autofocus>
                                </div>
                                <div class="mb-3 mt-3">
                                    <label for="noticeContent" class="input_form_title">내용</label>
                                    <textarea class="form-control" rows="5" id="noticeContent" name="noticeContent"></textarea>
                                </div>
                                <button type="submit" class="btn btn-light input_form_btn">작성 완료</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- inner -->
    </div>
</div>
<!--// contents -->

<%@ include file="../../include/footer.jsp"%>





<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 첨부형 게시판</title>
    <script type="text/javascript">
        function validateForm(form) {  // 필수 항목 입력 확인
            // if (form.memId.value == "") {
            //     alert("작성자를 입력하세요.");
            //     form.memId.focus();
            //     return false;
            // }
            if (form.qnaTitle.value == "") {
                alert("제목을 입력하세요.");
                form.qnaTitle.focus();
                return false;
            }
            if (form.qnaContent.value == "") {
                alert("내용을 입력하세요.");
                form.qnaContent.focus();
                return false;
            }
        }
    </script>
</head>
<h2>파일 첨부형 게시판 - 글쓰기(Write)</h2>

<form method="post" action="../qnaboard/write.do" onsubmit="return validateForm(this);">
    <table>
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="qnaTitle" style="width:90%;" />
            </td>
        </tr>
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="qnaTitle" style="width:90%;" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="qnaContent" style="width:90%;height:100px;"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">RESET</button>
                <button type="button" onclick="location.href='../qnaboard/list.do';">
                    목록 바로가기
                </button>
            </td>
        </tr>
    </table>
</form>

<%--<form action="../qnaboard/write.do" method="post">--%>
<%--    <input type="text"  name="qnaTitle" required style="height:30px; width: 495px" /><br /><br />--%>
<%--    <input type="text" name="qnaContent" required style="height:30px; width: 495px" /><br /><br />--%>
<%--    <input type="submit" value="작성 완료">--%>
<%--</form>--%>
</body>
</html>