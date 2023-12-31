<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../include/header.jsp"%>

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
    <script type="text/javascript">
        function validateForm(form) {

            if (form.sample4_postcode.value == "") {
                alert("주소를 입력하세요.");
                return false;
            }
            if (form.memPhone.value == "") {
                alert("전화번호를 입력하세요.");
                form.memPhone.focus();
                return false;
            }
            if (form.memEmail.value == "") {
                alert("이메일을 입력하세요.");
                form.memEmail.focus();
                return false;
            }
        }
    </script>
    <script>
        function setThumbnail(event){
            var reader = new FileReader();

            reader.onload = function(event){
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                img.setAttribute("class", "col-lg-6");
                document.querySelector("div#image_container").appendChild(img);
            };

            reader.readAsDataURL(event.target.files[0]);
        }
    </script>

<style>
    /*
    td.field {
        border-left: 1px solid #dee2e6;
        border-right: 1px solid #dee2e6;
    }
    tr {
        border-bottom: 1px solid #dee2e6;
    }
    */
    .detail_area_content {
        padding: 1.2em 0.8em;
        display: block;
    }
    .row {
        text-size: 1rem;
        line-height: 1.5rem;
        height: 2rem;
        margin-bottom: 0.4rem;
    }
    input {
        line-height: 1.5rem;
        height: 2rem;
        margin-bottom: 0.4rem;
    }
    .row.info_field {
        height: 100%;
        border-bottom: 1px solid #000;
    }
    .row.addr_field {
        height: fit-content;
    }
</style>

<div class="content">
    <div class="content_menu customer_box">
        <div class="inner">
            <div class="content_tab_area">
                <div class="customer_title_area">
                    <div class="customer_title">내 정보 수정</div>
                </div>
                <div class="detail_area">
                    <form method="post" action="../member/myinfoedit.do" enctype="multipart/form-data" onsubmit="return validateForm(this);">
                        <div class="detail_area_content">
                            <input type="hidden" name="memId" value="${ mvo.memId }"/>
                            <input type="hidden" name="memSImg" value="${ mvo.memSImg }" />
<%--                            <input type="hidden" name="memImg" value="${ mvo.memImg }" />--%>
                            <div class="row info_field">
                                <%-- 텍스트 정보 --%>
                                <div class="col-sm-9">
                                    <div class="row">
                                        <div class="col-sm-3">아이디</div>
                                        <div class="col-sm-6">${ mvo.memId }</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">이름</div>
                                        <div class="col">${ mvo.memName }</div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">지역</div>
                                        <div class="col">
                                            <select class="form-select form-control" name="memRegion" style="width: 30%">
                                                <option value="seoul" ${ mvo.memRegion == "seoul" ? "selected" : "" }>서울</option>
                                                <option value="kyeonggi" ${ mvo.memRegion == "kyeonggi" ? "selected" : "" }>경기</option>
                                                <option value="kangwon" ${ mvo.memRegion == "kangwon" ? "selected" : "" }>강원</option>
                                                <option value="chungcheong" ${ mvo.memRegion == "chungcheong" ? "selected" : "" }>충청</option>
                                                <option value="jeolla" ${ mvo.memRegion == "jeolla" ? "selected" : "" }>전라</option>
                                                <option value="kyeongsang" ${ mvo.memRegion == "kyeongsang" ? "selected" : "" }>경상</option>
                                                <option value="cheju" ${ mvo.memRegion == "cheju" ? "selected" : "" }>제주</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row addr_field">
                                        <div class="col-sm-3">주소</div>
                                        <div class="col">
                                            <%-- 우편번호 입력 --%>
                                            <div class="row">
                                                <div class="col"><input type="text" name="postCode" id="sample4_postcode" value="${fn:split(mvo.memAddr,'/')[0]}" placeholder="우편번호"></div>
                                                <div class="col"><input type="button" class="btn btn-light btn-sm" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></div>
                                            </div>
                                            <%-- 도로명/지번 주소 --%>
                                            <div class="row">
                                                <input type="text" name="roadAddr" id="sample4_roadAddress" value="${fn:split(mvo.memAddr,'/')[1]}" placeholder="도로명주소" size="60" >
