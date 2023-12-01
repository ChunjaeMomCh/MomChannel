<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../include/header.jsp"%>


<!-- contents -->
<div class="content">
    <div class="content_menu customer_box">
        <div class="inner">
            <%@ include file="../../include/submenu_cs.jsp"%>

            <!-- 문의하기 table -->
            <div class="content_tab_area" x-data="getQnaList()" x-init="initFn">
                <form method="get" id="searchContent">
                    <div class="customer_title_area">
                        <p class="customer_title mo_none">문의하기
                        <button type="button" class="btn btn-light input_form_btn" onclick="location.href='./write.do'">문의글 작성</button>
                        </p>
                        <div class="tab_btns select_search">
                            <span class="content_num mo_none" id="pcTotalCount" x-text="'총 ' + totCnt + '개의 게시글이 있습니다.'"></span>
                            <span class="content_num pc_none" id="mobileTotalCount" x-text="'총 ' + totCnt + '개'"></span>
                            <div class="form_box">
                                <select class="form-select search_category" name="searchField">
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                                <div class="search_bar_area border">
                                    <input type="text" name="searchWord" class="search_bar" placeholder="검색어를 입력하세요." value="${ param.searchWord }"/>
                                </div>
                                <button type="submit" class="btn btn-light search_form_btn">검색</button>
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
                                                <a href="./view.do?qnaNo=${ row.qnaNo }">${ row.qnaTitle }</a>
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
<script>
    function getQnaList() {

        let isMobile = $("#mobileTotalCount").is(":visible");
        window.onresize = function() {
            if($("#mobileTotalCount").is(":visible") != isMobile){
                isMobile = $("#mobileTotalCount").is(":visible");
                location.reload();
            }
        };

        return {
            isMobile:isMobile,
            list: [],
            totCnt: 0,
            pageIndex: Number('1'),
            pagePerNum: 1,
            pageSize: 10,

            orderField: 'sort',
            categoryId: '612333',
            boardType: 'ch-notice',

            initFn: function(){
                this.getNoticeContents();
            },
            search: function(){
                const _this = this;
                _this.list = [];
                _this.pageIndex = 1;

                this.$nextTick(function() {
                    _this.getNoticeContents();
                });
            },
            addList(){
                const _this = this;
                this.pageIndex++;
                this.$nextTick(function() {
                    _this.getNoticeContents();
                });
            },
            getNoticeContents: function(){
                const _this = this;
                front.loading.showLoading();

                callAjax('searchContent', function(data){
                    try{
                        const result = JSON.parse(data);
                        const list = result['list'] || [];

                        _this.totCnt = Number(result['totCnt']) || 0;
                        _this.pageSize = Number(result['pageSize']);

                        if(isMobile){
                            _this.list.push(...list);
                        }else{
                            _this.list = list;
                        }

                        front.loading.hideLoading();
                    } catch(e){
                        console.log(e);
                        front.loading.hideLoading();
                    }
                });
            },
            searchEnter: function (e) { // 검색 enter 이벤트
                if (e.keyCode == 13) {
                    this.search();
                }
            },
            pages: function () {
                let pagePerCnt = Math.ceil((this.totCnt / this.pageSize) / this.pageSize);
                this.pagePerNum = Math.ceil(this.pageIndex / this.pageSize);
                let pageLength = this.pageSize;
                if (pagePerCnt == this.pagePerNum) {
                    let num = ((this.pagePerNum - 1) * this.pageSize) * this.pageSize;
                    pageLength = Math.ceil((this.totCnt - num) / this.pageSize);
                }
                return Array.from({
                    length: pageLength
                });
            },
            nextPage: function(){
                if(this.pageIndex < this.pageCount()) this.viewPage(this.pageIndex + 1);
            },
            prevPage: function(){
                if(this.pageIndex > 1) this.viewPage(this.pageIndex - 1);
            },
            pageCount: function(){
                return Math.ceil(this.totCnt / this.pageSize);
            },
            viewPage: function(index){
                let _this = this;
                _this.pageIndex = index;
                $('html,body').animate( { scrollTop:0 },'fast' );
                _this.$nextTick(function() {
                    _this.getNoticeContents();
                });
            },
            goDetail:function(id){
                const params = $("#searchContent").serialize();
                location.href = "/cs/notice_detail.html?id=" + id+"&"+params;
            }
        }
    }
</script>
<!--// contents -->

<%@ include file="../../include/footer.jsp"%>