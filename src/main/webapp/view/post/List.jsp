<%--
  Created by IntelliJ IDEA.
  User: sec
  Date: 2023-11-24
  Time: 오후 3:51
  Description: 학년별 게시글 목록 보기를 구현하는 뷰
--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!doctype html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <meta name="viewport"--%>
<%--        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">--%>
<%--  <meta http-equiv="X-UA-Compatible" content="ie=edge">--%>
<%--  <title>맘채널</title>--%>
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
<%--  --%>
<%--</head>--%>
<%--<body>--%>
<%--<%@ include file="../include/header.jsp"%>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>


<!-- contents -->
<%--<div class="content">--%>
<%--    <div class="content_card_area">--%>
<%--        <a href="./write.do">글쓰기</a>--%>
<%--        <div class="inner">--%>
<%--            <%@ include file="../include/submenu_cs.jsp"%>--%>
<!-- contents -->
<div class="content">
    <div class="content_menu customer_box">
        <div class="inner">
            <%@ include file="../include/submenu_post.jsp"%>

            <!-- 문의하기 table -->
            <div class="content_tab_area" x-data="getQnaList()" x-init="initFn">
                <form method="get" id="searchContent">
                    <div class="customer_title_area">
                        <p class="customer_title mo_none">전체 게시물
                            <c:if test="${not empty memId && memId ne 'admin'}">
                                <button type="button" class="btn btn-light input_form_btn" onclick="location.href='./write.do'">글쓰기</button>
                            </c:if>
                        </p>
                        <div class="tab_btns select_search">

                            <span class="content_num mo_none" id="pcTotalCount">총 <b>${map.totalCount}개</b>의 게시글이 있습니다.</span>
                            <span class="content_num pc_none" id="mobileTotalCount">총 <b>${map.totalCount}개</b>의 게시글이 있습니다.</span>
                            <div class="form_box">
                                <select class="form-select search_category" name="searchField">
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                                <div class="search_bar_area border">
                                    <input type="text" name="searchWord" class="search_bar" placeholder="검색어를 입력하세요." value="${ param.searchWord }"/>
                                </div>
                                <button type="submit" class="btn btn-secondary search_form_btn">검색</button>
                            </div>
                        </div>
                    </div>


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
<%--                                <figure class="content_img"></figure>--%>
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
                                <a href="javascript:void(0)" class="like_btn" :class="item.isUserLike? 'on':''" @click="setLike(item.id, idx)"><i class="ico heart"></i><span>${ row.postLikes }</span></a>
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

                </form>
            </div>
        </div><!--inner-->
    </div><!--content_card_area-->
</div>
<!--content-->
<%@ include file="../include/footer.jsp" %>
