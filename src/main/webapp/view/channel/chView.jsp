<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

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
                            <a href="/ch/subdown.do?channelTitle=${ cvo.channelTitle }" class="btn my_follow subscriber_btn" onclick="return confirm('구독 취소 하시겠습니까?')" style="line-height: 35px; font-weight: bold; background: #aaa">구독<span>${cvo.channelSub}</span></a>
                        </c:if>

                        <c:if test="${cvo.memId eq loginMember.memId}">
                            <a href="#none" class="btn my_follow subscriber_btn" style="line-height: 35px;font-weight: bold; ">구독<span>${cvo.channelSub}</span></a>
                            <a href="chedit.do?channelTitle=${cvo.channelTitle}" class="btn my_follow subscriber_btn" style="line-height: 35px;font-weight: bold; ">내채널 편집</a>
                        </c:if>
                    </div>
                </div>
                <div class="btn_wrap pc_none">
                    <div>
                        <a href="#none" class="btn following_btn" @click="follow()">구독하기<span>${cvo.channelSub}</span></a>
                    </div>
                </div>
            </div>
            <!-- 20230801 :: 감싸는 태그 / 채널 추가 버튼 추가 -->
            <template x-if="myChannelDiv">
                <div class="edit_btns">
                    <a href="setting.html" class="channel_plus mo_none"><i class="ico plus_05"></i>채널 추가</a>
                    <a href="setting.html?channel_id=1262" class="edit_btn mo_none"><i class="ico edit"></i>프로필 편집</a>
                </div>
            </template>
            <template x-if="!myChannelDiv">
                <div class="edit_btns">
                    <a href="#none" class="channel_view mo_none" @click="getOtherChannelList()" data-target="channelView"><i class="ico chview"></i>채널 전체 보기</a>
                </div>
            </template>
            <div class="sns_btn_list mo_none">
                <template x-if="snsLinkList">
                    <template x-for="(item, idx) in snsLinkList" :key="idx">
                        <a x-bind:href="item.sns_link" target="_blank"><i x-bind:class="'ico'+' '+item.class"></i></a>
                    </template>
                </template>
            </div>
        </div>
    </div>
    <div class="channel_content">
        <div class="inner">

            <div class="channel_snb mo_none">
                <!-- 20230417 :: 구조 변경 -->
                <div class="snb_menu open" id="channelHomeLeftMenu1">
                    <a href="javascript:void(0)" @click="showLeftMenu(1)" class="snb_title open">공개자료<i class="ico arrow_02"></i></a>
                    <div class="snb_sub_menu" >
                        <ul class="menu_list">
                            <li class="active"><a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[0].id,1)">전체보기</a></li>
                            <li>
                                <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[1].id,1)">교과자료</a>
                                <ul class="sub_menu">
                                    <li>초등</li>

                                    <li class="grade"><a href="javascript:void(0)" @click="selectMenu('612099',1,'curri',$event)" >3학년<span class="num">14</span></a></li>

                                </ul>
                                <ul class="sub_menu">
                                    <li>중학</li>


                                </ul>
                                <ul class="sub_menu">
                                    <li>고등</li>

                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[2].id,1,'ex')">창의적 체험 활동</a>
                                <ul class="sub_menu">

                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[3].id,1,'class')">학급운영</a>
                                <ul class="sub_menu">

                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="snb_menu" id="channelHomeLeftMenu2" >
                    <!-- 20230417 :: disabled 클래스 삭제 -->
                    <a href="javascript:void(0)" class="snb_title" x-show="myChannelDiv" @click="showLeftMenu(2)">비공개자료<i class="ico arrow_02"></i></a>
                    <div class="snb_sub_menu" style="display:none">
                        <ul class="menu_list">
                            <li class="active"><a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[0].id,0)">전체보기</a></li>
                            <li>
                                <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[1].id,0)">교과자료</a>
                                <ul class="sub_menu">
                                    <li>초등</li>

                                    <li class="grade"><a href="javascript:void(0)" @click="selectMenu('612099',0,'curri',$event)" >3학년<span class="num">2</span></a></li>
                                </ul>
                                <ul class="sub_menu">
                                    <li>중학</li>


                                </ul>
                                <ul class="sub_menu">
                                    <li>고등</li>

                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[2].id,0,'ex')">창의적 체험 활동</a>
                                <ul class="sub_menu">

                                </ul>
                            </li>
                            <li>
                                <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[3].id,0,'class')">학급운영</a>
                                <ul class="sub_menu">

                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="content_tab_area">
                <div class="swiper content_tab_menu">
                    <ul class="swiper-wrapper tab_menu_list">
                        <!-- 클릭 시 해당 메뉴에 .active 클래스 넣어주세요 -->
                        <template x-for="(item,index) in communityContentTypes">
                            <li class="swiper-slide" :class="(item.id == selectCommunityContentType) ? 'active' : ''"><a href="javascript:void(0);" x-text="item.text" @click="searchContentType(item.id)"></a></li>
                        </template>
                    </ul>
                </div>
                <div class="tab_btns select_search">
                    <span class="content_num" x-text="'총 '+totCnt+'개'"></span>
                    <div class="select_area h34">
                        <a href="#none" id="orderField">최신순<i class="ico arrow_03"></i></a>
                        <ul class="option_list">
                            <li><a href="#none" @click="selectField('publishDate')">최신순</a></li>
                            <li><a href="#none" @click="selectField('scores')">인기순</a></li>
                        </ul>
                    </div>
                    <div class="search_bar_area border">
                        <input type="text" class="search_bar" x-model="searchWord" @keyup.enter="keyCheck()" placeholder="검색어를 입력하세요.">
                        <a href="#none" @click="searchText()"><i class="ico search_02"></i></a>
                    </div>
                </div>
                <div class="content_card_area">
                    <div class="inner">
                        <ul class="card_area">
                            <template x-for="(item,idx) in list">
                                <li class="content_card">
                                    <a href="javascript:void(0)">
                                        <figure class="content_img" :class="{'video_content':(item.isYoutube == 'true')}" @click="goContentDetail(item.id, item.isYoutube)">
                                            <img :src="item.thumbnail" />
                                            <span class="video_time" x-show="(item.isYoutube == 'true' && item.duration != '')" x-text="item.duration">03:05</span>
                                        </figure>
                                        <div class="text_area">
                                            <p class="content_name" @click="goContentDetail(item.id, item.isYoutube)" x-html="item.title"></p>
                                            <p class="user_name" @click="goChannelHome(item.channelId)"><i><img :src="item.channelProfile" onerror="this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span x-html="item.author"></span></p>
                                        </div>
                                        <a href="javascript:void(0)" class="like_btn" :class="item.isUserLike? 'on':''" @click="setLike(item.id, idx)"><i class="ico heart"></i><span x-text="item.scores"></span></a>
                                        <div class="tag_area">
                                            <span class="badge" x-show="item.schoolDivisionName != ''" x-text="item.schoolDivisionName"></span>
                                            <span class="badge" x-show="item.contentType != ''" :class="(item.contentStyle != '') ? item.contentStyle : ''" x-text="item.contentType"></span>
                                        </div>
                                    </a>
                                </li>                                </template>
                        </ul>

                    </div>
                    <a href="javascript:void(0)" class="view_more_btn" @click="moreList" x-show="list.length < totCnt">더보기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- popup -->
    <!-- 20230802 :: 팝업 추가 -->

    <!-- 내 채널 전체보기 팝업 -->
    <div class="modal click_dimm_none" id="myChannelpopup"></div>

    <!-- 채널 전체보기 팝업 -->
    <div class="modal" id="channelView">
        <div class="modal_content w1152 channel_view_popup">
            <div class="popup_title">
                <h4>채널 전체보기</h4>
                <a href="#none" class="modal_close" data-dismiss="modal">
                    <img class="mo_none" src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/ico_popup_close.png" alt="close">
                    <img class="pc_none" src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/ico_close_02.png" alt="close">
                </a>
            </div>
            <div class="notice_view_body">
                <ul class="my_channel_list">
                    <template x-for="(item, idx) in channelList" :key="idx">
                        <li class="content_card" @click="location($event,item.id)">
                            <a href="javascript:void(0)">
                                <figure><img :src="item.profile_image" onerror="this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                                <div class="name_box">
                                    <p class="channel_name" x-text="item.channel_name"></p>
                                    <div class="tag_box">
                                        <template x-if="item.school_division == 'C1'">
                                            <span class="tag gray">초등</span>
                                        </template>
                                        <template x-if="item.school_division == 'C2'">
                                            <span class="tag gray">중등</span>
                                        </template>
                                        <template x-if="item.school_division == 'C3'">
                                            <span class="tag gray">고등</span>
                                        </template>
                                        <p class="tag outline">구독 <span x-text="item.subscriberCnt"></span>명</p>
                                    </div>
                                </div>
                                <p class="channel_comment" x-text="item.channel_introduce"></p>
                            </a>
                            <template x-if="item.subscriberYn == 'Y'">
                                <a href="javascript:void(0)" @click="popupFollowCancel(item.id)" class="btn round_middle active" value="followBtn">구독중</a>
                            </template>
                            <template x-if="item.subscriberYn == 'N'">
                                <a href="javascript:void(0)" @click="popupFollow(item.id)" class="btn round_middle" value="followBtn">구독</a>
                            </template>
                        </li>
                    </template>
                </ul>
            </div>
        </div>
    </div>
    <!-- //20230802 :: 팝업 추가 -->
    <div class="pc_none">
        <!-- 카테고리 팝업 -->
        <div class="modal" id="categroy">
            <div class="modal_content categroy_popup">
                <div class="popup_title">
                    <h4>카테고리</h4>
                    <a href="#none" class="modal_close" data-dismiss="modal">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/ico_back.png" alt="close">
                    </a>
                </div>
                <div class="notice_view_body">
                    <div class="channel_snb">
                        <!-- 20230417 :: 구조 변경 -->
                        <div class="snb_menu" id="channelHomeLeftMenu3">
                            <a href="javascript:void(0)" @click="showLeftMenu(1)" class="snb_title open">공개자료<i class="ico arrow_02"></i></a>
                            <div class="snb_sub_menu">
                                <ul class="menu_list">
                                    <li class="active"><a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[0].id,1)">전체보기</a></li>
                                    <li>
                                        <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[1].id,1)">교과자료</a>
                                        <ul class="sub_menu">
                                            <li>초등</li>

                                            <li class="grade"><a href="javascript:void(0)" @click="selectMenu('612099',1,'curri',$event)" >3학년<span class="num">14</span></a></li>
                                        </ul>
                                        <ul class="sub_menu">
                                            <li>중학</li>

                                        </ul>
                                        <ul class="sub_menu">
                                            <li>고등</li>

                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[2].id,1,'ex')">창의적 체험 활동</a>
                                        <ul class="sub_menu">

                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[3].id,1,'class')">학급운영</a>
                                        <ul class="sub_menu">

                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="snb_menu">
                            <!-- 20230417 :: disabled 클래스 삭제 -->
                            <a href="#none" class="snb_title">비공개자료<i class="ico arrow_02"></i></a>
                            <div class="snb_sub_menu" style="display:none">
                                <ul class="menu_list">
                                    <li class="active"><a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[0].id,1)">전체보기</a></li>
                                    <li>
                                        <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[1].id,0)">교과자료</a>
                                        <ul class="sub_menu">
                                            <li>초등</li>

                                            <li class="grade"><a href="javascript:void(0)" @click="selectMenu('612099',0,'curri',$event)" >3학년<span class="num">2</span></a></li>
                                        </ul>
                                        <ul class="sub_menu">
                                            <li>중학</li>

                                        </ul>
                                        <ul class="sub_menu">
                                            <li>고등</li>

                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[2].id,0,'ex')">창의적 체험 활동</a>
                                        <ul class="sub_menu">

                                        </ul>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" @click="selectMenu(oneDepthCategory[3].id,0,'class')">학급운영</a>
                                        <ul class="sub_menu">

                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>                    </div>
            </div>
        </div>

        <!-- 구독자 팝업 -->
        <div class="modal" id="subscriber">
            <div class="modal_content subscriber_popup">
                <div class="popup_title">
                    <h4>구독자</h4>
                    <a href="#none" class="modal_close" data-dismiss="modal">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/ico_back.png" alt="close">
                    </a>
                </div>
                <div class="notice_view_body">
                    <div class="subscriber_area">
                        <ul class="subscriber_list">
                            <template x-if="subscriberList.length > 0">
                                <template x-for="(item, idx) in subscriberList" :key="idx">
                                    <li>
                                        <a :href="item.url">
                                            <figure class="user_profile"><img :src="item.image" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                                            <p class="user_channer" :class="item.channel_id ? 'on' : ''" x-text="item.name"></p>
                                            <span class="tag gray" x-text="item.curri"></span>
                                        </a>
                                    </li>
                                </template>
                            </template>
                            <template x-if="subscriberList.length === 0">
                                <li>
                                    <a href="#none">
                                        <p class="user_channer">구독자가 없습니다.</p>
                                    </a>
                                </li>
                            </template>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 채널 정보 팝업 -->
        <div class="modal" id="channelInfo">
            <div class="modal_content info_popup">
                <div class="popup_title">
                    <h4>천재쌤</h4>
                    <a href="#none" class="modal_close" data-dismiss="modal">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/ico_back.png" alt="close">
                    </a>
                </div>
                <div class="notice_view_body">
                    <div class="channel_info_area">
                        <div class="info_group">
                            <p class="info_type">채널 주소</p>
                            <a x-bind:href="myChannel.channel_address" class="info_text" x-text="myChannel.channel_address"></a>
                        </div>
                        <div class="info_group">
                            <p class="info_type">한 줄 소개</p>
                            <p class="info_text" x-text="myChannel.channel_introduce"></p>
                        </div>
                        <div class="info_group">
                            <p class="info_type">해시태그</p>
                            <template x-if="hashTagList.length >0">
                                <template x-for="(item, idx) in hashTagList" :key="idx">
                                    <span class="info_text hashtag" x-text="'#'+item.hashtag"></span>
                                </template>
                            </template>
                        </div>
                        <div class="info_group sns_link">
                            <p class="info_type">링크</p>
                            <div class="sns_btn_list info_text">
                                <template x-if="snsLinkList">
                                    <template x-for="(item, idx) in snsLinkList" :key="idx">
                                        <a x-bind:href="item.sns_link" target="_blank"><i x-bind:class="'ico'+' '+item.class+'_02'"></i></a>
                                    </template>
                                </template>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /popup -->

    <form method="get" id="searchContent" action="home_data.html" onsubmit="return false;">
        <input type="hidden" name="modelId" value="community"/>
        <input type="hidden" name="id" x-model="selectedCategory"/>
        <input type="hidden" name="channelId" x-model="channelId"/>
        <input type="hidden" name="nattribute2" x-model="nattribute2"/>
        <input type="hidden" name="orderField" x-model="orderField"/>
        <input type="hidden" name="orderType" value="true"/>
        <input type="hidden" name="pageIndex" x-model="pageIndex"/>
        <input type="hidden" name="pageSize" id="pageSize" value="8"/>
        <input type="hidden" name="searchWord" x-model="searchWord"/>
        <input type="hidden" name="selectCommunityContentType" x-model="selectCommunityContentType"/>
    </form>
    <form method="get" id="userScoreListForm" action="/community/E-community-scoreList.html" onsubmit="return false;" async="false">
        <input type="hidden" id="contentIds" name="contentIds" />
    </form>
