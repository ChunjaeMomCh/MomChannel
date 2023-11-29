<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내 정보 보기</title>
</head>
<body>
<%--<%@ include file="include/header.jsp"%>--%>

<div class="content">

<h2>내 정보 보기</h2>

<table border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr>
        <td>회원 이미지</td>
        <td colspan="3">${ mvo.memImg }</td>
    </tr>
    <tr>
        <td>아이디</td>
        <td colspan="3">${ mvo.memId }</td>
    </tr>
    <tr>
        <td>이름</td>
        <td colspan="3">${ mvo.memName }</td>
    </tr>
    <tr>
        <td>지역</td>
        <td colspan="3">${ mvo.memRegion }</td>
    </tr>
    <tr>
        <td>주소</td>
        <td colspan="3">${ mvo.memAddr }</td>
    </tr>
    <tr>
        <td>자녀 학년</td>
        <td colspan="3">${ mvo.memChildGrade }</td>
    </tr>
    <tr>
        <td>전화번호</td>
        <td colspan="3">${ mvo.memPhone }</td>
    </tr>
    <tr>
        <td>이메일</td>
        <td colspan="3">${ mvo.memEmail }</td>
    </tr>

    <!-- 하단 메뉴(버튼) -->
     <tr>
         <td colspan="4" align="center">
<%--            <input type="hidden" name="qnaNo" value="${ vo.qnaNo }"/>--%>
<%--            <input type="hidden" name="memId" value="${ vo.memId }"/>--%>
            <button type="button" onclick="location.href='../member/myinfoedit.do?memId=${ param.memId }';">
                수정하기
            </button>

         </td>
      </tr>

    </table>
</div> <%-- content의 끝 --%>

<%--    <%@ include file="include/footer.jsp"%>--%>
</body>
</html>