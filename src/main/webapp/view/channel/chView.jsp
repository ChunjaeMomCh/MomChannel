<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>



<script>
    function subscribe(){
        if(null==${loginMember.memId})
            alert("로그인 후 이용할 수 있습니다.");
        if(null==${check} || ""==${check})
            alert("안체크${check}");
        else
            alert("체크${check}");
        console.log(${check});
    }
</script>

<!-- contents -->
<div class="content" x-data="getMyHome()" x-init="initFn">
    <div class="channel_banner purple">
        <img src="../resources/images/channel_bg_01.png">
        <div class="inner">
            <figure class="profile_img">
                <img src="../Uploads/20231205_131313.jpg"/>
<%--                <img :src="myChannel.profile_image" onerror="this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';">--%>
            </figure>
            <div class="channel_info_area">
                <div class="channel_title">
                    <p class="channel_name">${ cvo.channelTitle }</p>
                </div>
                <div class="channel_comment">
                    <p x-text="myChannel.channel_introduce">${ cvo.channelInfo }</p>
                </div>
                <div class="pc_none">
                    <ul class="channel_ico_btns">
                        <li><a href="javascript:void(0)" class="categroy_btn" data-target="categroy"><i class="ico categroy"></i></a></li>
                        <li><a href="javascript:void(0)" class="info_btn" data-target="channelInfo"><i class="ico info"></i></a></li>
                        <li><a href="javascript:void(0)" @click="copyMyAddress()"><i class="ico share"></i></a></li>
                        <template x-if="myChannelDiv">
                            <li><a href="setting.html"><i class="ico setting"></i></a></li>
                        </template>
                    </ul>
                </div>
                <div class="btn_wrap mo_none">
                    <div>
                        <c:if test="${check eq 1}">
                            <a href="/ch/subup.do?channelTitle=${ cvo.channelTitle }" class="btn my_follow subscriber_btn" onclick="return confirm('구독 하시겠습니까?')" style="line-height: 35px;font-weight: bold; ">구독<span>${cvo.channelSub}</span></a>
                        </c:if>
                        <c:if test="${check eq 0}">
                            <a href="/ch/subdown.do?channelTitle=${ cvo.channelTitle }" class="btn my_follow subscriber_btn" onclick="return confirm('구독 취소 하시겠습니까?')" style="line-height: 35px; font-weight: bold; background: #ccc">구독<span>${cvo.channelSub}</span></a>
                        </c:if>
                        <c:if test="${!loginMember.memId}">
                            <a onclick="return alert('로그인 후 사용할 수 있습니다.')" class="btn my_follow subscriber_btn" style="line-height: 35px;font-weight: bold; ">구독수<span>${cvo.channelSub}</span></a>
                        </c:if>
                        <c:if test="${cvo.memId eq loginMember.memId}">
                            <a href="#none" class="btn my_follow subscriber_btn" style="line-height: 35px;font-weight: bold; ">구독수<span>${cvo.channelSub}</span></a>
                            <a href="../ch/chedit.do?memId=${cvo.memId}" class="btn my_follow subscriber_btn" style="line-height: 35px;font-weight: bold; ">내채널 편집</a>
                        </c:if>
                    </div>
                </div>
                <div class="btn_wrap pc_none">
                    <div>
                        <a href="#none" class="btn following_btn" @click="follow()">구독하기<span>${cvo.channelSub}</span></a>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="channel_content">
        <div class="inner">
            <div class="content_tab_area">
                <div class="swiper content_tab_menu">
                    <ul class="swiper-wrapper tab_menu_list">
                        <!-- 클릭 시 해당 메뉴에 .active 클래스 넣어주세요 -->
                        <span class="content_num mo_none" id="pcTotalCount">총000개</span>
                        <span class="content_num pc_none" id="mobileTotalCount">총000개</span>
                    </ul>
                </div>
                <div class="tab_btns select_search">
                    <select class="form-select search_category" name="orderField">
                        <option value="최신순">최신순</option>
                        <option value="인기순">인기순</option>
                    </select>
                </div>
                <form>
                    <div class="tab_btns select_search" style="float: right; margin-top: -35px">
                        <div class="form_box">
                            <div class="search_bar_area border">
                                <input type="text" name="searchWord" class="search_bar" placeholder="검색어를 입력하세요." value="${ param.searchWord }"/>
                            </div>
                            <button type="submit" class="btn btn-secondary search_form_btn">검색</button>
                        </div>
                    </div>
                </form>
                <div class="content_card_area">
                    <ul class="card_area">  <%-- 게시글들을 배치 --%>
                        <c:choose>
                        <c:when test="${ empty postLists }">  <%-- 게시물이 없을 때 --%>
                            <p>등록된 게시물이 없습니다 ☺️</p>
                        </c:when>
                        <c:otherwise> <%-- 게시물이 있을 때 --%>
                            <%-- 게시물이 있으면 목록에 출력할 가상번호를 계산하고, 반복 출력한다. --%>
                        <c:forEach items="${ postLists }" var="row" varStatus="loop">
                        <li class="content_card">  <%-- 개별 게시글을 카드 형태로 노출 --%>
                            <a href="${pageContext.request.contextPath}/view/post/view.do?postNo=${ row.postNo }">  <%-- 게시글로 이동하는 링크 --%>
                                <figure class="content_img">
                                    <c:if test="${row.postSFile eq null}">
                                        <img src="/Uploads/default_thumbnail.jpg" alt="">
                                    </c:if>
                                    <c:if test="${row.postSFile ne null}">
                                        <img src="/Uploads/${ row.postSFile }" alt="">
                                    </c:if>
                                </figure>
                                <div class="text_area">
                                    <p class="content_name">${ row.postTitle }</p>
                                    <p class="user_name" @click="goChannelHome(item.channelId)">
                                        <i>
                                            <img :src="item.channelProfile" onerror="this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';">
                                        </i>
                                        <span>${ row.memId }</span>
                                    </p>
                                </div>
                                <a href="javascript:void(0)" class="like_btn" :class="item.isUserLike? 'on':''" @click="setLike(item.id, idx)"><i class="ico heart"></i><span><span>View ${row.postHit}</span></a>
                            </a>
                            <div class="tag_area">  <%-- 게시글 태그 --%>
                                <span class="badge">${ row.postRegion }</span>
                                <span class="badge">${ row.postGrade }</span>
                            </div>
                            </c:forEach>
                            </c:otherwise>
                            </c:choose>
                        </li>
                    </ul>
                    <!-- 하단 메뉴(바로가기, 글쓰기) -->
                    <div class="mo_none" id="pcPaging">
                        <ul class="paging">
                            ${ map.pagingImg }
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!--// contents -->

<%@ include file="../include/footer.jsp" %>