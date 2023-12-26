<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<div class="content_snb " >
    <p class="snb_title">전체 게시판</p>
    <ul class="snb_list" id="cs_menu">
        <li class="snb_menu"><a href="/view/post/list.do" class="snb_menu_title">전체 게시판</a></li>
        <li class="snb_menu"><a href="/view/post/by-grade/list.do?grade=0" class="snb_menu_title">학년별 게시판</a></li>
        <li class="snb_menu"><a href="/view/post/by-region/list.do?region=전국" class="snb_menu_title">지역별 게시판</a></li>
    </ul>
</div>
<script>
    $(document).ready(function(){
        const path = window.location.pathname;
        if(path == "/view/post/list.do"){
            $('#cs_menu li').eq(0).addClass("active");
        } else if(path.includes("/view/post/by-grade/list.do?grade=0")) {
            $('#cs_menu li').eq(1).addClass("active");
        } else if(path.includes("/view/post/by-region/list.do?region=전국")) {
            $('#cs_menu li').eq(2).addClass("active");
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