<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/header.jsp"%>


<!-- contents -->
<div class="content">
    <div class="content_menu customer_box">
        <div class="inner">
            <%@ include file="../../include/submenu_cs.jsp"%>

            <div class="content_tab_area">
                <div class="customer_title_area">
                    <p class="customer_title"><i class="ico back pc_none" onclick="history.back();"></i>문의하기
                        <button type="button" class="btn btn-light input_form_btn" onclick="location.href='./delete.do?qnaNo=${ param.qnaNo }';">삭제하기</button>
                        <button type="button" class="btn btn-light input_form_btn" onclick="location.href='./edit.do?qnaNo=${ param.qnaNo }';">수정하기</button>
                        <button type="button" class="btn btn-light input_form_btn" onclick="location.href='./answer.do?qnaNo=${ param.qnaNo }';">답변작성</button>
                    </p>
                    <input type="hidden" name="qnaNo" value="${ vo.qnaNo }"/>
                    <input type="hidden" name="memId" value="${ vo.memId }"/>
                </div>
                <div class="detail_area" >
                    <div class="detail_title_area">
                        <p>${ vo.qnaTitle }</p>
                        <span class="date">${ vo.qnaDate }</span>
                        <span class="date">| ${ vo.memId }</span>
                    </div>
                    <div class="text_box">
                        <p>${ vo.qnaContent }</p>
                    </div>
                    <div class="notice_page">
                        <a href="/view/cs/qna/list.do" class="btn large gray list_load">목록</a>
                    </div>
                </div>
            </div>
        </div><!-- inner -->
    </div>
</div>
<!--// contents -->

<%@ include file="../../include/footer.jsp"%>



