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
                    <c:if test="${memId eq 'admin'}">
                        <p class="customer_title"><i class="ico back pc_none" onclick="history.back();"></i>공지사항
                            <button type="button" class="btn btn-light input_form_btn" onclick="location.href='./delete.do?idx=${ param.idx }';">삭제하기</button>
                            <button type="button" class="btn btn-light input_form_btn" onclick="location.href='./edit.do?idx=${ param.idx }';">수정하기</button>
                        </p>
                    </c:if>
                    <input type="hidden" name="noticeNo" value="${ vo.noticeNo }"/>
                </div>
                <div class="detail_area" >
                    <div class="detail_title_area">
                        <p>${ vo.noticeCategory } ${ vo.noticeTitle }</p>
                        <span class="date">${vo.noticeDate} | 조회수 ${ vo.noticeHit }</span>
                    </div>
                    <div class="text_box">
                        <p>${ vo.noticeContent }</p>
                    </div>
                    <div class="notice_page">
                        <a href="./list.do" class="btn large gray list_load">목록</a>
                    </div>
                </div>
            </div>
        </div><!-- inner -->
    </div>
</div>
<!--// contents -->

<%@ include file="../../include/footer.jsp"%>




<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>맘채널</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>공지사항 상세보기</h2>--%>

<%--<table border="1" width="90%">--%>
<%--    <colgroup>--%>
<%--        <col width="15%"/> <col width="35%"/>--%>
<%--        <col width="15%"/> <col width="*"/>--%>
<%--    </colgroup>--%>

<%--    <!-- 게시글 정보 -->--%>
<%--    <tr>--%>
<%--        <td colspan="2"> <${ vo.noticeCategory } &nbsp; ${ vo.noticeTitle }</td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td>${ vo.noticeDate }</td><td>${ vo.noticeHit }</td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td colspan="2" height="100">--%>
<%--            ${ vo.noticeContent }--%>
<%--        </td>--%>
<%--    </tr>--%>

<%--    <!-- 하단 메뉴(버튼) -->--%>
<%--    <tr>--%>
<%--        <td colspan="2" align="center">--%>
<%--            <input type="hidden" name="noticeNo" value="${ vo.noticeNo }"/>--%>
<%--            <button type="button" onclick="location.href='../notice/edit.do?qnaNo=${ param.noticeNo }';">--%>
<%--                수정하기--%>
<%--            </button>--%>
<%--            <button type="button" onclick="location.href='../notice/delete.do?qnaNo=${ param.noticeNo }';">--%>
<%--                삭제하기--%>
<%--            </button>--%>
<%--            <button type="button" onclick="location.href='../notice/list.do';">--%>
<%--                목록 바로가기--%>
<%--            </button>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>