</div>

<!--// contents -->

<%@ include file="../include/footer.jsp" %>





<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채널 상세보기</title>
</head>
<body>
<%--<%@ include file="include/header.jsp"%>--%>

<div class="content">

    <h2>채널 상세보기</h2>

    <table border="1" width="90%">
        <colgroup>
            <col width="15%"/> <col width="35%"/>
            <col width="15%"/> <col width="*"/>
        </colgroup>

        <!-- 게시글 정보 -->
        <tr>
            <td>채널 이미지</td>
            <td colspan="3">
                <%--            <c:if test="${ isImage eq true }">--%>
                <img src="../Uploads/${ mvo.memSImg }" style="max-width:20%;"/>
                <%--            </c:if>--%>
            </td>

        </tr>

        <tr>
            <td>채널 이름</td>
            <td colspan="3">${ cvo.memId }</td>
        </tr>
        <tr>
            <td>채널 정보</td>
            <td colspan="3">${ cvo.channelInfo }</td>
        </tr>
        <tr>
            <td>구독자</td>
            <td colspan="3">${ cvo.channelSub }</td>
        </tr>
    </table>
    <div class="row">

        <div class="col-lg-6 mt-3">
            <c:if test="${check eq 1}">
             <a onclick="return confirm('구독 하시겠습니까?')" href="/ch/subup.do?channelTitle=${ cvo.channelTitle }">구독하기</a>
            </c:if>
            <c:if test="${check eq 0}">
             <a onclick="return confirm('구독 취소 하시겠습니까?')" href="/ch/subdown.do?channelTitle=${ cvo.channelTitle }">구독취소</a>
            </c:if>
        </div>

    </div>
    <div class="inner">
        <ul class="card_area">  <%-- 게시글들을 배치 --%>
            <c:choose>
            <c:when test="${ empty postLists }">  <%-- 게시물이 없을 때 --%>
                <p>등록된 게시물이 없습니다 ☺️</p>
            </c:when>
            <c:otherwise>  <%-- 게시물이 있을 때 --%>
                <%-- 게시물이 있으면 목록에 출력할 가상번호를 계산하고, 반복 출력한다. --%>
            <c:forEach items="${ postLists }" var="row" varStatus="loop">
            <li class="content_card">  <%-- 개별 게시글을 카드 형태로 노출 --%>
                <a href="${pageContext.request.contextPath}/view/post/view.do?postNo=${ row.postNo }">  <%-- 게시글로 이동하는 링크 --%>
                    <figure class="content_img"></figure>
                    <div class="text_area">
                            <%-- 제목(상세보기 페이지로 바로가기 링크) --%>
                            <%-- 게시물의 일련번호를 매개변수로 사용한다. --%>
                            ${ row.postTitle }
                            <%--                            <a class="content_name"--%>
                            <%--                              href="${pageContext.request.contextPath}/view/post/postview.do?postNo=${ row.postNo }"--%>
                            <%--                              style="text-decoration: none; color: black;">--%>
                            <%--                              ${ row.postTitle }--%>
                            <%--                            </a>--%>
                        <p class="user_name"><i></i><span>${ row.memId }</span></p>
                    </div>
                </a>
                <a href="#">${ row.postLikes }</a>  <%-- 좋아요 버튼 --%>
                <div class="tag_area">  <%-- 게시글 태그 --%>
                    <span class="badge">${ row.postRegion }</span>
                    <span class="badge">${ row.postGrade }</span>
                </div>
                </c:forEach>
                </c:otherwise>
                </c:choose>
            </li>
        </ul>
    </div>
</div> <%-- content의 끝 --%>

<%--    <%@ include file="include/footer.jsp"%>--%>
</body>
</html>