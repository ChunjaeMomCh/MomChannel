<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="view/include/header.jsp"%>

<div class="content">
    <c:choose>
        <c:when test="${empty memId}">
            <a href="./view/Login/loginForm.jsp">로그인</a><br>
        </c:when>
        <c:when test="${not empty memId}">
            <a href="./member/logout.do">로그아웃</a><br>
        </c:when>
    </c:choose>
    <a href="./view/Login/signForm.jsp">회원가입</a><br>
    <a href="./member/myinfo.do">내정보</a>

</div> <%-- content의 끝 --%>

<%@ include file="view/include/footer.jsp"%>


