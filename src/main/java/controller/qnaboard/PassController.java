package controller.qnaboard;

import dao.QNABoardDAO;
import utils.Encrypt;
import vo.QNABoardVO;
import utils.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException; 

@WebServlet("/qnaboard/pass.do")
public class PassController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("mode", req.getParameter("mode"));
        req.getRequestDispatcher("/view/QNABoard/Pass.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 매개변수 저장
        Encrypt en = new Encrypt();
        String idx = req.getParameter("idx");
        String mode = req.getParameter("mode");
        String pass = en.getEncrypt(req.getParameter("pass"));

        // 비밀번호 확인
        QNABoardDAO dao = new QNABoardDAO();
        boolean confirmed = dao.confirmPassword(pass, idx);

        if (confirmed) {  // 비밀번호 일치
            if (mode.equals("edit")) {  // 수정 모드
                HttpSession session = req.getSession();
                session.setAttribute("pass", pass);
//                resp.sendRedirect("../qnaboard/edit.do?qnaNo=" + qnaNo);
            }
            else if (mode.equals("delete")) {  // 삭제 모드
                dao = new QNABoardDAO();
                QNABoardVO dto = dao.selectView(idx);
                int result = dao.deletePost(idx);  // 게시물 삭제
                JSFunction.alertLocation(resp, "삭제되었습니다.", "../qnaboard/list.do");
            }
        }
        else {  // 비밀번호 불일치
            JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
        }
    }
}