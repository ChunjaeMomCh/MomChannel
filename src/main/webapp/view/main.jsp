<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./include/header.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
    $(document).ready(function(){
        $(".slider").bxSlider();
    });
</script>


<div class="content">
    <div class="slider">
        <div><img src="resources/images/banner_01.jpg"></div>
        <div><img src="resources/images/banner_02.jpg"></div>
        <div><img src="resources/images/banner_03.jpg"></div>
    </div>

    <div class="swiper main_banner pc_none">
        <ul class="swiper-wrapper">
            <li class="swiper-slide" style="background-color: #D1FFB8;">
                <figure>
                    <img class="pc_none" src="resources/images/banner_01.jpg" alt="5-1" link-url="">
                </figure>
            </li>
            <li class="swiper-slide" style="background-color: #FFF5B0;">
                <figure>
                    <img class="pc_none" src="resources/images/banner_02.jpg" alt="4-1" link-url="">
                </figure>
            </li>
            <li class="swiper-slide" style="background-color: #FFCAD8;">
                <figure>
                    <img class="pc_none" src="resources/images/banner_03.jpg" alt="3-1" link-url="">
                </figure>
            </li>
        </ul>
        <div class="swiper-button-next main_slide_next"></div>
        <div class="swiper-button-prev main_slide_prev"></div>
        <div class="swiper-pagination"></div>
    </div>

    <div class="new_content_area best_channel_area" x-data="COMMON_CONTENT_FUNCTION()" x-init="initFn">
        <div class="inner">
            <h2 class="content_title">추천 채널</h2>
            <div class="swiper best_channel">
                <ul class="swiper-wrapper">
                    <li class="swiper-slide recommend_ch">
                        <a href="/channel/home.html?channel_id=1385">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/11/16/71fb6991-a0b0-4f39-abe5-83456bb85349/프로필2.JPG" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">자료집 WORLD1</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide recommend_ch">
                        <a href="/channel/home.html?channel_id=1222">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/07/29/9764986c-59b1-4bcd-9dd3-c75a69f0d493/제목을 입력해주세요_-001 (1).png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">알로하쌤2</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide recommend_ch">
                        <a href="/channel/home.html?channel_id=1219">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/24/141c975b-6399-40f6-b732-3015a4652bd4/채널아이콘.png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">타래샘3</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide recommend_ch">
                        <a href="/channel/home.html?channel_id=1311">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/21/dfc81ac7-96ec-472f-8352-4b53f8a70e1e/02sam(TM)_01_심볼_칼라.png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">영이샘4</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slid recommend_che">
                        <a href="/channel/home.html?channel_id=1249">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/06/826a11e5-9221-474a-a9ca-5ad1c0b76a65/프로필-001.png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">상권쌤의 미술 수업 SET5</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <div class="morning_content_area" x-data="COMMON_CONTENT_FUNCTION()" x-init="initFn">
        <div class="inner">
            <h2 class="content_title ">맘채널에서 가장 많이 본 게시글, TOP 4!</h2>
            <div class="scrollbar_area">
                <ul class="card_area">  <%-- 게시글들을 배치 --%>
                    <c:choose>
                    <c:when test="${ empty topPostLists }">  <%-- 게시물이 없을 때 --%>
                        <p>등록된 게시물이 없습니다 ☺️</p>
                    </c:when>
                    <c:otherwise> <%-- 게시물이 있을 때 --%>
                        <%-- 게시물이 있으면 목록에 출력할 가상번호를 계산하고, 반복 출력한다. --%>
                    <c:forEach items="${ topPostLists }" var="row" varStatus="loop">
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
                            <a href="javascript:void(0)" class="like_btn" :class="item.isUserLike? 'on':''" @click="setLike(item.id, idx)"><i class="ico heart"></i><span>View ${row.postHit}</span></a>
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
            </div>
        </div>
    </div>

    <div class="new_content_area" x-data="COMMON_CONTENT_FUNCTION()" x-init="initFn">
        <div class="inner">
            <h2 class="content_title">최신 업데이트 콘텐츠</h2>
            <ul class="card_area">  <%-- 게시글들을 배치 --%>
                <c:choose>
                <c:when test="${ empty latestPostLists }">  <%-- 게시물이 없을 때 --%>
                    <p>등록된 게시물이 없습니다 ☺️</p>
                </c:when>
                <c:otherwise> <%-- 게시물이 있을 때 --%>
                    <%-- 게시물이 있으면 목록에 출력할 가상번호를 계산하고, 반복 출력한다. --%>
                <c:forEach items="${ latestPostLists }" var="row" varStatus="loop">
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
                        <a href="javascript:void(0)" class="like_btn" :class="item.isUserLike? 'on':''" @click="setLike(item.id, idx)"><i class="ico heart"></i><span>View ${row.postHit}</span></a>
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
        </div>
    </div>
    <div class="list_content_area" x-data="getMainNotice()" x-init="initFn">
        <div class="inner">

        </div>
    </div>

    <script>
        function getMainNotice(){

            return {
                list:[],
                initFn:function(){
                    this.getList();
                },
                getList:function(){
                    let _this = this;
                    request("/cs/notice_data.html?categoryId=612333&pageIndex=1&pageSize=2&orderField=publishDate&orderType=true","get").then((data)=>{
                        _this.list = data.list;
                    }).catch((err)=>{
                    });
                }
            };

        }
    </script>
</div> <%-- content의 끝 --%>

<%@ include file="./include/footer.jsp"%>


