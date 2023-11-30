<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %></h1>
<br/>
<a href="hello-servlet">Hello Servlet</a><br>
<a href="./notice/list.do">공지사항</a><br>
<a href="./qnaboard/list.do">문의하기</a><br>
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

</body>
</html>