<%--                                                <input type="hidden" name="jibunAddr" id="sample4_jibunAddress" placeholder="지번주소"  size="60">--%>
                                                <span id="guide" style="color:#999;display:none"></span>
                                            </div>
                                            <%-- 상세 주소 --%>
                                            <div class="row">
                                                <input type="text" name="detailAddr" id="sample4_detailAddress" value="${fn:split(mvo.memAddr,'/')[2]}" placeholder="상세주소"  size="60">
                                                <input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
                                                <input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">자녀 학년</div>
                                        <div class="col">
                                            <select class="form-select form-control" name="memChildGrade" style="width: 30%">
                                                <option value="1" ${ mvo.memChildGrade == "1" ? "selected" : "" }>1학년</option>
                                                <option value="2" ${ mvo.memChildGrade == "2" ? "selected" : "" }>2학년</option>
                                                <option value="3" ${ mvo.memChildGrade == "3" ? "selected" : "" }>3학년</option>
                                                <option value="4" ${ mvo.memChildGrade == "4" ? "selected" : "" }>4학년</option>
                                                <option value="5" ${ mvo.memChildGrade == "5" ? "selected" : "" }>5학년</option>
                                                <option value="6" ${ mvo.memChildGrade == "6" ? "selected" : "" }>6학년</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">전화번호</div>
                                        <div class="col">
                                            <input type="text" name="memPhone" style="width:90%;" value="${ mvo.memPhone }" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3">이메일</div>
                                        <div class="col">
                                            <input type="text" name="memEmail" style="width:90%;" value="${ mvo.memEmail }" />
                                        </div>
                                    </div>
                                </div>
                                <%-- 회원 이미지 --%>
                                <div class="col-sm-3 align-items-center img_field">
                                    <div class="row text-center">
                                        <%--                <img src="../Uploads/${ mvo.memSImg }" style="max-width:20%;"/>--%>
                                        <input class="form-control" id="formFile" type="file" name="memImg" onchange="setThumbnail(event);"/>
                                        <%--                <% originImg =  mvo.memImg }%>--%>
                                    </div>
                                    <div class="row align-items-end text-center"><p>회원 이미지</p></div>
                                </div>
                            </div>
                            <!-- 하단 메뉴(버튼) -->
                            <div class="row">
                                <div class="btn_field" align="center">
                                    <button type="submit" class="btn btn-primary btn-sm">수정하기</button>
                                    <button type="reset" class="btn btn-primary btn-sm">RESET</button>
                                    <button type="button" class="btn btn-primary btn-sm" onclick="location.href='../member/myinfo.do';">
                                        취소하기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div> <%-- content의 끝 --%>

<%@ include file="../include/footer.jsp"%>
<%--

