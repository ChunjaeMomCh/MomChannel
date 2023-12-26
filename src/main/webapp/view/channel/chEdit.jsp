<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

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

<div class="content">
    <div class="content_menu customer_box">
        <div class="inner">
            <div class="content_tab_area">
                <div class="customer_title_area">
                    <p class="customer_title"><i class="ico back pc_none" onclick="history.back();"></i>내 채널정보 편집</p>
                </div>
                <div class="detail_area">
                    <div class="text_box">
                        <div class="input_form">
                            <form method="post" onsubmit="return validateForm(this);">
                                <input type="hidden" name="memId" value="${ cvo.memId }"/>
                                <div class="mb-3 mt-3">
                                    <label for="channelTitle" class="input_form_title">채널명</label>
                                    <input type="text" class="form-control" id="channelTitle" name="channelTitle" value="${cvo.channelTitle}" />
                                </div>
                                <div class="mb-3 mt-3">
                                    <label for="channelContent" class="input_form_title">채널소개</label>
                                    <textarea class="form-control" rows="5" id="channelContent" name="channelContent"> ${cvo.channelInfo} </textarea>
                                </div>
                                <button type="reset" class="btn btn-secondary input_form_btn">취소</button>
                                <button type="submit" class="btn btn-light input_form_btn">수정 완료</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- inner -->
    </div>
</div>

<%@ include file="../include/footer.jsp"%>
