<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 첨부형 게시판</title>
    <script type="text/javascript">
        function validateForm(form) {  // 필수 항목 입력 확인
            // if (form.memId.value == "") {
            //     alert("작성자를 입력하세요.");
            //     form.memId.focus();
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
<h2>파일 첨부형 게시판 - 글쓰기(Write)</h2>
<%--<form name="writeFrm" method="post" enctype="multipart/form-data"--%>
<%--      action="../qnaboard/write.do" onsubmit="return validateForm(this);">--%>
<%--    <table border="1" width="90%">--%>
<%--&lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td>작성자</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type="text" name="memId" style="width:150px;" />&ndash;%&gt;--%>
<%--&lt;%&ndash;            </td>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </tr>&ndash;%&gt;--%>
<%--        <tr>--%>
<%--            <td>제목</td>--%>
<%--            <td>--%>
<%--                <input type="text" name="qnaTitle" style="width:90%;" />--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>내용</td>--%>
<%--            <td>--%>
<%--                <textarea name="qnaContent" style="width:90%;height:100px;"></textarea>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td colspan="2" align="center">--%>
<%--                <button type="submit">작성 완료</button>--%>
<%--                <button type="reset">RESET</button>--%>
<%--                <button type="button" onclick="location.href='../qnaboard/list.do';">--%>
<%--                    목록 바로가기--%>
<%--                </button>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form>--%>

<form method="post" action="../qnaboard/write.do" onsubmit="return validateForm(this);">
    <table border="1" width="90%">
        <tr>
            <td>작성자</td>
            <td>
                <input type="text" name="memId" style="width:150px;" />
            </td>
        </tr>
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="qnaTitle" style="width:90%;" />
            </td>
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

<%--<form action="../qnaboard/write.do" method="post">--%>
<%--    <input type="text"  name="qnaTitle" required style="height:30px; width: 495px" /><br /><br />--%>
<%--    <input type="text" name="qnaContent" required style="height:30px; width: 495px" /><br /><br />--%>
<%--    <input type="submit" value="작성 완료">--%>
<%--</form>--%>
</body>
</html>