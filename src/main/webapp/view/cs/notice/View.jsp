<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>맘채널</title>
</head>
<body>
<h2>공지사항 상세보기</h2>

<table border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr>
        <td colspan="2"> <${ vo.noticeCategory } &nbsp; ${ vo.noticeTitle }</td>
    </tr>
    <tr>
        <td>${ vo.noticeDate }</td><td>${ vo.noticeHit }</td>
    </tr>
    <tr>
        <td colspan="2" height="100">
            ${ vo.noticeContent }
        </td>
    </tr>

    <!-- 하단 메뉴(버튼) -->
    <tr>
        <td colspan="2" align="center">
            <input type="hidden" name="noticeNo" value="${ vo.noticeNo }"/>
            <button type="button" onclick="location.href='../notice/edit.do?qnaNo=${ param.noticeNo }';">
                수정하기
            </button>
            <button type="button" onclick="location.href='../notice/delete.do?qnaNo=${ param.noticeNo }';">
                삭제하기
            </button>
            <button type="button" onclick="location.href='../notice/list.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>
</body>
</html>