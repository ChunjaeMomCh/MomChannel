package controller;

import dao.PostDAO;
import vo.PostVO;

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
@WebServlet("/post/post.do")
public class PostController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // DAO 생성
        PostDAO dao = new PostDAO();
        // 뷰에 전달할 매개변수를 저장할 맵 생성
        Map<String, Object> map = new HashMap<String, Object>();
        // 게시물 목록 받기
        List<PostVO> postLists = dao.showPosts(map);

        // 전달할 데이터를 request 영역에 저장 후 Post.jsp로 포워드
        req.setAttribute("postLists", postLists);
        req.setAttribute("map", map);
        req.getRequestDispatcher("/post/Post.jsp").forward(req, resp);
    }
}
