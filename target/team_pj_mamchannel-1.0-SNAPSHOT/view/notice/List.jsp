<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>맘채널</title>
    <style>a{text-decoration:none;}</style>
</head>
<body>
<h2>공지사항</h2>

<!-- 검색 폼 -->
<form method="get">
    <table border="1" width="90%">
        <tr>
            <td align="center">
                <select name="searchField">
                    <option value="전체">전체</option>
                    <option value="중요">중요 </option>
                    <option value="공지">공지</option>
                    <option value="이벤트">이벤트</option>
                </select>
                <input type="text" name="searchWord" value="${ param.searchWord }" />
                <input type="submit" value="검색하기" />
            </td>
        </tr>
    </table>
</form>

<!-- 목록 테이블 -->
<table border="1" width="90%">
    <tr>
        <th width="10%">구분</th>
        <th width="*">제목</th>
        <th width="15%">작성일</th>
        <th width="10%">조회수</th>
    </tr>
    <c:choose>
        <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
            <tr>
                <td colspan="6" align="center">
                    등록된 게시물이 없습니다^^*
                </td>
            </tr>
        </c:when>
        <c:otherwise>  <!-- 게시물이 있을 때 -->
            <c:forEach items="${ boardLists }" var="row" varStatus="loop">
                <tr align="center">
                    <td>  <!-- 번호 -->
                            ${ row.noticeCategory }
                    </td>
                    <td align="left">  <!-- 제목(링크) -->
                        <a href="../notice/view.do?idx=${ row.noticeNo }">${ row.noticeTitle }</a>
                    </td>
                    <td>${ row.noticeDate }</td>  <!-- 작성일 -->
                    <td>${ row.noticeHit }</td>  <!-- 조회수 -->
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</table>

<!-- 하단 메뉴(바로가기, 글쓰기) -->
<table border="1" width="90%">
    <tr align="center">
        <td>
            ${ map.pagingImg }
        </td>
        <td width="100"><button type="button"
                                onclick="location.href='../mvcboard/write.do';">글쓰기</button></td>
    </tr>
</table>
</body>
</html>