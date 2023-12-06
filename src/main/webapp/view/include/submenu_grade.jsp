<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<div class="content_snb " >
    <p class="snb_title">학년별 게시판</p>
    <ul class="snb_list" id="cs_menu">
        <li class="snb_menu"><a href="/view/post/by-grade/list.do?grade=0" class="snb_menu_title">전학년</a></li>
        <li class="snb_menu"><a href="/view/post/by-grade/list.do?grade=1" class="snb_menu_title">1학년</a></li>
        <li class="snb_menu"><a href="/view/post/by-grade/list.do?grade=2" class="snb_menu_title">2학년</a></li>
        <li class="snb_menu"><a href="/view/post/by-grade/list.do?grade=3" class="snb_menu_title">3학년</a></li>
        <li class="snb_menu"><a href="/view/post/by-grade/list.do?grade=4" class="snb_menu_title">4학년</a></li>
        <li class="snb_menu"><a href="/view/post/by-grade/list.do?grade=5" class="snb_menu_title">5학년</a></li>
        <li class="snb_menu"><a href="/view/post/by-grade/list.do?grade=6" class="snb_menu_title">6학년</a></li>
    </ul>
</div>
<script>
    $(document).ready(function(){
        const param = window.location.search;
        if(param.includes("?grade=0")){
            $('#cs_menu li').eq(0).addClass("active");
        } else if(param.includes("?grade=1")) {
            $('#cs_menu li').eq(1).addClass("active");
        } else if(param.includes("?grade=2")) {
            $('#cs_menu li').eq(2).addClass("active");
        } else if(param.includes("?grade=3")) {
            $('#cs_menu li').eq(3).addClass("active");
        } else if(param.includes("?grade=4")) {
            $('#cs_menu li').eq(4).addClass("active");
        } else if(param.includes("?grade=5")) {
            $('#cs_menu li').eq(5).addClass("active");
        } else if(param.includes("?grade=6")) {
            $('#cs_menu li').eq(6).addClass("active");
        }
    });
</script>