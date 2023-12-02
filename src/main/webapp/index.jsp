<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="view/include/header.jsp"%>

<%--<div class="content">--%>
<%--    <c:choose>--%>
<%--        <c:when test="${empty memId}">--%>
<%--            <a href="./view/Login/loginForm.jsp">로그인</a><br>--%>
<%--        </c:when>--%>
<%--        <c:when test="${not empty memId}">--%>
<%--            <a href="./member/logout.do">로그아웃</a><br>--%>
<%--        </c:when>--%>
<%--    </c:choose>--%>
<%--    <a href="./view/Login/signForm.jsp">회원가입</a><br>--%>
<%--    <a href="./member/myinfo.do">내정보</a>--%>
<!-- contents -->
<div class="content">
    <div class="swiper main_banner pc_none">
        <ul class="swiper-wrapper">
            <li class="swiper-slide" style="background-color: #D1FFB8;">
                <figure>
                    <img class="pc_none" src="//cdata2.tsherpa.co.kr/tsherpa///ssam_channel/메인배너(모바일)_5.png" alt="5-1" link-url="">
                </figure>
            </li>
            <li class="swiper-slide" style="background-color: #FFF5B0;">
                <figure>
                    <img class="pc_none" src="//cdata2.tsherpa.co.kr/tsherpa///ssam_channel/메인배너(모바일)_4.png" alt="4-1" link-url="">
                </figure>
            </li>
            <li class="swiper-slide" style="background-color: #FFCAD8;">
                <figure>
                    <img class="pc_none" src="//cdata2.tsherpa.co.kr/tsherpa///ssam_channel/메인배너(모바일)_3.png" alt="3-1" link-url="">
                </figure>
            </li>
            <li class="swiper-slide" style="background-color: #D4C7FE;">
                <figure>
                    <img class="pc_none" src="//cdata2.tsherpa.co.kr/tsherpa///ssam_channel/메인배너(모바일)_2.png" alt="2-1" link-url="">
                </figure>
            </li>
            <li class="swiper-slide" style="background-color: #BFDCFF;">
                <figure>
                    <img class="pc_none" src="//cdata2.tsherpa.co.kr/tsherpa///ssam_channel/메인배너(모바일)_1.png" alt="1-1" link-url="">
                </figure>
            </li>
        </ul>
        <div class="swiper-button-next main_slide_next"></div>
        <div class="swiper-button-prev main_slide_prev"></div>
        <div class="swiper-pagination"></div>
    </div>

    <div class="swiper main_banner mo_none">
        <div class="fixed_banner">
            <figure style="cursor: pointer">
                <img src="//cdata2.tsherpa.co.kr/tsherpa///ssam_channel/미니 배너.png" alt="서비스 안내 페이지" link-url="https://sschannel.tsherpa.co.kr/cs/introduce.html">
            </figure>
        </div>
        <ul class="swiper-wrapper">
            <li class="swiper-slide" style="background-color: #D1FFB8;">
                <figure>
                    <img class="mo_none" src="//cdata2.tsherpa.co.kr/tsherpa///ssam_channel/메인 배너_5.png" alt="5" link-url="">
                </figure>
            </li>
            <li class="swiper-slide" style="background-color: #FFF5B0;">
                <figure>
                    <img class="mo_none" src="//cdata2.tsherpa.co.kr/tsherpa///ssam_channel/메인 배너_4.png" alt="4" link-url="">
                </figure>
            </li>
            <li class="swiper-slide" style="background-color: #FFCAD8;">
                <figure>
                    <img class="mo_none" src="//cdata2.tsherpa.co.kr/tsherpa///ssam_channel/메인 배너_3.png" alt="3" link-url="">
                </figure>
            </li>
            <li class="swiper-slide" style="background-color: #D4C7FE;">
                <figure>
                    <img class="mo_none" src="//cdata2.tsherpa.co.kr/tsherpa///ssam_channel/메인 배너_2.png" alt="2" link-url="">
                </figure>
            </li>
            <li class="swiper-slide" style="background-color: #BFDCFF;">
                <figure>
                    <img class="mo_none" src="//cdata2.tsherpa.co.kr/tsherpa///ssam_channel/메인 배너_1.png" alt="1" link-url="">
                </figure>
            </li>
        </ul>
        <div class="swiper-button-next main_slide_next"></div>
        <div class="swiper-button-prev main_slide_prev"></div>
        <div class="swiper-pagination"></div>
    </div>

    <script>
        $(function(){
            $("div.main_banner figure > img").click(function(){
                if($(this).is("[link-url]") && $(this).attr("link-url") != ""){
                    window.open($(this).attr("link-url"));
                }
            });
        });
    </script>

    <div class="best_channel_area">
        <div class="inner">
            <div class="channel_arrow">
                <h2 class="content_title">추천채널</h2>
                <div class="swiper-button-next channel_next"></div>
                <div class="swiper-button-prev channel_prev"></div>
            </div>
            <div class="swiper best_channel">
                <ul class="swiper-wrapper">
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1385">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/11/16/71fb6991-a0b0-4f39-abe5-83456bb85349/프로필2.JPG" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">자료집 WORLD</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1222">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/07/29/9764986c-59b1-4bcd-9dd3-c75a69f0d493/제목을 입력해주세요_-001 (1).png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">알로하쌤</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1219">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/24/141c975b-6399-40f6-b732-3015a4652bd4/채널아이콘.png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">타래샘</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1311">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/21/dfc81ac7-96ec-472f-8352-4b53f8a70e1e/02sam(TM)_01_심볼_칼라.png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">영이샘</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1249">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/06/826a11e5-9221-474a-a9ca-5ad1c0b76a65/프로필-001.png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">상권쌤의 미술 수업 SET</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1242">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_07.png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">하나쌤의 공부하나</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1333">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/28/a880edc6-4797-4a12-adfe-c385d78d9ce2/열정민쌤 로고 예시.png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">열정민쌤</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1273">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/11/19/85ad31f8-2214-4fd9-b00a-e4abfbcdeea7/제목을 입력해주세요_-001 (1).jpg" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">프로게이머</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1327">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/24/3edff180-0518-4e9c-b6a5-f011a7043a90/1-removebg-preview (2).png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">쏭쌤 학급운영</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1283">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/15/f6dd590d-b168-4ca1-8325-3655e70ab903/KakaoTalk_20230815_220027742.jpg" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">리미쌤의 놀이자료</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1297">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/22/f3628693-a927-40d1-bf3f-ad8646b86d9d/제목을 입력해주세요_-001 (1).jpg" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">엠버쌤의수학교실</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1277">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/14/03e66d09-54c9-491c-8cc6-278bce73e107/01.png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">파랑쌤</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1306">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/20/e3a4777b-3f09-4042-8602-c8f496cd9d8f/템플릿 기본_복사본-001 (1).png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">나승빈 선생님의 함행우 이야기</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1311">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/21/dfc81ac7-96ec-472f-8352-4b53f8a70e1e/02sam(TM)_01_심볼_칼라.png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">영이샘</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                    <li class="swiper-slide">
                        <a href="/channel/home.html?channel_id=1388">
                            <figure class="profile_img"><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/10/19/099e9200-81fa-478a-b6c2-52b6cf113a48/연구대회_짭bi.png" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></figure>
                            <p class="channel_name">2023 수업 혁신 연구대회</p>
                            <span class="tag channel gray">초등</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>



    <div class="morning_content_area" x-data="COMMON_CONTENT_FUNCTION()" x-init="initFn">
        <div class="inner">
            <h2 class="content_title ">손이 꽁꽁 발이 꽁꽁, 겨울 만들기 놀이!</h2>
            <div class="scrollbar_area">
                <ul class="card_area">




                    <li class="content_card">
                        <a href="javascript:void(0)">
                            <figure class="content_img " @click="goContentDetail('1881050','false')">
                                <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/08/31/f710d2a7-4bd5-412f-833a-ec7ff05c0ed9/001.jpg" />

                            </figure>
                            <div class="text_area">
                                <p class="content_name" @click="goContentDetail('1881050','false')">[미술] 나만의 겨울 모자 만들기</p>
                                <p class="user_name" @click="goChannelHome('1338')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/30/a300788b-f101-47b4-95b4-ac3cb18925c9/티셀파 로고.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>미술 in class</span></p>
                            </div>
                            <a href="javascript:void(0)" onclick="setLikeMain('1881050', this)" class="like_btn ">
                                <i class="ico heart"></i>
                                <span>1</span>
                            </a>
                            <div class="tag_area">
                                <span class="badge">초등</span>
                                <span class="badge blue_01">수업PPT</span>
                            </div>
                        </a>
                    </li>




                    <li class="content_card">
                        <a href="javascript:void(0)">
                            <figure class="content_img " @click="goContentDetail('1869672','false')">
                                <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/08/13/fc398dbe-b55f-45c6-a138-65695ec80703/티쎌파섬네일용(팥손난로).png" />

                            </figure>
                            <div class="text_area">
                                <p class="content_name" @click="goContentDetail('1869672','false')">[실로 만드는 세상]팥 손난로</p>
                                <p class="user_name" @click="goChannelHome('1219')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/24/141c975b-6399-40f6-b732-3015a4652bd4/채널아이콘.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>타래샘</span></p>
                            </div>
                            <a href="javascript:void(0)" onclick="setLikeMain('1869672', this)" class="like_btn ">
                                <i class="ico heart"></i>
                                <span>4</span>
                            </a>
                            <div class="tag_area">
                                <span class="badge">초등</span>
                                <span class="badge orange">만들기</span>
                            </div>
                        </a>
                    </li>




                    <li class="content_card">
                        <a href="javascript:void(0)">
                            <figure class="content_img video_content" @click="goContentDetail('1880850','true')">
                                <img src="https://i.ytimg.com/vi/7MAP1Wgb_DI/hqdefault.jpg" />
                                <span class="video_time">04:23</span>
                            </figure>
                            <div class="text_area">
                                <p class="content_name" @click="goContentDetail('1880850','true')">겨울풍경꾸미기</p>
                                <p class="user_name" @click="goChannelHome('1311')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/21/dfc81ac7-96ec-472f-8352-4b53f8a70e1e/02sam(TM)_01_심볼_칼라.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>영이샘</span></p>
                            </div>
                            <a href="javascript:void(0)" onclick="setLikeMain('1880850', this)" class="like_btn ">
                                <i class="ico heart"></i>
                                <span>3</span>
                            </a>
                            <div class="tag_area">
                                <span class="badge">초등</span>
                                <span class="badge red">유튜브</span>
                            </div>
                        </a>
                    </li>




                    <li class="content_card">
                        <a href="javascript:void(0)">
                            <figure class="content_img video_content" @click="goContentDetail('1624220','true')">
                                <img src="//cdata2.tsherpa.co.kr/tsherpa//Tsherpa2021/element/upload/2022/12/01/c850e3d0-224c-461c-9e14-bf12c90f585a/KakaoTalk_20221201_144407293_01.jpg" />
                                <span class="video_time"></span>
                            </figure>
                            <div class="text_area">
                                <p class="content_name" @click="goContentDetail('1624220','true')">눈사람 가랜드, 눈꽃 만들기</p>
                                <p class="user_name" @click="goChannelHome('1290')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/16/5546a096-4c3e-448d-b432-2297ce548b7f/운영.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>쌤나눔자료 학급경영</span></p>
                            </div>
                            <a href="javascript:void(0)" onclick="setLikeMain('1624220', this)" class="like_btn ">
                                <i class="ico heart"></i>
                                <span>7</span>
                            </a>
                            <div class="tag_area">

                                <span class="badge red">유튜브</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <h2 class="content_title advice">한 해를 돌아보며</h2>
            <div class="scrollbar_area">
                <ul class="card_area">




                    <li class="content_card">
                        <a href="javascript:void(0)">
                            <figure class="content_img " @click="goContentDetail('1520406','false')">
                                <img src="//cdata2.tsherpa.co.kr/tsherpa//Tsherpa2021/element/콘텐츠/upload/2022/07/04/8a3649e3-b0d1-4373-b946-4823b1ce1635/별별일상도안.jpg" />

                            </figure>
                            <div class="text_area">
                                <p class="content_name" @click="goContentDetail('1520406','false')">별별일상 그림일기장 양식 공유</p>
                                <p class="user_name" @click="goChannelHome('1290')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/16/5546a096-4c3e-448d-b432-2297ce548b7f/운영.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>쌤나눔자료 학급경영</span></p>
                            </div>
                            <a href="javascript:void(0)" onclick="setLikeMain('1520406', this)" class="like_btn ">
                                <i class="ico heart"></i>
                                <span>10</span>
                            </a>
                            <div class="tag_area">

                                <span class="badge pink">활동자료</span>
                            </div>
                        </a>
                    </li>




                    <li class="content_card">
                        <a href="javascript:void(0)">
                            <figure class="content_img " @click="goContentDetail('964639','false')">
                                <img src="//cdata2.tsherpa.co.kr/tsherpa//Tsherpa2021/element/콘텐츠/교과학습/공통썸네일/쌤나눔자료/3_국어/964639.png" />

                            </figure>
                            <div class="text_area">
                                <p class="content_name" @click="goContentDetail('964639','false')">1학년인 나에게 편지쓰기</p>
                                <p class="user_name" @click="goChannelHome('1288')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/16/8884eadc-7013-4083-a305-368c479e008e/교과.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>쌤나눔자료 교과학습</span></p>
                            </div>
                            <a href="javascript:void(0)" onclick="setLikeMain('964639', this)" class="like_btn ">
                                <i class="ico heart"></i>
                                <span>3</span>
                            </a>
                            <div class="tag_area">
                                <span class="badge">초등</span>
                                <span class="badge lightgreen_01">활동지</span>
                            </div>
                        </a>
                    </li>




                    <li class="content_card">
                        <a href="javascript:void(0)">
                            <figure class="content_img " @click="goContentDetail('1526473','false')">
                                <img src="//cdata2.tsherpa.co.kr/tsherpa//Tsherpa2021/element/콘텐츠/교과학습/공통썸네일/쌤나눔자료/3_국어/1526473.png" />

                            </figure>
                            <div class="text_area">
                                <p class="content_name" @click="goContentDetail('1526473','false')">[10단원] 겪은 일을 이야기로 만드는 방법 (학습지, ppt)</p>
                                <p class="user_name" @click="goChannelHome('1288')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/16/8884eadc-7013-4083-a305-368c479e008e/교과.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>쌤나눔자료 교과학습</span></p>
                            </div>
                            <a href="javascript:void(0)" onclick="setLikeMain('1526473', this)" class="like_btn ">
                                <i class="ico heart"></i>
                                <span>16</span>
                            </a>
                            <div class="tag_area">
                                <span class="badge">초등</span>
                                <span class="badge green">학습지</span>
                            </div>
                        </a>
                    </li>




                    <li class="content_card">
                        <a href="javascript:void(0)">
                            <figure class="content_img " @click="goContentDetail('1869666','false')">
                                <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/08/13/06ddbecf-45cd-4478-99fc-f89b09a7e155/5_2_4_9-우리반글모음집만들기-001.jpg" />

                            </figure>
                            <div class="text_area">
                                <p class="content_name" @click="goContentDetail('1869666','false')">(국어) 5-2 4단원 9~10차시 우리 반 글 모음집 만들기</p>
                                <p class="user_name" @click="goChannelHome('1228')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/23/f0d9b9a5-cf0d-459c-b33a-7127395217b2/본채널_유튜브_로고_(800px).png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>반올림스쿨</span></p>
                            </div>
                            <a href="javascript:void(0)" onclick="setLikeMain('1869666', this)" class="like_btn ">
                                <i class="ico heart"></i>
                                <span>3</span>
                            </a>
                            <div class="tag_area">
                                <span class="badge">초등</span>
                                <span class="badge orange">만들기</span>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="new_content_area" x-data="COMMON_CONTENT_FUNCTION()" x-init="initFn">
        <div class="inner">
            <h2 class="content_title">최신 업데이트 콘텐츠</h2>
            <ul class="card_area">
                <li class="content_card">
                    <a href="javascript:void(0)">
                        <figure class="content_img " @click="goContentDetail('1930570','false')">
                            <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/12/01/062d0400-0c7b-4b10-ad6a-32f8e7355739/thumb.png" />

                        </figure>
                        <div class="text_area">
                            <p class="content_name" @click="goContentDetail('1930570','false')">[EVENT] 2023 하반기 T카페 이벤트</p>
                            <p class="user_name" @click="goChannelHome('1247')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/22/ebcb8818-5287-497b-9b4b-c415bfc7c144/LOGO_T셀파_2022.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>T셀파</span></p>
                        </div>
                        <a href="javascript:void(0)" onclick="setLikeMain('1930570', this)" class="like_btn ">
                            <i class="ico heart"></i>
                            <span>1</span>
                        </a>
                        <div class="tag_area">

                            <span class="badge gray">기타</span>
                        </div>
                    </a>
                </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1930411','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/12/01/549dd15d-7a1d-48e9-af09-9aac42df4cc9/001.jpg" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1930411','false')">[활용사례] 우리반티셀파 서포터즈가 알려주는 학급조사 활용법!</p>
                        <p class="user_name" @click="goChannelHome('1270')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/11/4eb8bf53-e62b-4a72-b851-ce790476fc24/우리반T셀파 로고 (7).png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>우리반T셀파</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1930411', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>0</span>
                    </a>
                    <div class="tag_area">

                        <span class="badge gray">기타</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1930329','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/30/00a26a5e-17d5-4f67-ac58-f0a770986a80/사전에서 낱말빠르게 찾기 놀이.png" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1930329','false')">사전에서 낱말 빠르게 찾기 놀이(7.사전은 내 친구)</p>
                        <p class="user_name" @click="goChannelHome('1363')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_07.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>스마일샘과 즐겁게 놀며 배우는 국어</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1930329', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>1</span>
                    </a>
                    <div class="tag_area">
                        <span class="badge">초등</span>
                        <span class="badge pink">놀이활동</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1930328','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/30/d1e7a051-d5c4-491b-82e3-f0becc19fdb7/국어사전 나오는 순서대로 단어 배열하기.png" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1930328','false')">국어사전에 나오는 순서대로 단어배열하기 놀이(7.사전은 내 친구)</p>
                        <p class="user_name" @click="goChannelHome('1363')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_07.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>스마일샘과 즐겁게 놀며 배우는 국어</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1930328', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>1</span>
                    </a>
                    <div class="tag_area">
                        <span class="badge">초등</span>
                        <span class="badge pink">놀이활동</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1930270','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/30/1a40ba4b-0897-44b4-aca6-c2bcdbbb4f6a/(만들기_수업 PPT)3-1-1-(1)_15차시_고장 사랑 시화 액자 만들기.jpg" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1930270','false')">[만들기]고장 사랑 시화 액자 만들기</p>
                        <p class="user_name" @click="goChannelHome('1250')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/07/c9002979-8657-41e9-9c25-a970c027b8af/20230807_063211.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>밀라쌤</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1930270', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>1</span>
                    </a>
                    <div class="tag_area">
                        <span class="badge">초등</span>
                        <span class="badge orange">만들기</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1855463','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/07/28/ef5687a4-22a1-44e8-914b-76bad1547e44/티셀파업로드용썸네일(도로롱귤모자).png" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1855463','false')">[실로 만드는 세상]도로롱 귤모자</p>
                        <p class="user_name" @click="goChannelHome('1219')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/24/141c975b-6399-40f6-b732-3015a4652bd4/채널아이콘.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>타래샘</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1855463', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>11</span>
                    </a>
                    <div class="tag_area">
                        <span class="badge">초등</span>
                        <span class="badge orange">만들기</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img video_content" @click="goContentDetail('1930097','true')">
                        <img src="https://i.ytimg.com/vi/kF-No2D4T3k/hqdefault.jpg" />
                        <span class="video_time">03:46</span>
                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1930097','true')">[교실 놀이] 협동 풍선 띄우기ㅣ풍선ㅣ도전ㅣ협동ㅣ집중ㅣ대결ㅣ도구활용놀이ㅣ교실놀이ㅣ교실체육</p>
                        <p class="user_name" @click="goChannelHome('1306')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/20/e3a4777b-3f09-4042-8602-c8f496cd9d8f/템플릿 기본_복사본-001 (1).png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>나승빈 선생님의 함행우 이야기</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1930097', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>2</span>
                    </a>
                    <div class="tag_area">

                        <span class="badge red">유튜브</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1930015','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/29/d5d1163f-e622-44a5-89ba-b69f49b139dd/과학(이)_3-1-2_8차시_게임PPT_고양이발자국.png" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1930015','false')">과학_3-1-2_8차시_게임PPT(고양이발자국)</p>
                        <p class="user_name" @click="goChannelHome('1273')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/11/19/85ad31f8-2214-4fd9-b00a-e4abfbcdeea7/제목을 입력해주세요_-001 (1).jpg" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>프로게이머</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1930015', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>1</span>
                    </a>
                    <div class="tag_area">
                        <span class="badge">초등</span>
                        <span class="badge purple">게임PPT</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1930014','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/29/8fcf3324-9dbe-4475-8072-87a71f5ca6e1/과학(이)_3-1-2_7차시_게임PPT_동물농장퀴즈.png" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1930014','false')">과학_3-1-2_7차시_게임PPT(동물농장퀴즈)</p>
                        <p class="user_name" @click="goChannelHome('1273')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/11/19/85ad31f8-2214-4fd9-b00a-e4abfbcdeea7/제목을 입력해주세요_-001 (1).jpg" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>프로게이머</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1930014', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>1</span>
                    </a>
                    <div class="tag_area">
                        <span class="badge">초등</span>
                        <span class="badge purple">게임PPT</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1928162','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/26/e4e2bea0-a1bf-48d8-9030-2186473a6079/제목을 입력해주세요_-001 (6).png" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1928162','false')">5-1 국어나 8단원 따라 쓰기 활동 학습 자료(1~9차시)</p>
                        <p class="user_name" @click="goChannelHome('1243')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/03/dd3ed944-904d-4f3c-ab52-7f708401b97f/오쿠 보인다.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>교실 밖 연구 모임</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1928162', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>0</span>
                    </a>
                    <div class="tag_area">
                        <span class="badge">초등</span>
                        <span class="badge green">학습지</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1914138','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/13/112973df-2e32-478b-8023-efea64ec2cf1/6-1썸네일.jpg" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1914138','false')">사회 6-1 1단원 ① 민주주의 발전과 시민 참여 정리노트(2~8차시)</p>
                        <p class="user_name" @click="goChannelHome('1253')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>곰돌이쌤과 함께하는 곰쌤채널</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1914138', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>2</span>
                    </a>
                    <div class="tag_area">
                        <span class="badge">초등</span>
                        <span class="badge green">학습지</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1929973','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/29/e3c1cd08-31ad-4b8b-8a3c-90a8053e1f6c/썸네일6-1 2단원3.jpg" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1929973','false')">사회6-1 1단원 ③ 민주정치의 원리와 국가기관의 역할 정리노트</p>
                        <p class="user_name" @click="goChannelHome('1253')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>곰돌이쌤과 함께하는 곰쌤채널</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1929973', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>0</span>
                    </a>
                    <div class="tag_area">
                        <span class="badge">초등</span>
                        <span class="badge green">학습지</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1929923','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/29/77b4e887-0642-4f12-b02f-f03547aa4dc6/슬라이드1.PNG" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1929923','false')">🔍과학 6- 1(신) 2단원 11차시 수업PPT🧪</p>
                        <p class="user_name" @click="goChannelHome('1245')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/16/a287163b-2810-4e50-94d7-6376758ca3e4/캡처.PNG" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>아꿈선의 과학교실</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1929923', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>0</span>
                    </a>
                    <div class="tag_area">
                        <span class="badge">초등</span>
                        <span class="badge blue_01">수업PPT</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1929919','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/29/2c1e7eaf-2bc6-405b-ba0e-812893866faf/슬라이드1.PNG" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1929919','false')">🔍과학 6- 1(신) 2단원 9~10차시 수업PPT🧪</p>
                        <p class="user_name" @click="goChannelHome('1245')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/16/a287163b-2810-4e50-94d7-6376758ca3e4/캡처.PNG" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>아꿈선의 과학교실</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1929919', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>0</span>
                    </a>
                    <div class="tag_area">
                        <span class="badge">초등</span>
                        <span class="badge blue_01">수업PPT</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1929915','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/29/40a4ebed-6c0a-4af1-8bac-98a61f6973d1/thumb.png" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1929915','false')">[NEWS] 12월 교사 성장 지원 워크숍 모집 안내</p>
                        <p class="user_name" @click="goChannelHome('1247')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/22/ebcb8818-5287-497b-9b4b-c415bfc7c144/LOGO_T셀파_2022.png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>T셀파</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1929915', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>1</span>
                    </a>
                    <div class="tag_area">

                        <span class="badge gray">기타</span>
                    </div>
                </a>
            </li>                     <li class="content_card">
                <a href="javascript:void(0)">
                    <figure class="content_img " @click="goContentDetail('1914900','false')">
                        <img src="//cdata2.tsherpa.co.kr/tsherpa//ssam_channel/upload/2023/11/15/8b2e0a8f-2646-4fbe-928d-02770c9112e0/021.jpg" />

                    </figure>
                    <div class="text_area">
                        <p class="content_name" @click="goContentDetail('1914900','false')">T셀파 알림장은 익명 설문조사를 할 수 있어요</p>
                        <p class="user_name" @click="goChannelHome('1270')"><i><img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/11/4eb8bf53-e62b-4a72-b851-ce790476fc24/우리반T셀파 로고 (7).png" alt="사용자 프로필 아이콘" onerror="this.onerror=null;this.src='//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/resource/channel/images/content_img/img_profile_01.png';"></i><span>우리반T셀파</span></p>
                    </div>
                    <a href="javascript:void(0)" onclick="setLikeMain('1914900', this)" class="like_btn ">
                        <i class="ico heart"></i>
                        <span>2</span>
                    </a>
                    <div class="tag_area">

                        <span class="badge gray">기타</span>
                    </div>
                </a>
            </li>        </ul>
        </div>
    </div>
    <div class="list_content_area" x-data="getMainNotice()" x-init="initFn">
        <div class="inner">
            <div class="content_list_group">
                <h2 class="content_title">공지사항<a href="/cs/notice.html" class="more_btn">더보기<i class="ico plus_01"></i></a></h2>
                <ul class="content_list">
                    <template x-for="(item,idx) in list">
                        <li>
                            <a :href="'/cs/notice_detail.html?id='+item.id+'&categoryId='+item.categoryId"><p x-html="item.title"></p></a>
                            <span class="list_date" x-text="item.publishDate"></span>
                        </li>
                    </template>
                </ul>
            </div>
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

<%@ include file="view/include/footer.jsp"%>


