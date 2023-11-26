package controller.qnaboard;


import dao.QNABoardDAO;
import utils.JSFunction;
import vo.QNABoardVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/qnaboard/delete.do")
public class DeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String qnaNo = req.getParameter("qnaNo");
        QNABoardDAO dao = new QNABoardDAO();
        QNABoardVO vo = dao.selectView(qnaNo);
        req.setAttribute("vo", vo);
        dao.deletePost(qnaNo);  // 게시물 삭제
        JSFunction.alertLocation(resp, "삭제되었습니다.", "../qnaboard/list.do");
    }

}
