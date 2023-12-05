<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<%@ include file="../include/header.jsp"%>
<%--<html>
<head>--%>
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
    <style>
        html,
        body {
            height: 100%;
        }
        
        .form-signin {
            max-width: 50%;
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
        .row label {
            font-size: 0.8em;
        }
    </style>
<%--</head>
<body>--%>
<div class="content">
    <div class="content_menu customer_box">
        <div class="inner">
            <!-- inner content -->
            <main class="form-signin w-100 m-auto">
                <div style="text-align: center; margin-bottom: 3em;">
                    <h1 class="h3 mb-3 fw-normal">회원가입</h1>
                </div>
                
                <%-- 아이디 중복 체크 --%>
                <form action="../../member/idcheck.do" method="post"
                      onsubmit="return validateForm(this);">
                    <div class="row mb-3">
                        <label for="memId" class="col-sm-2 col-form-label">아이디</label>
                        <div class="col-sm-7">
                            <input type="text" class="form-control"
                                   name="memId" id="memId"/>
                        </div>
                        <div class="col-sm-3">
                            <button type="submit" class="btn btn-light btn-sm">중복 체크</button>
                            <%--    <input type="button" onclick="location.href='../../member/idcheck.do?memId=${ memId }';" value="ID 중복확인"><br>--%>
                        </div>
                    </div>
                </form>
                <%-- 패스워드 확인 및 개인정보 입력 --%>
                <form action="../../member/sign.do" method="post"
                     onsubmit="return validateForm(this);"
                     style="margin-bottom: 6em;">
                    <input type="hidden" name="memId" value="${ mvo.memId }"/>
                    <div class="row mb-3">
                        <label for="memPw" class="col-sm-2 col-form-label">패스워드</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control"
                                   name="memPw" id="memPw">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="memPw" class="col-sm-2 col-form-label">패스워드 확인</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control"
                                   name="memPw2" id="memPw2">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="memName" class="col-sm-2 col-form-label">이름</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control"
                                   name="memName" id="memName">
                        </div>
                    </div>
                    <%-- 지역 select --%>
                    <div class="row mb-3">
                        <label for="memRegion" class="col-sm-2 col-form-label">지역</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="memRegion"
                                    id="memRegion">
                                <option value="seoul">서울</option>
                                <option value="kyeonggi">경기</option>
                                <option value="kangwon">강원</option>
                                <option value="chungcheong">충청</option>
                                <option value="jeolla">전라</option>
                                <option value="kyeongsang">경상</option>
                                <option value="cheju">제주</option>
                            </select>
                        </div>
                    </div>
                    <%-- 주소 입력 --%>
                    <div class="input_addr" style="margin: 1em 0;">
                        <div class="row mb-3">
                            <label for="sample4_postcode" class="col-sm-2 col-form-label">주소</label>
                            <div class="col-sm-7">
                                <input type="text" class="form-control"
                                       name="postCode" id="sample4_postcode"
                                       placeholder="우편번호">
                            </div>
                            <div class="col-sm-3">
                                <input type="button" class="btn btn-light btn-sm"
                                 onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="roadAddr" id="sample4_roadAddress" placeholder="도로명주소" size="60" ><br>
                                <input type="hidden" class="form-control" name="jibunAddr" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
                                <span id="guide" style="color:#999;display:none"></span>
                                <input type="text" class="form-control" name="detailAddr" id="sample4_detailAddress" placeholder="상세주소"  size="60"><br>
                                <input type="hidden" class="form-control" id="sample4_extraAddress" placeholder="참고항목"  size="60">
                                <input type="hidden" class="form-control" id="sample4_engAddress" placeholder="영문주소"  size="60" >
                            </div>
                        </div>
                    </div>
                    <%-- 학년 select --%>
                    <div class="row mb-3">
                        <label for="memChildGrade" class="col-sm-2 col-form-label">자녀 학년</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="memChildGrade"
                                    id="memChildGrade">
                                <option value="1">1학년</option>
                                <option value="2">2학년</option>
                                <option value="3">3학년</option>
                                <option value="4">4학년</option>
                                <option value="5">5학년</option>
                                <option value="6">6학년</option>
                            </select>
                        </div>
                    </div>
                    <%--  // 학년 select --%>
                    <div class="row mb-3">
                        <label for="memPhone" class="col-sm-2 col-form-label">전화번호</label>
                        <div class="col-sm-10">
                            <input type="tel" class="form-control"
                                   name="memPhone" id="memPhone" />
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="memEmail" class="col-sm-2 col-form-label">이메일</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control"
                                   name="memEmail" id="memEmail" />
                        </div>
                    </div>
                    <%--  // 개인정보 입력 --%>
                    <input type="submit" class="btn btn-light input_form_btn" value="회원가입" />
                    <%--<a href="../member/logout.do">[로그아웃]</a>--%>
                </form>
            </main>
        </div>
    </div>
</div>
<%--

</body>
</html>
--%>
<%@ include file="../include/footer.jsp"%>
