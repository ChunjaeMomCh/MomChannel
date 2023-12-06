package controller;

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

@WebServlet("/main.do")
public class MainController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // DAO 생성
        PostDAO dao = new PostDAO();
        // 게시물 목록 받기
        List<PostVO> latestPostLists = dao.showLatestPosts();
        List<PostVO> topPostLists = dao.showTopPosts();

        // 전달할 데이터를 request 영역에 저장 후 Post.jsp로 포워드
        req.setAttribute("latestPostLists", latestPostLists);
        req.setAttribute("topPostLists", topPostLists);
        req.getRequestDispatcher("./index.jsp").forward(req, resp);


    }
}