<table class="table" border="1" width="90%">
    <input type="hidden" name="memId" value="${ mvo.memId }"/>
    &lt;%&ndash;        <input type="hidden" name="memImg" value="${ mvo.memImg }"/>&ndash;%&gt;
    <input type="hidden" name="memSImg" value="${ mvo.memSImg }" />
    
    
    &lt;%&ndash;        <tr>&ndash;%&gt;
    &lt;%&ndash;            <td>회원 이미지</td>&ndash;%&gt;
    &lt;%&ndash;            <td>&ndash;%&gt;
    &lt;%&ndash;                <input type="text" name="memImg" style="width:90%;" value="${ mvo.memImg }" />&ndash;%&gt;
    &lt;%&ndash;            </td>&ndash;%&gt;
    &lt;%&ndash;        </tr>&ndash;%&gt;
    &lt;%&ndash;<tr>
        <td>회원 이미지</td>
        <td>
            &lt;%&ndash;                <img src="../Uploads/${ mvo.memSImg }" style="max-width:20%;"/>&ndash;%&gt;
            <input type="file" name="memImg" onchange="setThumbnail(event);"/>
            &lt;%&ndash;                <% originImg =  mvo.memImg }%>&ndash;%&gt;
            <div id="image_container"></div>
        </td>
    
    </tr>&ndash;%&gt;
    <tr>
        <th class="table-light">아이디</th>
        <td class="field">
            ${ mvo.memId }
        </td>
        <td rowspan="6" style="vertical-align: middle;" >
            &lt;%&ndash;                <img src="../Uploads/${ mvo.memSImg }" style="max-width:20%;"/>&ndash;%&gt;
            <input class="form-control" id="formFile" type="file" name="memImg" onchange="setThumbnail(event);"/>
            &lt;%&ndash;                <% originImg =  mvo.memImg }%>&ndash;%&gt;
            <div id="image_container"></div>
        </td>
    </tr>
    <tr>
        <th class="table-light">이름</th>
        <td class="field">
            ${ mvo.memName }
        </td>
    </tr>
    <tr>
        <th class="table-light">지역</th>
        <td class="field">
            <select class="form-select form-control" name="memRegion" style="width: 30%">
                <option value="seoul" ${ mvo.memRegion == "seoul" ? "selected" : "" }>서울</option>
                <option value="kyeonggi" ${ mvo.memRegion == "kyeonggi" ? "selected" : "" }>경기</option>
                <option value="kangwon" ${ mvo.memRegion == "kangwon" ? "selected" : "" }>강원</option>
                <option value="chungcheong" ${ mvo.memRegion == "chungcheong" ? "selected" : "" }>충청</option>
                <option value="jeolla" ${ mvo.memRegion == "jeolla" ? "selected" : "" }>전라</option>
                <option value="kyeongsang" ${ mvo.memRegion == "kyeongsang" ? "selected" : "" }>경상</option>
                <option value="cheju" ${ mvo.memRegion == "cheju" ? "selected" : "" }>제주</option>
            </select>
        </td>
    </tr>
    <tr>
        <th class="table-light">주소</th>
        <td class="field">
            <input type="text" name="postCode" id="sample4_postcode" value="${fn:split(mvo.memAddr,'/')[0]}" placeholder="우편번호">
            <input type="button" class="btn btn-light btn-sm" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" name="roadAddr" id="sample4_roadAddress" value="${fn:split(mvo.memAddr,'/')[1]}" placeholder="도로명주소" size="60" ><br>
            <input type="hidden" name="jibunAddr" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
            <span id="guide" style="color:#999;display:none"></span>
            <input type="text" name="detailAddr" id="sample4_detailAddress" value="${fn:split(mvo.memAddr,'/')[2]}" placeholder="상세주소"  size="60"><br>
            <input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
            <input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" ><br><br>
        </td>
    </tr>
    <tr>
        <th class="table-light">자녀 학년</th>
        <td class="field">
            <select class="form-select form-control" name="memChildGrade" style="width: 30%">
                <option value="1" ${ mvo.memChildGrade == "1" ? "selected" : "" }>1학년</option>
                <option value="2" ${ mvo.memChildGrade == "2" ? "selected" : "" }>2학년</option>
                <option value="3" ${ mvo.memChildGrade == "3" ? "selected" : "" }>3학년</option>
                <option value="4" ${ mvo.memChildGrade == "4" ? "selected" : "" }>4학년</option>
                <option value="5" ${ mvo.memChildGrade == "5" ? "selected" : "" }>5학년</option>
                <option value="6" ${ mvo.memChildGrade == "6" ? "selected" : "" }>6학년</option>
            </select>
        </td>
    </tr>
    <tr>
        <th class="table-light">전화번호</th>
        <td class="field">
            <input type="text" name="memPhone" style="width:90%;" value="${ mvo.memPhone }" />
        </td>
    </tr>
    <tr style="border-bottom: 1px solid black">
        <th class="table-light">이메일</th>
        <td class="field">
            <input type="text" name="memEmail" style="width:90%;" value="${ mvo.memEmail }" />
        </td>
        <th class="table-light" style="text-align: center">회원 이미지</th>
    </tr>
</table>

                        <!-- 하단 메뉴(버튼) -->
                        <div class="btn_field" align="center">
                            <button type="submit" class="btn btn-primary btn-sm">수정하기</button>
                            <button type="reset" class="btn btn-primary btn-sm">RESET</button>
                            <button type="button" class="btn btn-primary btn-sm" onclick="location.href='../member/myinfo.do';">
                                취소하기
                            </button>
                        </div>
--%>
