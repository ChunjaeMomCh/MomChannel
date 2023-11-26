<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 첨부형 게시판</title>
    <script type="text/javascript">
        function validateForm(form) {
            // if (form.name.value == "") {
            //     alert("작성자를 입력하세요.");
            //     form.name.focus();
            //     return false;
            // }
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
</head>
<h2>파일 첨부형 게시판 - 수정하기(Edit)</h2>
<form name="writeFrm" method="post" enctype="multipart/form-data" action="../qnaboard/edit.do" onsubmit="return validateForm(this);">
    <input type="hidden" name="qnaNo" value="${ vo.qnaNo }"/>

    <table border="1" width="90%">
<%--        <tr>--%>
<%--            <td>작성자</td>--%>
<%--            <td>--%>
<%--                <input type="text" name="name" style="width:150px;" value="${ vo.name }" />--%>
<%--            </td>--%>
<%--        </tr>--%>
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="qnaTitle" style="width:90%;" value="${ vo.qnaTitle }" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="qnaContent" style="width:90%;height:100px;">${ vo.qnaContent }</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">RESET</button>
                <button type="button" onclick="location.href='../qnaboard/list.do';">
                    목록 바로가기
                </button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>