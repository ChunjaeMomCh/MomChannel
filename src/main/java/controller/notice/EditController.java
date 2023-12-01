package controller.notice;


import dao.NoticeDAO;
import utils.JSFunction;
import vo.NoticeVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException; 

@WebServlet("/view/cs/notice/edit.do")
public class EditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String noticeNo = req.getParameter("idx");
        NoticeDAO dao = new NoticeDAO();
        NoticeVO vo = dao.selectNoticeView(noticeNo);
        req.setAttribute("vo", vo);
        req.getRequestDispatcher("./Edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 2. 파일 업로드 외 처리 =============================
        // 수정 내용을 매개변수에서 얻어옴
        String noticeNo = req.getParameter("noticeNo");
        String noticeCategory = req.getParameter("noticeCategory");
        String noticeTitle = req.getParameter("noticeTitle");
        String noticeContent = req.getParameter("noticeContent");




        NoticeVO vo = new NoticeVO();
        vo.setNoticeNo(Integer.parseInt(req.getParameter("noticeNo")));
        vo.setNoticeCategory(req.getParameter("noticeCategory"));
        vo.setNoticeTitle(req.getParameter("noticeTitle"));
        vo.setNoticeContent(req.getParameter("noticeContent"));


        // DB에 수정 내용 반영
        NoticeDAO dao = new NoticeDAO();


        int result = dao.updateNotice(vo);
        // 성공 or 실패?
        if (result == 1) {  // 수정 성공
            resp.sendRedirect("./view.do?idx=" + noticeNo);
        }
        else {  // 수정 실패
            JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.",
                    "./view.do?idx=" + noticeNo);
        }



    }
}