<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>맘채널 - 로그인</title>
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <script>
        <%-- validateForm으로 빈 form이 있는지 판별 --%>
        function validateForm(form) {
            if (!form.user_id.value) {
                alert("아이디를 입력하세요.");
                return false;
            }
            if (form.user_pw.value == "") {
                alert("패스워드를 입력하세요.");
                return false;
            }
        }
    </script>
</head>
<body>
    <div class="container border">
        <h2>로그인</h2>
        <form name="loginform" method="post" action="../controller/login.do"
              onsubmit="return validateForm(this);" class="form-label">
            <table>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="mem_id" style="width:150px;" />
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password" name="mem_pwd" style="width:150px;" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="checkbox" name="remember_id" id="remember_id">
                        <label for="remember_id">아이디 기억하기</label>
                        <button type="submit">로그인</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="JoinForm.jsp">아직 회원이 아니십니까?</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script src="../resources/js/bootstrap.min.js"></script>
</body>
</html>
