<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <title>Session</title>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode;
                    document.getElementById("sample4_roadAddress").value = roadAddr;
                    document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                    document.getElementById("sample4_engAddress").value = data.addressEnglish;

                    // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                    if(roadAddr !== ''){
                        document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    } else {
                        document.getElementById("sample4_extraAddress").value = '';
                    }

                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if(data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if(data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }
    </script>
    <script>
        function validateForm(form){
            // if(!form.memId.value){
            //     alert("아이디를 입력하세요.");
            //     return false;
            // }
            if (form.memName.value==""){
                alert("이름을 입력하세요.")
                return false;
            }
            if (form.memPw.value == ""){
                alert("패스워드를 입력하세요.");
                return false;
            }
            if (form.memPw2.value == ""){
                alert("패스워드 확인을 입력하세요.")
                return false;
            }
            if (form.memPw.value != form.memPw2.value){
                alert("패스워드와 패스워드 확인이 일치하지 않습니다.")
                return false;
            }
            if (form.sample4_postcode.value==""){
                alert("주소 찾기를 진행하세요.")
                sample4_execDaumPostcode();
                return false;
            }
            if (form.sample4_detailAddress.value==""){
                alert("상세 주소를 입력하세요.")
                return false;
            }
        }
    </script>

</head>
<body>
<h2>회원가입</h2>
<form action="../../member/idcheck.do" method="post"
      onsubmit="return validateForm(this);">
    아이디 : <input type="text" name="memId"/>
<%--    <input type="button" onclick="location.href='../../member/idcheck.do?memId=${ memId }';" value="ID 중복확인"><br>--%>
    <button type="submit">중복 체크</button>
</form>


<form action="../../member/sign.do" method="post"
      onsubmit="return validateForm(this);">
    <input type="hidden" name="memId" value="${ mvo.memId }"/>
    패스워드 : <input type ="password" name="memPw" /><br/>
    패스워드 확인 : <input type ="password" name="memPw2" /><br/><br>

    이름 : <input type="text" name="memName"/><br><br>

    지역 : <select name="memRegion">
    <option value="seoul">서울</option>
    <option value="kyeonggi">경기</option>
    <option value="kangwon">강원</option>
    <option value="chungcheong">충청</option>
    <option value="jeolla">전라</option>
    <option value="kyeongsang">경상</option>
    <option value="cheju">제주</option>
    </select><br><br>

    주소 : <input type="text" name="postCode" id="sample4_postcode" placeholder="우편번호">
    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
    <input type="text" name="roadAddr" id="sample4_roadAddress" placeholder="도로명주소" size="60" ><br>
    <input type="hidden" name="jibunAddr" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
    <span id="guide" style="color:#999;display:none"></span>
    <input type="text" name="detailAddr" id="sample4_detailAddress" placeholder="상세주소"  size="60"><br>
    <input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
    <input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br><br>

    자녀 학년 : <select name="memChildGrade">
    <option value="1">1학년</option>
    <option value="2">2학년</option>
    <option value="3">3학년</option>
    <option value="4">4학년</option>
    <option value="5">5학년</option>
    <option value="6">6학년</option>
    </select><br><br>

    전화번호 : <input type="text" name="memPhone"/><br><br>

    이메일 : <input type="text" name="memEmail"/><br><br>


    <input type="submit" value="회원가입" />
</form>

<%--<a href="../member/logout.do">[로그아웃]</a>--%>

</body>
</html>
