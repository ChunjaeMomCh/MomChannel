<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

<script>
    // common content board function
    function COMMON_CONTENT_FUNCTION( { getListStatus }={} ){
        const setListStatusToStorage = (_this, id) => {
            const status = getListStatus && (typeof getListStatus) === 'function' ? getListStatus(_this, id) : null;
            ListStorageUtil.setStatus(status);
        };
        return {
            initFn: function (){
                ListStorageUtil.getStatus();
            },
            getGoodScrap: function(list){ // select like list
                const contentids = list.map((item) => item.id);
                $("#contentIds").val(contentids.join(","));
                callAjax('userScoreListForm', function (data) {
                    const likeMap = JSON.parse(data);
                    for(let i in list){
                        let cont = list[i];
                        cont['isUserLike'] = (likeMap[cont.id] != '');
                        cont['scores'] = likeMap[(cont.id+'_like_cnt')];
                    }
                });
            },
            likePathName:null, // 좋아요 중간 패스명
            setLike: function(id, idx){ // insert/delete like
                if(!checkUserLoggIn()){
                    return;
                }
                const item = this.list[idx];
                const _csrf = "";
                let likePathName = this.likePathName ? "> " + this.likePathName : "";
                if(item.isUserLike){
                    unstar(_csrf, id, "쌤채널 "+likePathName+" > 좋아요 해제");
                    item.scores = Number(item.scores) - 1;
                    item.isUserLike = false;
                }else{
                    star(_csrf, id, "쌤채널 "+likePathName+" > 좋아요 등록");
                    item.scores = Number(item.scores) + 1;
                    item.isUserLike = true;
                }
            },
            goChannelHome: function(id){ // go channel home
                setListStatusToStorage(this, id);
                location.href = "/channel/home.html?channel_id=" + id;
            },
            goContentDetail: function(id, isYoutube = "false"){ // go content detail page
                setListStatusToStorage(this, id);
                if(isYoutube == "true"){
                    location.href = "/community/E-community-view_youtube.html?content_id="+id;
                }else{
                    location.href = "/community/E-community-view.html?content_id="+id;
                }
            },
            saveSubscribeChannel:function(id, event){
                event.stopPropagation();
                alert('로그인 후에 이용할 수 있는 서비스입니다.');
            },
            setCommunityContentTypeDisplay : function(list, communityContentTypes) {
                list.forEach(item => {
                    if(!item.contentType){
                        item.contentType = "";
                        item.contentStyle = "";
                        for(let i=0;i<communityContentTypes.length;i++){
                            const type = communityContentTypes[i];
                            if(type.id === item.attribute1){
                                item.contentType = type.text;
                                item.contentStyle = type.class;
                                break;
                            }
                        }
                    }
                });
            }

        };
    }
</script>

<!-- contents -->
<div class="content">
    <div class="content_menu popular_content">
        <div class="inner">
            <div class="content_tab_area">
                <div class="swiper content_tab_menu">
                    <p class="channel_title">전체 채널 보기</p>
                    <ul class="swiper-wrapper tab_menu_list">
<%--                        <!-- 클릭 시 해당 메뉴에 .active 클래스 넣어주세요 -->--%>
<%--                        <li class="swiper-slide" :class="(selectedSchoolDivision == '') ? 'active' : ''"><a href="javascript:void(0);" @click="searchSchoolDivision('')">전체</a></li>--%>
<%--                        <li class="swiper-slide" :class="(selectedSchoolDivision == 'C1') ? 'active' : ''"><a href="javascript:void(0);" @click="searchSchoolDivision('C1')">초등</a></li>--%>
<%--                        <li class="swiper-slide" :class="(selectedSchoolDivision == 'C2') ? 'active' : ''"><a href="javascript:void(0);" @click="searchSchoolDivision('C2')">중학</a></li>--%>
<%--                        <li class="swiper-slide" :class="(selectedSchoolDivision == 'C3') ? 'active' : ''"><a href="javascript:void(0);" @click="searchSchoolDivision('C3')">고등</a></li>--%>
                    </ul>
                </div>
                <div class="tab_btns">
                    <div class="select_area middle h34">
                        <span class="content_num"></span>
                    </div>
                </div>
                <div class="subscribe_card_wrap">
                    <ul class="subscribe_card_area">
                        <c:choose>
                            <c:when test="${ empty chLists }">  <!-- 게시물이 없을 때 -->
                                등록된 채널이 없습니다 ☺️ ${ chLists }
                            </c:when>
                            <c:otherwise>  <!-- 게시물이 있을 때 -->
                                <c:forEach items="${ chLists }" var="row" varStatus="loop">
                                    <li class="subscribe_card" @click="goChannelHome(item.id)" style="cursor:pointer">
                                        <a href="./chview.do?memId=${ row.memId }">
                                        <figure style="background-image:none;">
                                            <img :src="item.profileImage" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';">
                                        </figure>
                                        <div class="name_box">
                                            <p class="channel_name">${ row.channelTitle }</p>
                                            <div class="tag_box">
                                                <span class="tag gray">초등</span>
                                                <p class="tag outline">구독 <span>${ row.channelSub }</span>명</p>
                                            </div>
                                        </div>
                                        <p class="channel_comment">${ row.channelInfo }</p>
                                        <a href="javascript:void(0);" x-show="!item.isMyChannel" @click="saveSubscribeChannel(item.id, $event)" class="btn round_middle w88" :class="item.subscribedClass">구독</a>
                                        </a>
                                    </li>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                    <a href="javascript:void(0)" class="btn large gray resulte_load" @click="moreList" x-show="list.length < totCnt">더보기</a>
                </div>
            </div>
        </div>
    </div>

    <form method="get" id="searchChannelList" action="/channel/all_data.html" onsubmit="return false;">
        <input type="hidden" name="pageIndex" x-model="pageIndex"/>
        <input type="hidden" name="pageSize" id="pageSize" x-model="pageSize"/>
        <input type="hidden" name="orderField" x-model="orderField"/>
        <input type="hidden" name="selectedSchoolDivision" x-model="selectedSchoolDivision"/>
    </form>
</div>
<!--// contents -->


<%@ include file="../include/footer.jsp"%>