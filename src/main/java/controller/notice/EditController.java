package controller.notice;

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

@WebServlet("/view/cs/notice/edit.do")
public class EditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String qnaNo = req.getParameter("qnaNo");
        QNABoardDAO dao = new QNABoardDAO();
        QNABoardVO vo = dao.selectView(qnaNo);
        req.setAttribute("vo", vo);
        req.getRequestDispatcher("/view/cs/qna/Edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 2. 파일 업로드 외 처리 =============================
        // 수정 내용을 매개변수에서 얻어옴
        String qnaNo = req.getParameter("qnaNo");
        String memId = req.getParameter("memId");
        String qnaTitle = req.getParameter("qnaTitle");
        String qnaContent = req.getParameter("qnaContent");


        // 로그인 된 아이디는 session에서 가져옴
        MemberVO mvo= new MemberVO();
        HttpSession session = req.getSession();
        mvo = (MemberVO) session.getAttribute("loginMember");
//        String memId = mvo.getMemId();
        System.out.println(mvo.getMemId());
        // DTO에 저장
        QNABoardVO vo = new QNABoardVO();
        vo.setMemId(mvo.getMemId());
        vo.setQnaNo(qnaNo);
        vo.setQnaTitle(qnaTitle);
        vo.setQnaContent(qnaContent);
//        dto.setPass(pass);


        // DB에 수정 내용 반영
        QNABoardDAO dao = new QNABoardDAO();

        //작성자와 현재 로그인된 아이디가 일치하는지 확인후 수정
        if (memId.equals(mvo.getMemId())){
            int result = dao.updatePost(vo);
            // 성공 or 실패?
            if (result == 1) {  // 수정 성공
//            session.removeAttribute("pass");
                resp.sendRedirect("./view.do?qnaNo=" + qnaNo);
            }
            else {  // 수정 실패
                JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.",
                        "./view.do?qnaNo=" + qnaNo);
            }
        }else {
            JSFunction.alertBack(resp, "이 글의 작성자가 아닙니다.");
        }



    }
}