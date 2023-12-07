<%@ page import="java.util.Date" %><%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: sec--%>
<%--  Date: 2023-11-26--%>
<%--  Time: 오후 6:50--%>
<%--  Title: 게시글 상세보기 페이지--%>
<%--  Description:--%>
<%--    - 게시글 카테고리 (지역), (학년)--%>
<%--    - 제목, 작성일시, 게시자 이미지+채널이름(채널 링크)--%>
<%--    - 좋아요 수, 공유 링크--%>
<%--    - 첨부파일 리스트--%>
<%--    - 게시글 내용--%>
<%--    - 사이드 - 글쓴이의 다른 글 썸네일+제목--%>
<%--    - 게시글 내용--%>
<%--    - 댓글 수--%>
<%--    - 댓글 입력 창--%>
<%--    - 댓글 입력 버튼--%>
<%--    - 댓글 목록--%>
<%--    - 작성자 이미지, 아이디, 내용, 입력 시간--%>
<%--&ndash;%&gt;--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java"--%>
<%--         pageEncoding="UTF-8" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"--%>
<%--        rel="stylesheet">--%>
<%--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--  <title>맘채널 - 게시글 상세 보기</title>--%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/froala_style.css"--%>
<%--        type="text/css">--%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"--%>
<%--        type="text/css">--%>
<%--  <link rel="preconnect" href="https://fonts.googleapis.com">--%>
<%--  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
<%--  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=--%>
<%--  Public+Sans&display=swap" rel="stylesheet">--%>
<%--  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>--%>
<%--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>--%>
<%--  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<%@ include file="../include/header.jsp"%>--%>
<%-- 게시판 상세 보기 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>


<!-- contents -->
<div class="content">
    <div class="inner detail">
        <div class="content_detail_area">
            <div class="content_post">
                <div class="post_title_area">
                    <div class="text_area">
                        <span class="tag" style="background-color: #0a64ff">${ vo.postRegion }</span>
                        <span class="tag" style="background-color: #00b69e">${ vo.postGrade }</span>
                        <h4 class="content_title">${ vo.postTitle } </h4>
                        <span class="date"><fmt:formatDate value="${ vo.postDate }" pattern="yyyy-MM-dd"/></span>
                    </div>
                    <figure>
                        <c:if test="${vo.postSFile eq null}">
                            <img src="/Uploads/default_thumbnail.jpg" alt="게시물 썸네일 이미지">
                        </c:if>
                        <c:if test="${vo.postSFile ne null}">
                            <img src="/Uploads/${ vo.postSFile }" alt="게시물 썸네일 이미지">
                        </c:if>
                    </figure>
                </div>
                <div class="post_btns_area">
                    <div class="channel_name_area">
                        <figure>
                            <img src="//cdata2.tsherpa.co.kr/tsherpa/ssam_channel/upload/2023/08/24/3edff180-0518-4e9c-b6a5-f011a7043a90/1-removebg-preview (2).png"
                                 alt="사용자 프로필 이미지"></figure>
                        <a href="/channel/home.html?channel_id=1327" class="user_neme">${vo.memId}</a>
                        <!-- 20230428 :: 버튼 공통화 적용 -->
                        <!-- 클릭 시 disabled 클래스 추가해주세요 -->
                    </div>
                    <c:if test="${vo.memId eq loginMember.memId}">
                        <div class="post_btns">
                            <button type="button" class="btn btn-light input_form_btn"
                                    onclick="location.href='./edit.do?postNo=${vo.postNo}';">수정하기
                            </button>
                            <button type="button" class="btn btn-light input_form_btn"
                                    onclick="location.href='./delete.do?postNo=${ vo.postNo }';">삭제하기
                            </button>
                        </div>
                    </c:if>
                </div>
                <div class="text_body">
                    <p>
                    <p id="isPasted"
                       style='box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 16px; font-family: "Public Sans", "Noto Sans KR", sans-serif; font-style: normal; vertical-align: baseline; line-height: 28px; letter-spacing: -0.16px; color: rgb(0, 0, 0); font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;'>
            <span style='box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 18px; font-family: "Public Sans", "Noto Sans KR", sans-serif; font-style: normal; vertical-align: baseline;'>
                ${ vo.postContent }
            </span>
                    </p>

                </div>
<%--                <div class="attached_file_area">--%>
<%--                    <p class="post_type_title">첨부파일<span class="num"></span></p>--%>
<%--                    <div class="file_list">--%>
<%--                        <div class="list_header">--%>
<%--                            <div class="checkbox">--%>
<%--                                <input type="checkbox" id="all">--%>
<%--                                <label for="all" @click="checkAll()">파일명</label>--%>
<%--                            </div>--%>
<%--                            <p class="download_text">다운</p>--%>
<%--                        </div>--%>
<%--                        <ul class="attached_file">--%>
<%--                            <li>--%>
<%--                                <div class="checkbox">--%>
<%--                                    <input type="checkbox">--%>
<%--                                    <label for="1037379">파일명: (3~6학년)새해 첫날이 밝았습니다.zip</label>--%>
<%--                                </div>--%>
<%--                                <a class="download_btn" href="javascript:void(0);"--%>
<%--                                   @click="if(!checkUserLoggIn()){return;}"><i class="ico download"></i></a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <%-- 댓글 영역 --%>
                <script>
                    function commentSave(form){
                        if(!form.commentTxt.value){
                            alert("내용을 입력하세요.");
                            return false;
                        }
                    }
                </script>
                <div class="comments_area">
                    <p class="post_type_title">댓글<span class="num">${commentTotal}</span></p>
                    <div class="reply_list">
                        <div class="reply_box">
                            <div class="text_box">
                                <form action="./comment/write.do" method="post" class="loginFrm form-signin"
                                      onsubmit="return commentSave(this);">
                                    <input type="hidden" name="postNo" value="${vo.postNo}">
                                    <textarea placeholder="댓글을 입력하세요." name="commentTxt"></textarea>
                                    <button type="submit" class="add_btn comment_btn" id="btn_comment">확인</button>

                                </form>
                            </div>
                        </div>
                        <c:forEach items="${ commentLists }" var="row" varStatus="loop">
                            <div class="reply">
                                <div class="reple_inner">
                                    <figure><img :src="item.userImage" alt=""></figure>
                                    <div class="text_box">
                                        <a :href="'/channel/home.html?channel_id='+item.userChannelId" class="user_name"
                                           x-text="item.userChannelName" href="/channel/home.html?channel_id=">${row.memId}</a>
                                        <p class="reply_text">${row.commentTxt}</p>
                                        <div class="reply_footer">
                                            <div class="reply_date">
                                                <p><fmt:formatDate value="${row.commentDate}" pattern="yyyy-MM-dd"/></p>
                                                <span class="time"><fmt:formatDate value="${row.commentDate}" type="time" pattern="hh:mm:ss"/></span>
                                                <c:if test="${row.memId eq loginMember.memId or vo.memId eq loginMember.memId}">
                                                    <a href="./comment/delete.do?commentNo=${row.commentNo}" class="re_reply">삭제</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <a href="/view/post/list.do" class="btn large gray list_load">목록</a>
            </div>


        </div>
    </div>
</div>
<!-- content 끝 -->
<%@ include file="../include/footer.jsp" %>