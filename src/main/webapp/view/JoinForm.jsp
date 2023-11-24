<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>맘채널 - 회원가입</title>
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        function validateForm(form) {  // 필수 항목 입력 확인
            if (form.mem_id.value == "") {
                alert("아이디를 입력하세요.");
                form.mem_id.focus();
                return false;
            }
            if (form.mem_pwd.value == "") {
                alert("비밀번호을 입력하세요.");
                form.mem_pwd.focus();
                return false;
            }
            if (form.mem_pwdcheck.value == "") {
                alert("비밀번호를 확인하세요.");
                form.mem_pwdcheck.focus();
                return false;
            }
            if (form.mem_phone.value == "") {
                alert("전화번호를 입력하세요.");
                form.mem_phone.focus();
                return false;
            }
            if (form.mem_email1.value == "") {
                alert("이메일을 입력하세요.");
                form.mem_email1.focus();
                return false;
            }
            if (form.mem_email2.value == "") {
                alert("이메일을 입력하세요.");
                form.mem_email2.focus();
                return false;
            }
        }
    </script>
</head>
<body>
<div class="container border">
    <h2>회원가입</h2>
    <form name="joinform" method="post" action="#회원가입 컨트롤러"
          class="form-label" onsubmit="return validateForm(this)">
        <table>
            <tr>
                <td>아이디</td>
                <td>
                    <input type="text" name="mem_id"/>
                </td>
                <td>
                    <input type="button" value="중복확인">
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="password" name="mem_pwd"/>
                </td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td>
                    <input type="password" name="mem_pwdcheck"/>
                </td>
                <td>
                    <input type="button" value="확인">
                </td>
            </tr>
            <tr>
                <td>성함</td>
                <td>
                    <input type="text" name="mem_name"/>
                </td>
            </tr>
            <tr>
                <td>지역</td>
                <td>
                    <select name="mem_region">
                        <option value="seoul">서울</option>
                        <option value="gyeonggi">경기</option>
                        <option value="chungcheong">충청</option>
                        <option value="jeolla">전라</option>
                        <option value="gangwon">강원</option>
                        <option value="gyeongsang">경상</option>
                        <option value="jeju">제주</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>자녀 학년</td>
                <td>
                    <select name="mem_child_grade">
                        <option value="1">1학년</option>
                        <option value="2">2학년</option>
                        <option value="3">3학년</option>
                        <option value="4">4학년</option>
                        <option value="5">5학년</option>
                        <option value="6">6학년</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>
                    <input type="text" name="mem_phone" placeholder="숫자만 입력하세요.">
                </td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <input type="text" name="mem_email1">@
                    <input type="text" name="mem_email2">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <button type="submit">가입</button>
                    <button type="submit">취소</button>
                </td>
            </tr>
        </table>
    </form>
</div>
<script src="../resources/js/bootstrap.min.js"></script>
</body>
</html>
