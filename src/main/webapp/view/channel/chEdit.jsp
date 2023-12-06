<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

<script type="text/javascript">
    function validateForm(form) {  // 필수 항목 입력 확인
        if (form.qnaTitle.value == "") {
            alert("제목을 입력하세요.");
            form.qnaTitle.focus();
            return false;
        }
        if (form.qnaContent.value == "") {
            alert("내용을 입력하세요.");
            form.qnaContent.focus();
            return false;
        }
    }
</script>


<!-- contents -->
<div class="content">
    <h2>채널 수정하기</h2>
    <form method="post" <%--action="../ch/chedit.do"--%> onsubmit="return validateForm(this);">
        <input type="hidden" name="memId" value="${ cvo.memId }"/>


        <table border="1" width="90%">
            <tr>
                <td>아이디</td>
                <td>
                    ${cvo.memId}
                </td>
            </tr>
            <tr>
                <td>채널 이름</td>
                <td>
                    <input type="text" name="channelTitle" style="width:90%;" value="${ cvo.channelTitle }" />
                </td>
            </tr>
            <tr>
                <td>채널 정보</td>
                <td>
                    <textarea name="channelInfo" style="width:90%;height:100px;">${ cvo.channelInfo }</textarea>
                </td>
            </tr>
            <tr>
                <td>채널 구독자</td>
                <td>
                    ${cvo.channelSub}명
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <button type="submit">수정 완료</button>
                    <button type="reset">RESET</button>
                    <button type="button" onclick="location.href='../ch/chlist.do';">
                        목록 바로가기
                    </button>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        function validateForm(form) {
            if (form.channelTitle.value == "") {
                alert("채널 이름을 입력하세요.");
                form.channelTitle.focus();
                return false;
            }
            if (form.channelInfo.value == "") {
                alert("채널 정보를 입력하세요.");
                form.channelInfo.focus();
                return false;
            }
        }
    </script>
</div>
<!--// contents -->

<%@ include file="../include/footer.jsp"%>






<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채널 수정하기</title>

</head>

</body>
</html>