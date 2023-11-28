<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의글 답변 작성</title>
    <script type="text/javascript">
        function validateForm(form) {  // 필수 항목 입력 확인
            if (form.qnaContent.value == "") {
                alert("내용을 입력하세요.");
                form.qnaContent.focus();
                return false;
            }
        }
    </script>
</head>
<h2>답변 작성</h2>

<form method="post" action="../qnaboard/answer.do" onsubmit="return validateForm(this);">
    <table border="1" width="90%">
        <input type="hidden" name="qnaNo" value="${ vo.qnaNo }"/>
        <input type="hidden" name="qnaTitle" value="${ vo.qnaTitle }"/>
        <tr>
            <td>제목 : </td> <td>┗━ 답변 : ${ vo.qnaTitle }</td>
        </tr>

        <tr>
            <td>내용</td>
            <td>
                <textarea name="qnaContent" style="width:90%;height:100px;"></textarea>
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