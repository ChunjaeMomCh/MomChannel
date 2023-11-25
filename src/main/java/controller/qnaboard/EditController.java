package controller.qnaboard;

import dao.QNABoardDAO;
import vo.QNABoardVO;
import utils.JSFunction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/qnaboard/edit.do")
public class EditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String idx = req.getParameter("idx");
        QNABoardDAO dao = new QNABoardDAO();
        QNABoardVO dto = dao.selectView(idx);
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/QNABoard/Edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 2. 파일 업로드 외 처리 =============================
        // 수정 내용을 매개변수에서 얻어옴
        String idx = req.getParameter("idx");

        String name = req.getParameter("name");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        // 비밀번호는 session에서 가져옴
        HttpSession session = req.getSession();
        String pass = (String)session.getAttribute("pass");

        // DTO에 저장
        QNABoardVO dto = new QNABoardVO();
//        dto.setIdx(idx);
//        dto.setName(name);
//        dto.setTitle(title);
//        dto.setContent(content);
//        dto.setPass(pass);


        // DB에 수정 내용 반영
        QNABoardDAO dao = new QNABoardDAO();
        int result = dao.updatePost(dto);

        // 성공 or 실패?
        if (result == 1) {  // 수정 성공
            session.removeAttribute("pass");
            resp.sendRedirect("../qnaboard/view.do?idx=" + idx);
        }
        else {  // 수정 실패
            JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.",
                    "../qnaboard/view.do?idx=" + idx);
        }
    }
}