<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<%@ page import="java.util.Date" %>

<style>
        /*td.field {
            border-left: 1px solid #dee2e6;
            border-right: 1px solid #dee2e6;
        }
        tr {
            border-bottom: 1px solid #dee2e6;
        }*/
        .detail_area_content {
            padding: 1.2em 0.8em;
            display: block;
        }
        .row {
            text-size: 1rem;
            line-height: 1.5rem;
            height: 2rem;
            margin-bottom: 0.4rem;
        }
        .row.info_field {
            height: 100%;
            border-bottom: 1px solid #000;
        }
</style>

<div class="content">
    <div class="content_menu customer_box">
        <div class="inner">
            <div class="content_tab_area">
                <div class="customer_title_area">
                    <div class="customer_title">내 정보 보기</div>
                </div>
                <div class="detail_area">
                    <div class="detail_area_content">
                        <div class="row info_field">
                            <%-- 텍스트 정보 --%>
                            <div class="col-sm-9">
                                <div class="row">
                                    <div class="col-sm-3">아이디</div>
                                    <div class="col-sm-6">${ mvo.memId }</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">이름</div>
                                    <div class="col">${ mvo.memName }</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">지역</div>
                                    <div class="col">${ mvo.memRegion }</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">주소</div>
                                    <div class="col">${ mvo.memAddr }</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">자녀 학년</div>
                                    <div class="col">${ mvo.memChildGrade }</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">전화번호</div>
                                    <div class="col">${ mvo.memPhone }</div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">이메일</div>
                                    <div class="col">${ mvo.memEmail }</div>
                                </div>
                            </div>
                            <%-- 회원 이미지 --%>
                            <div class="col-sm-3 align-items-center img_field">
                                <div class="row text-center">
                                    <%--            <c:if test="${ isImage eq true }">--%>
                                    <img src="../Uploads/${ mvo.memSImg }?ver=${currTime}" style="max-width:100%; max-height:80px"/>
                                    <%--            </c:if>--%>
                                </div>
                                <div class="row align-items-end text-center"><p>회원 이미지</p></div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- 하단 메뉴(버튼) -->
                            <div class="btn_field">
                                <button type="button" class="btn large primary list_load"
                                        onclick="location.href='../member/myinfoedit.do?memId=${ mvo.memId }';">
                                    수정하기
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <%-- content의 끝 --%>

<%@ include file="../include/footer.jsp"%>

<%--

<h2>내 정보 보기</h2>

<table border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>
    
    <!-- 게시글 정보 -->
    <tr>
        <td>회원 이미지</td>
        <td colspan="3">
            &lt;%&ndash;            <c:if test="${ isImage eq true }">&ndash;%&gt;
            <img src="../Uploads/${ mvo.memSImg }" style="max-width:20%;"/>
            &lt;%&ndash;            </c:if>&ndash;%&gt;
        </td>
    
    </tr>
    
    <tr>
        <td>아이디</td>
        <td colspan="3">${ mvo.memId }</td>
    </tr>
    <tr>
        <td>이름</td>
        <td colspan="3">${ mvo.memName }</td>
    </tr>
    <tr>
        <td>지역</td>
        <td colspan="3">${ mvo.memRegion }</td>
    </tr>
    <tr>
        <td>주소</td>
        <td colspan="3">${ mvo.memAddr }</td>
    </tr>
    <tr>
        <td>자녀 학년</td>
        <td colspan="3">${ mvo.memChildGrade }학년</td>
    </tr>
    <tr>
        <td>전화번호</td>
        <td colspan="3">${ mvo.memPhone }</td>
    </tr>
    <tr>
        <td>이메일</td>
        <td colspan="3">${ mvo.memEmail }</td>
    </tr>
    
    <!-- 하단 메뉴(버튼) -->
    <tr>
        <td colspan="4" align="center">
            &lt;%&ndash;            <input type="hidden" name="qnaNo" value="${ vo.qnaNo }"/>&ndash;%&gt;
            &lt;%&ndash;            <input type="hidden" name="memId" value="${ vo.memId }"/>&ndash;%&gt;
            <button type="button" onclick="location.href='../member/myinfoedit.do?memId=${ mvo.memId }';">
                수정하기
            </button>
        
        </td>
    </tr>

</table>--%>
