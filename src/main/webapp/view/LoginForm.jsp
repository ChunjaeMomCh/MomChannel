<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>맘채널 - 로그인</title>
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container border">
        <h2>로그인</h2>
        <form name="loginform" method="post" action="#로그인 컨트롤러" class="form-label">
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
                        <a href="#회원가입 페이지">아직 회원이 아니십니까?</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script src="../resources/js/bootstrap.min.js"></script>
</body>
</html>
