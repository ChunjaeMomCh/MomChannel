<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/header.jsp"%>


<!-- contents -->
<div class="content">
    <div class="content_menu customer_box">
        <div class="inner">
            <%@ include file="../../include/submenu_cs.jsp"%>

            <!-- 문의하기 table -->
            <div class="content_tab_area" x-data="getNoticeList()" x-init="initFn">
                <form method="get" id="searchContent">
                    <div class="customer_title_area">
                        <p class="customer_title mo_none">공지사항
                            <button type="button" class="btn btn-light input_form_btn" onclick="location.href='./write.do'">공지작성</button>
                        </p>
                        <div class="tab_btns select_search">
                            <span class="content_num mo_none" id="pcTotalCount" x-text="'총 ' + totCnt + '개의 게시글이 있습니다.'"></span>
                            <span class="content_num pc_none" id="mobileTotalCount" x-text="'총 ' + totCnt + '개'"></span>
                            <div class="form_box">
                                <select class="form-select search_category" name="searchField">
                                    <option value="전체">전체</option>
                                    <option value="중요">중요 </option>
                                    <option value="공지">공지</option>
                                    <option value="이벤트">이벤트</option>
                                </select>
                                <div class="search_bar_area border">
                                    <input type="text" name="searchWord" class="search_bar" placeholder="검색어를 입력하세요." value="${ param.searchWord }"/>
                                </div>
                                <button type="submit" class="btn btn-secondary search_form_btn">검색</button>
                            </div>
                        </div>
                    </div>





                    <div class="notice_list_area">
                        <table summary="문의하기 리스트" class="tbl_list">
                            <caption>문의하기 리스트</caption>
                            <thead>
                            <tr>
                                <th class="num" scope="col">구분</th>
                                <th scope="col">제목</th>
                                <th class="date" scope="col">작성일</th>
                                <th class="date" scope="col">조회수</th>
                            </tr>
                            </thead>
                            <tbody id="List_content">
                            <c:choose>
                                <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
                                    <tr>
                                        <td colspan="6" align="center">
                                            등록된 게시물이 없습니다^^*
                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>  <!-- 게시물이 있을 때 -->
                                    <c:forEach items="${ boardLists }" var="row" varStatus="loop">
                                        <tr class="num">
                                            <td class="notice_category">  <!-- 카테고리 -->
                                                    ${ row.noticeCategory }
                                            </td>
                                            <td class="notice_title">  <!-- 제목(링크) -->
                                                <a href="./view.do?idx=${ row.noticeNo }">${ row.noticeTitle }</a>
                                            </td>
                                            <td class="date">${ row.noticeDate }</td>  <!-- 작성일 -->
                                            <td class="date">${ row.noticeHit }</td>  <!-- 조회수 -->
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>

                        <!-- 하단 메뉴(바로가기, 글쓰기) -->
                        <div class="mo_none" id="pcPaging">
                            <ul class="paging">
                                ${ map.pagingImg }
                            </ul>
                        </div>

                        <div class="pc_none">
                            <a href="javascript:void(0);" class="btn list_load" x-show="list.length < totCnt" id="btnMobileMore" @click="addList" >더보기</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--// contents -->

<%@ include file="../../include/footer.jsp"%>
