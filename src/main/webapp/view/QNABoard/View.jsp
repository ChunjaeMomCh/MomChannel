<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 첨부형 게시판</title>
</head>
<body>
<h2>파일 첨부형 게시판 - 상세 보기(View)</h2>

<table border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr>
        <td>번호</td> <td>${ vo.qnaNo }</td>
        <td>작성자</td> <td>${ vo.memId }</td>
    </tr>
    <tr>
        <td>작성일</td> <td>${ vo.qnaDate }</td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${ vo.qnaTitle }</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">
            ${ vo.qnaContent }
        </td>
    </tr>

    <!-- 하단 메뉴(버튼) -->
    <tr>
        <td colspan="4" align="center">
            <input type="hidden" name="qnaNo" value="${ vo.qnaNo }"/>
<%--            <button type="button" onclick="location.href='../qnaboard/pass.do?mode=edit&qnaNo=${ param.qnaNo }';">--%>
<%--                수정하기--%>
<%--            </button>--%>
<%--            <button type="button" onclick="location.href='../qnaboard/pass.do?mode=delete&qnaNo=${ param.qnaNo }';">--%>
<%--                삭제하기--%>
<%--            </button>            --%>
            <button type="button" onclick="location.href='../qnaboard/edit.do?qnaNo=${ param.qnaNo }';">
                수정하기
            </button>
            <button type="button" onclick="location.href='../qnaboard/delete.do?qnaNo=${ param.qnaNo }';">
                삭제하기
            </button>
            <button type="button" onclick="location.href='../qnaboard/list.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>
</body>
</html>