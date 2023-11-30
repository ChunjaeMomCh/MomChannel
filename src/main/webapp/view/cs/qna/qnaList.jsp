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
            <form method="get" id="searchContent" action="/cs/notice_data.html" onsubmit="return false;">
                <input type="hidden" name="categoryId" x-model="categoryId"/>
                <input type="hidden" name="pageIndex" x-model="pageIndex"/>
                <input type="hidden" id="pageSize" name="pageSize" x-model="pageSize"/>
                <input type="hidden" name="field" value="title, description"/>

                <div class="customer_title_area">
                    <p class="customer_title mo_none">문의하기</p>
                    <button type="button"  onclick="location.href='./qna/Write.jsp'">글쓰기</button>
                    <div class="tab_btns select_search">
                        <span class="content_num mo_none" id="pcTotalCount" x-text="'총 ' + totCnt + '개의 게시글이 있습니다.'"></span>
                        <span class="content_num pc_none" id="mobileTotalCount" x-text="'총 ' + totCnt + '개'"></span>
                        <div class="form_box">
                            <div class="select_area h34">
                                <a href="#none">제목+내용<i class="ico arrow_03"></i></a>
                                <ul class="option_list">
                                    <li><a href="#none">제목+내용</a></li>
                                </ul>
                            </div>
                            <div class="search_bar_area border">
                                <input type="text" name="word" class="search_bar" x-on:keypress="searchEnter" placeholder="검색어를 입력하세요.">
                                <a href="javascript:void(0);" x-on:click="search()"><i class="ico search_02"></i></a>
                            </div>
                        </div>
                    </div>
                </div>





                <div class="notice_list_area">
                    <table summary="문의하기 리스트" class="tbl_list">
                        <caption>문의하기 리스트</caption>
                        <thead>
                        <tr>
                            <th class="num" scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th class="date" scope="col">작성자</th>
                            <th class="date" scope="col">작성일</th>
                        </tr>
                        </thead>
                        <tbody id="List_content">
                        <c:choose>
                            <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
                                <tr>
                                    <td colspan="6" align="center">
                                        등록된 게시물이 없습니다^^* ${ boardLists }
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>  <!-- 게시물이 있을 때 -->
                                <c:forEach items="${ boardLists }" var="row" varStatus="loop">
                                    <tr>
                                        <td class="num">  <!-- 번호 -->
                                                ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
                                        </td>
                                        <td class="notice_title">  <!-- 제목(링크) -->
                                            <a href="./qna/view.do?qnaNo=${ row.qnaNo }">${ row.qnaTitle }</a>
                                        </td>
                                        <td class="date">${ row.memId }</td>  <!-- 작성자 -->
                                        <td class="date">${ row.qnaDate }</td>  <!-- 작성일 -->
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