package controller.notice;

import dao.NoticeDAO;
import vo.NoticeVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/notice/view.do")
public class ViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 게시물 불러오기
        NoticeDAO dao = new NoticeDAO();
        String noticeNo = req.getParameter("idx");
        NoticeVO vo = dao.selectNoticeView(noticeNo);

        // 줄바꿈 처리
        vo.setNoticeContent(vo.getNoticeContent().replaceAll("\r\n", "<br/>"));

        // 게시물(vo) 저장 후 뷰로 포워드
        req.setAttribute("vo", vo);
        req.getRequestDispatcher("/view/notice/View.jsp").forward(req, resp);
    }
}