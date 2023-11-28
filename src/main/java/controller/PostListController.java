package controller;

import dao.PostDAO;
import vo.PostVO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

// 게시물 목록 읽기
@WebServlet("/post/post.do")
public class PostListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // DAO 생성
        PostDAO dao = new PostDAO();
        // 뷰에 전달할 매개변수를 저장할 맵 생성
        Map<String, Object> map = new HashMap<String, Object>();

        // 검색 기능 구현
        String searchField = req.getParameter("searchField");
        String searchWord = req.getParameter("searchWord");

        if (searchWord != null && !searchWord.trim().equals("")) {
            // 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }
        /* 검색 end */

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

        // 전달할 데이터를 request 영역에 저장 후 Post.jsp로 포워드
        req.setAttribute("postLists", postLists);
        req.setAttribute("map", map);
        req.getRequestDispatcher("/post/Post.jsp").forward(req, resp);
    }
}
