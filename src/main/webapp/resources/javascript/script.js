$(document).ready(function(){
    setProfileImage();

    $('.profile_group > a, .upload_area > a').on('click',function(e){
        e.preventDefault();
        $(this).siblings('.option_list').fadeIn(50);
    });
    // 정렬하기 버튼 클릭 시
    $('.option_list a, .modal_close').on('click',function(e){
        e.preventDefault();
        $('.option_list, #profileSidePopup, #menuPopup, #searchRecommend').fadeOut(50);
    });
    // 외부영역 클릭시 팝업 닫기
    $(document).mouseup(function (e){
        if($(".option_list, #profileSidePopup, #menuPopup, #searchRecommend").has(e.target).length === 0){
            $(".option_list, #profileSidePopup, #menuPopup, #searchRecommend").hide();
        }
    });
    // 프로필 이미지에 마우스 hover 시
    $('.profile_group > a').on('mouseover',function(e){
        e.preventDefault();
        $('.profile_hover').stop().fadeIn(100);
    });
    $('.profile_group > a').on('mouseout',function(e){
        e.preventDefault();
        $('.profile_hover').stop().fadeOut(100);
    });

    // 스크롤 시 헤더 상단 고정
    var navHeight = $("header").height();
    $(window).scroll(function(){
        var rollIt = $(this).scrollTop() >= navHeight;
        if(rollIt){
            $(".fix_header").fadeIn(150);
        }
        else{
            $(".fix_header").fadeOut(150);
        }
    });

    $('.menu_list > li, .profile_menu.dropdown > li').on('click',function(e){
        //    e.preventDefault();
        $(this).toggleClass('on');
    });
    $('.menu_btn').on('click',function(e){
        $('#menuPopup').fadeIn(100);
    });
    $('.search_btn').on('click',function(e){
        $('#searchRecommend').fadeIn(100);
    });

});

function setProfileImage(){
}