<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

<style>
        td.field {
            border-left: 1px solid #dee2e6;
            border-right: 1px solid #dee2e6;
        }
        tr {
            border-bottom: 1px solid #dee2e6;
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
                    <table class="table" border="1" width="90%">
                        <colgroup>
                            <col width="15%"/> <col width="35%"/>
                            <col width="15%"/> <col width="*"/>
                        </colgroup>
                        
                        <!-- 게시글 정보 -->
                        <tr>
                            <th class="table-light">아이디</th>
                            <td class="field" colspan="3">${ mvo.memId }</td>
                            <td rowspan="6">
                                <%--            <c:if test="${ isImage eq true }">--%>
                                <img src="../Uploads/${ mvo.memSImg }" style="max-width:20%;"/>
                                <%--            </c:if>--%>
                            </td>
                        </tr>
                        <%--<tr>
                        
                        </tr>--%>
                        <tr>
                            <th class="table-light">이름</th>
                            <td class="field" colspan="3">${ mvo.memName }</td>
                        </tr>
                        <tr>
                            <th class="table-light">지역</th>
                            <td class="field" colspan="3">${ mvo.memRegion }</td>
                        </tr>
                        <tr>
                            <th class="table-light">주소</th>
                            <td class="field" colspan="3">${ mvo.memAddr }</td>
                        </tr>
                        <tr>
                            <th class="table-light">자녀 학년</th>
                            <td class="field" colspan="3">${ mvo.memChildGrade }학년</td>
                        </tr>
                        <tr>
                            <th class="table-light">전화번호</th>
                            <td class="field" colspan="3">${ mvo.memPhone }</td>
                        </tr>
                        <tr style="border-bottom: 1px solid black">
                            <th class="table-light">이메일</th>
                            <td class="field" colspan="3">${ mvo.memEmail }</td>
                            <th class="table-light" style="text-align: center">회원 이미지</th>
                        </tr>
                    </table>
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
