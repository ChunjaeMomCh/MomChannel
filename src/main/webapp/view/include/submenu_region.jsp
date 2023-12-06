<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%--<div class="content_snb mo_none">--%>
<%--    <p class="snb_title">지역별 게시판</p>--%>
<%--    <div class="snb_menu open">--%>
<%--        <div class="snb_sub_menu">--%>
<%--            <ul class="menu_list grade" id="left_search_ele_grade">--%>
<%--                <div class="mb-3 mt-3">--%>
<%--                    <div class="form-check radio_opt">--%>
<%--                        <input type="checkbox" class="form-check-input" id="rCategory1" name="regionCategory" value="전체" checked>전체--%>
<%--                        <label class="form-check-label" for="rCategory1"></label>--%>
<%--                    </div>--%>
<%--                    <div class="form-check radio_opt">--%>
<%--                        <input type="checkbox" class="form-check-input" id="rCategory2" name="regionCategory" value="서울">서울--%>
<%--                        <label class="form-check-label" for="rCategory2"></label>--%>
<%--                    </div>--%>
<%--                    <div class="form-check radio_opt">--%>
<%--                        <input type="checkbox" class="form-check-input" id="rCategory3" name="regionCategory" value="전체">경기--%>
<%--                        <label class="form-check-label" for="rCategory3"></label>--%>
<%--                    </div>--%>
<%--                    <div class="form-check radio_opt">--%>
<%--                        <input type="checkbox" class="form-check-input" id="rCategory4" name="regionCategory" value="강원">강원--%>
<%--                        <label class="form-check-label" for="rCategory4"></label>--%>
<%--                    </div>--%>
<%--                    <div class="form-check radio_opt">--%>
<%--                        <input type="checkbox" class="form-check-input" id="rCategory5" name="regionCategory" value="충청">충청--%>
<%--                        <label class="form-check-label" for="rCategory5"></label>--%>
<%--                    </div>--%>
<%--                    <div class="form-check radio_opt">--%>
<%--                        <input type="checkbox" class="form-check-input" id="rCategory6" name="regionCategory" value="경상">경상--%>
<%--                        <label class="form-check-label" for="rCategory6"></label>--%>
<%--                    </div>--%>
<%--                    <div class="form-check radio_opt">--%>
<%--                        <input type="checkbox" class="form-check-input" id="rCategory7" name="regionCategory" value="전라">전라--%>
<%--                        <label class="form-check-label" for="rCategory7"></label>--%>
<%--                    </div>--%>
<%--                    <div class="form-check radio_opt">--%>
<%--                        <input type="checkbox" class="form-check-input" id="rCategory8" name="regionCategory" value="제주">제주--%>
<%--                        <label class="form-check-label" for="rCategory8"></label>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <li class="btn_list">--%>
<%--                    <template x-if="eleCateAllTypes.length == 7">--%>
<%--                        <a href="javascript:void(0)" @click="searchEle($event, 'button')" id="eleGrade6" :alt="eleCateAllTypes[6].code" class="btn" x-text="eleCateAllTypes[6].name" :class="{'active' : (eleCateAllTypes[6].code == boardCate)}"></a>--%>
<%--                    </template>--%>
<%--                    <a href="javascript:void(0)" class="add_unit_btn active" data-target="addUnit" @click.prevent="openChasiModal">차시로 검색하기</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<div class="content_snb " >
    <p class="snb_title">지역별 게시판</p>
    <ul class="snb_list" id="cs_menu">
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=전국" class="snb_menu_title">전국</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=서울" class="snb_menu_title">서울</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=경기" class="snb_menu_title">경기</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=강원" class="snb_menu_title">강원</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=충청" class="snb_menu_title">충청</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=경상" class="snb_menu_title">경상</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=전라" class="snb_menu_title">전라</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=제주" class="snb_menu_title">제주</a></li>
    </ul>
