package utils;

public class BoardPage {
    public static String pagingStr(int totalCount, int pageSize, int blockPage,
                                   int pageNum, String searchField, String searchWord, String reqUrl) {
        String pagingStr = "";

        // 단계 3 : 전체 페이지 수 계산
        int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));

        // 단계 4 : '이전 페이지 블록 바로가기' 출력
        int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
        // 첫 페이지
        pagingStr += "<li><a href='" + reqUrl + "?pageNum=1";
        if(searchField != null){
            pagingStr += "&searchField"+ "=" + searchField + "&searchWord"+ "=" + searchWord;
        }
        pagingStr += "'><i class=\"ico pprev\"></i></a></li>";
        // 이전 페이지
        if (pageNum == 1)
            pagingStr += "<li><a href='" + reqUrl + "?pageNum=1";
        else {
            pagingStr += "<li><a href='" + reqUrl + "?pageNum=" + (pageNum - 1);
        }
        if(searchField != null){
            pagingStr += "&searchField"+ "=" + searchField + "&searchWord"+ "=" + searchWord;
        }
        pagingStr += "'><i class=\"ico prev_04\"></i></a></li>";

        // 단계 5 : 각 페이지 번호 출력
        int blockCount = 1;

        while (blockCount <= blockPage && pageTemp <= totalPages) {
            if(pageTemp == pageNum)
                pagingStr += "<li class=\"active\">";
            else
                pagingStr += "<li>";
            pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp;
            if(searchField != null){
                pagingStr += "&searchField"+ "=" + searchField + "&searchWord"+ "=" + searchWord;
            }
            pagingStr += "'>" + pageTemp + "</a></li>";

            pageTemp++;
            blockCount++;
        }

        // 단계 6 : '다음 페이지 블록 바로가기' 출력
        if (pageNum <= totalPages) {
            if(pageNum == totalPages)
                pagingStr += "<li><a href='" + reqUrl + "?pageNum=" + pageNum;
            else
                pagingStr += "<li><a href='" + reqUrl + "?pageNum=" + (pageNum+1);
            if(searchField != null){
                pagingStr += "&searchField"+ "=" + searchField + "&searchWord"+ "=" + searchWord;
            }
            pagingStr += "'><i class=\"ico next_04\"></i></a></li>";
        }
        // 마지막 페이지
        pagingStr += "<li><a href='" + reqUrl + "?pageNum=" + totalPages;
        if(searchField != null)
            pagingStr += "&searchField" + "=" + searchField + "&searchWord" + "=" + searchWord;
        pagingStr +=  "'><i class=\"ico nnext\"></i></a></li>";

        return pagingStr;
    }
}