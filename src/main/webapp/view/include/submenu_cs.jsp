<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<div class="content_snb " >
    <p class="snb_title">서비스 안내</p>
    <ul class="snb_list" id="cs_menu">
        <li class="snb_menu"><a href="/view/cs/introduce.jsp" class="snb_menu_title">맘채널 소개</a></li>
        <li class="snb_menu"><a href="/view/cs/notice/list.do" class="snb_menu_title">공지사항</a></li>
        <li class="snb_menu"><a href="/view/cs/qna/list.do" class="snb_menu_title">문의하기</a></li>
    </ul>
</div>
<script>
    $(document).ready(function(){
        const path = window.location.pathname;
        if(path == "/view/cs/introduce.jsp"){
            $('#cs_menu li').eq(0).addClass("active");
        } else if(path == "/view/cs/notice.html" || path == "/view/cs/notice_detail.html") {
            $('#cs_menu li').eq(1).addClass("active");
        } else if(path == "/view/cs/qna.do") {
            $('#cs_menu li').eq(2).addClass("active");
        }
    });
</script>