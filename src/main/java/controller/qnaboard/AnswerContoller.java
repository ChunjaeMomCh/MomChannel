package controller.qnaboard;

import dao.QNABoardDAO;
import utils.JSFunction;
import vo.MemberVO;
import vo.QNABoardVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/qnaboard/answer.do")
public class AnswerContoller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String qnaNo = req.getParameter("qnaNo");
        QNABoardDAO dao = new QNABoardDAO();
        QNABoardVO vo = dao.selectView(qnaNo);
        req.setAttribute("vo", vo);
        req.getRequestDispatcher("/view/QNABoard/answer.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberVO mvo= new MemberVO();
        HttpSession session = req.getSession();
        mvo = (MemberVO) session.getAttribute("loginMember");

        String qnaTitle  = "┗━ 답변 : ";
        // 2. 파일 업로드 외 처리 =============================
        // 폼값을 DTO에 저장
        QNABoardVO vo = new QNABoardVO();
        vo.setMemId(mvo.getMemId());
        vo.setQnaTitle(qnaTitle.concat(req.getParameter("qnaTitle")));
        vo.setQnaContent(req.getParameter("qnaContent"));
        vo.setQnaPNo(Integer.parseInt(req.getParameter("qnaNo")));
        vo.setQnaGroup(Integer.parseInt(req.getParameter("qnaNo")));


        if (mvo.getMemId().equals("admin")){
            // DAO를 통해 DB에 게시 내용 저장
            QNABoardDAO dao = new QNABoardDAO();
            int result = dao.insertWriteAnswer(vo);

            // 성공 or 실패?
            if (result == 1) {  // 글쓰기 성공
                resp.sendRedirect("../qnaboard/list.do");
            }
            else {  // 글쓰기 실패
                JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.",
                        "../qnaboard/write.do");
            }
        }
        else {
            JSFunction.alertBack(resp, "관리자가 아닙니다.");
        }


    }
}
