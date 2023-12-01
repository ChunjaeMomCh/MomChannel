package controller.notice;


import dao.NoticeDAO;
import utils.JSFunction;
import vo.MemberVO;
import vo.NoticeVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/view/cs/notice/delete.do")
public class DeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberVO mvo= new MemberVO();
        HttpSession session = req.getSession();
        mvo = (MemberVO) session.getAttribute("loginMember");

        String NoticeNo = req.getParameter("idx");

        NoticeDAO dao = new NoticeDAO();
        NoticeVO vo = dao.selectNoticeView(NoticeNo);
        req.setAttribute("vo", vo);

        dao.deleteNotice(NoticeNo);  // 게시물 삭제
        JSFunction.alertLocation(resp, "삭제되었습니다.", "./list.do");

    }

}