</div>
<script>
    $(document).ready(function(){
        const param = window.location.search;
        console.log(param);
        if(param.includes("?region=%EC%A0%84%EA%B5%AD")){
            $('#cs_menu li').eq(0).addClass("active");
        } else if(param.includes("?region=%EC%84%9C%EC%9A%B8")) {
            $('#cs_menu li').eq(1).addClass("active");
        } else if(param.includes("?region=%EA%B2%BD%EA%B8%B0")) {
            $('#cs_menu li').eq(2).addClass("active");
        } else if(param.includes("?region=%EA%B0%95%EC%9B%90")) {
            $('#cs_menu li').eq(3).addClass("active");
        } else if(param.includes("?region=%EC%B6%A9%EC%B2%AD")) {
            $('#cs_menu li').eq(4).addClass("active");
        } else if(param.includes("?region=%EA%B2%BD%EC%83%81")) {
            $('#cs_menu li').eq(5).addClass("active");
        } else if(param.includes("?region=%EC%A0%84%EB%9D%BC")) {
            $('#cs_menu li').eq(6).addClass("active");
        } else if(param.includes("?region=%EC%A0%9C%EC%A3%BC")) {
            $('#cs_menu li').eq(7).addClass("active");
        }
    });
    function getCommunity() {

        const optionFadeout = () => $('.option_list').fadeOut(50);

        const allMenu = {id:"", code:"", name:"전체"};

        const getListStatus = (_this, detailStatus) => {
            const { categoryId, boardType, boardCate, boardCate2, orderField, pageIndex, searchChasis, selectCommunityContentType, selectedSearchSubject, selectedSearchDetailSubject, list, totCnt } = _this;
            const listStatus = { categoryId, boardType, boardCate, boardCate2, orderField, pageIndex, searchChasis, selectCommunityContentType, selectedSearchSubject, selectedSearchDetailSubject, list, totCnt };
            return { listStatus, detailStatus }
        };

        return Object.assign(COMMON_CONTENT_FUNCTION({ getListStatus }),{
        likePathName:"학급운영",
            searchSubject: function(item){
            this.selectedSearchSubject = item;
            const _this = this;
            $.get("/community/E-community-category_data.html?parentId=" + item.id, function (list) {
                _this.searchDetailSubjects = JSON.parse(list);
            });
            this.selectedSearchDetailSubject = {id:"",name:"세부과목"};
            this.searchList(item);
        },
        searchDetailSubject: function(item){
            this.selectedSearchDetailSubject = item;
            this.searchList(item);
        },
        searchList: function(item){
            dataInit(this);
            optionFadeout();
            this.categoryId = item.id;
            nextTick(this);
        },
        searchEle: function(event, elType){
            dataInit(this);
            if(elType == "button"){
                document.getElementsByName("checkbox_ele").forEach(item => item.checked = false);
                if(this.boardCate == this.eleCateAllTypes[6].code){
                    this.boardCate = '';
                }else{
                    this.boardCate = event.target.getAttribute("alt");
                }
            }else{
                if(event.target.checked){
                    // checkbox는 한개만 선택 가능.
                    //document.getElementsByName("checkbox_ele").forEach(item => item.checked = false);
                    //event.target.checked = true;
                    this.boardCate = event.target.value;
                }else{
                    this.boardCate = '';
                }
            }
            if(this.searchChasis != ""){
                this.searchChasis = "";
                this.selectCommunityContentType = "";
            }
            nextTick(this);
        },
        searchContentType: function(id){
            dataInit(this);
            this.selectCommunityContentType = id;
            nextTick(this);
        },
        initSearch: function(){
            searchInit(this);
            nextTick(this);
        },
            initFn: function () {
                const _this = this;
                const all = {id:"", text:"전체"};

                if(this.boardType == "E-community-ex"){
                    this.communityContentTypes = [all, ...channel_dictionary.community_content_type.ex];
                    this.communityContentStyles = [all, ...community_content_style.ex];
                }else if(this.boardType == "E-community-class") {
                    this.communityContentTypes = [all, ...channel_dictionary.community_content_type.class];
                    this.communityContentStyles = [all, ...community_content_style.class];
                }else if(this.boardType == "E-community-curri-ele"){
                    this.communityContentTypes = [all, ...channel_dictionary.community_content_type.curri];
                    this.communityContentStyles = [all, ...community_content_style.curri];
                }else{
                    this.communityContentTypes = [all, ...channel_dictionary.community_content_type.other];
                    this.communityContentStyles = [all, ...community_content_style.other];
                }
                _this.$watch('orderField', function (v){
                    _this.sortText =  v === "scores" ? "인기순" : "최신순";
                });

                const storageStatus = ListStorageUtil.getStatus();
                if(storageStatus){
                    Object.assign(_this, storageStatus.listStatus);
                    if(storageStatus.detailStatus){
                        const arr = _this.list.filter(v=>v.id == storageStatus.detailStatus);
                        if(arr.length > 0){
                            _this.getGoodScrap(arr);
                        }
                    }
                    return;
                }
                _this.orderField = 'publishDate';
                nextTick(_this);
            },
            getList: function () { // 글 목록 조회
                front.loading.showLoading();
                let _this = this;
                callAjax('searchContent', function (data) {
                    try {
                        //console.log(data);
                        let result = JSON.parse(data);
                        let list = result['list'] || [];
                        if(list.length > 0) _this.getGoodScrap(list);

                        _this.totCnt = Number(result['totCnt']) || 0;
                        _this.pageSize = Number(result['pageSize']);

                        list.forEach(item => {
                            item.contentType = "";
                            item.contentStyle = "";
                            for(let i=1;i<_this.communityContentTypes.length;i++){
                                const type = _this.communityContentTypes[i]
                                const style = _this.communityContentStyles[i];
                                if(type.id === item.attribute1){
                                    item.contentType = type.text;
                                    item.contentStyle = style.class;
                                    break;
                                }
                            }
                        });
                        _this.list.push(...list);

                    } catch (e) {
                        console.log(e);
                    }
                    front.loading.hideLoading();
                });
            },
            openChasiModal: function(){
                $("#chasiSelect").modal('hide');
                $("#addUnit").load("/community/modal/chasi_popup_search.html",
                    function (response, status, xhr) {
                        $("#chasiSelect").modal('show');
                        $('#chasiSelect').on('shown.bs.modal', function () {
                            $(".modal-backdrop.in").hide();
                        })
                    }
                );
            },
            selectChasi: function (chasiList, grade, semester, curri) { // 선택된 차시
                const chasis = [];
                chasiList.forEach(item => {
                    chasis.push("chasi1_" + item.id + ",chasi2_" + item.id + ",chasi3_" + item.id + ",chasi4_" + item.id + ",chasi5_" + item.id);
                });
                searchInit(this);
                this.searchChasis = chasis.join();
                nextTick(this);
            },
            moreList: function(){
                if(this.list.length < this.totCnt){
                    this.pageIndex += 1;
                    nextTick(this);
                }
            },
            orderChange: function (value) { // 최신순, 인기순
                this.orderField = value;
                dataInit(this);
                nextTick(this);
            }

        });
    }

</script>