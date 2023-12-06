/**
 * 학년별 게시판 보기 페이지를 연결하는 서블릿
 * */

package controller.post;

import dao.PostDAO;
import utils.BoardPage;
import vo.PostVO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// 게시물 목록 읽기
@WebServlet("/view/post/by-region/list.do")
public class ListRegionController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // DAO 생성
        PostDAO dao = new PostDAO();
        // 뷰에 전달할 매개변수를 저장할 맵 생성
        Map<String, Object> map = new HashMap<String, Object>();

        // 파라미터 조건으로 검색 기능 구현
        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");
        String postSortBy = "post_no";
        map.put("postSortBy", postSortBy);
        String regionCategory = req.getParameter("region");
        if(regionCategory.equals("전국"))
            regionCategory=null;
        map.put("regionCategory", regionCategory);
        System.out.println("regionCategory"+regionCategory);
        if (searchWord != null && !searchWord.trim().equals("")) {
            // 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }

        int totalCount = dao.selectCount(map);  // 게시물 개수 확인


        // 페이징 처리문
        ServletContext application = getServletContext();
        int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
        int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

        // 현재 페이지 확인
        int pageNum = 1;  // 기본값
        String pageTemp = req.getParameter("pageNum");
        if (pageTemp != null && !pageTemp.equals(""))
            pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정

        // 목록에 출력할 게시물 범위 계산
        int start = (pageNum - 1) * pageSize + 1;  // 첫 게시물 번호
        int end = pageNum * pageSize; // 마지막 게시물 번호
        map.put("start", start);
        map.put("end", end);
        /* 페이지 처리 end */

        // 게시물 목록 받기
        List<PostVO> postLists = dao.showPosts(map);

        // 뷰에 전달할 매개변수 추가
        String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
                blockPage, pageNum,searchField,searchWord, "/view/post/by-region/list.do");  // 바로가기 영역 HTML 문자열
        System.out.println(totalCount);
        map.put("pagingImg", pagingImg);
        map.put("totalCount", totalCount);
        map.put("pageSize", pageSize);
        map.put("pageNum", pageNum);

        // 전달할 데이터를 request 영역에 저장 후 Post.jsp로 포워드
        req.setAttribute("postLists", postLists);
        req.setAttribute("map", map);
        req.getRequestDispatcher("./List.jsp").forward(req, resp);
    }
}
