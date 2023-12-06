<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<div class="content_snb " >
    <p class="snb_title">지역별 게시판</p>
    <ul class="snb_list" id="cs_menu">
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=전국" class="snb_menu_title">전국</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=서울" class="snb_menu_title">서울</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=경기" class="snb_menu_title">경기</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=강원" class="snb_menu_title">강원</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=충청" class="snb_menu_title">충청</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=경상" class="snb_menu_title">경상</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=전라" class="snb_menu_title">전라</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=제주" class="snb_menu_title">제주</a></li>
    </ul>
</div>
<script>
    $(document).ready(function(){
        const param = window.location.search;
        if(param.includes("?region=%EC%A0%84%EA%B5%AD")){
            $('#cs_menu li').eq(0).addClass("active");
        } else if(param.includes("?region=%EC%84%9C%EC%9A%B8")) {
            $('#cs_menu li').eq(1).addClass("active");
        } else if(param.includes("?region=%EA%B2%BD%EA%B8%B0")) {
            $('#cs_menu li').eq(2).addClass("active");
        } else if(param.includes("?region=%EA%B0%95%EC%9B%90")) {
            $('#cs_menu li').eq(3).addClass("active");
        } else if(param.includes("?region=%EC%B6%A9%EC%B2%AD")) {
            $('#cs_menu li').eq(4).addClass("active");
        } else if(param.includes("?region=%EA%B2%BD%EC%83%81")) {
            $('#cs_menu li').eq(5).addClass("active");
        } else if(param.includes("?region=%EC%A0%84%EB%9D%BC")) {
            $('#cs_menu li').eq(6).addClass("active");
        } else if(param.includes("?region=%EC%A0%9C%EC%A3%BC")) {
            $('#cs_menu li').eq(7).addClass("active");
        }
    });
</script>