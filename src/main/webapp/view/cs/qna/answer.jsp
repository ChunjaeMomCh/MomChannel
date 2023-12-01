<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/header.jsp"%>

<script type="text/javascript">
    function validateForm(form) {  // 필수 항목 입력 확인
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
                    <p class="customer_title"><i class="ico back pc_none" onclick="history.back();"></i>문의하기</p>
                </div>
                <div class="detail_area">
                    <div class="text_box">
                        <div class="input_form">
                            <form method="post" action="../qna/answer.do" onsubmit="return validateForm(this);">
                                <input type="hidden" name="memId" val="memId">
                                <input type="hidden" name="qnaNo" value="${ vo.qnaNo }"/>
                                <input type="hidden" name="qnaTitle" value="${ vo.qnaTitle }"/>
                                <div class="mb-3 mt-3">
                                    <label for="title" class="input_form_title">제목</label>
                                    <input type="text" class="form-control" id="title" name="qnaTitle" placeholder="┗━ 답변 : ${ vo.qnaTitle }" disabled>
                                </div>
                                <div class="mb-3 mt-3">
                                    <label for="qnaContent" class="input_form_title">문의내용</label>
                                    <textarea class="form-control" rows="5" id="qnaContent" name="qnaContent"></textarea>
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
    <title>문의글 답변 작성</title>
    <script type="text/javascript">
        function validateForm(form) {  // 필수 항목 입력 확인
            if (form.qnaContent.value == "") {
                alert("내용을 입력하세요.");
                form.qnaContent.focus();
                return false;
            }
        }
    </script>
</head>
<h2>답변 작성</h2>

<form method="post" action="../qnaboard/answer.do" onsubmit="return validateForm(this);">
    <table border="1" width="90%">
        <input type="hidden" name="qnaNo" value="${ vo.qnaNo }"/>
        <input type="hidden" name="qnaTitle" value="${ vo.qnaTitle }"/>
        <tr>
            <td>제목 : </td> <td>┗━ 답변 : ${ vo.qnaTitle }</td>
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

</body>
</html>