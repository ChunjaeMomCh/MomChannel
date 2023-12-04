<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<script>
    function validateForm(form){
        if(!form.memId.value){
            alert("아이디를 입력하세요.");
            return false;
        }
        if (form.memPw.value == ""){
            alert("패스워드를 입력하세요.");
            return false;
        }
    }
</script>
<style>
    html,
    body {
        height: 100%;
    }
    
    .form-signin {
        max-width: 330px;
        padding: 1rem;
    }
    
    .form-signin .form-floating:focus-within {
        z-index: 2;
    }
    
    .form-signin input[type="email"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }
    
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }
</style>
<!-- contents -->
<div class="content">
    <div class="content_menu customer_box">
        <div class="inner">
            <!-- inner content -->
            <main class="form-signin w-100 m-auto">
                <form action="../../member/login.do" method="post" class="loginFrm form-signin"
                      onsubmit="return validateForm(this);">
                    <%--<img class="mb-4" src="/resources/images/logo.png" alt="" width="166px" height="100%" align="center">--%>
                    <h1 class="h3 mb-3 fw-normal" align="center">로그인</h1>
                    
                    <div class="form-floating">
                        <input type="text" class="form-control" name="memId"
                               id="floatingInput" placeholder="아이디">
                        <label for="floatingInput">아이디</label>
                    </div>
                    <div class="form-floating">
                        <input type="password" class="form-control" name="memPw"
                               id="floatingPassword" placeholder="비밀번호">
                        <label for="floatingPassword">비밀번호</label>
                    </div>
                    <%-- 아이디 기억 --%>
                    <%--<div class="form-check text-start my-3">
                        <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
                        <label class="form-check-label" for="flexCheckDefault">
                            Remember me
                        </label>
                    </div>--%>
                    <button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
                    <p class="mt-5 mb-3 text-body-secondary">&copy; 2017–2023</p>
                </form>
            </main>
            <!-- inner content -->
        </div>
    </div>
</div>
<!--// contents -->

<%@ include file="../include/footer.jsp"%>
