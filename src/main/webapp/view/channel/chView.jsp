<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <a href="${pageContext.request.contextPath}/view/post/view.do?postNo=${ row.postNo }">${ row.postNo }  <%-- 게시글로 이동하는 링크 --%>
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