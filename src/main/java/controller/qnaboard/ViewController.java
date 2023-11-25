package controller.qnaboard;

import dao.QNABoardDAO;
import vo.QNABoardVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/qnaboard/view.do")
public class ViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 게시물 불러오기
        QNABoardDAO dao = new QNABoardDAO();
        String qnaNo = req.getParameter("qnaNo");
        QNABoardVO vo = dao.selectView(qnaNo);

        // 줄바꿈 처리
        vo.setQnaContent(vo.getQnaContent().replaceAll("\r\n", "<br/>"));

        // 게시물(vo) 저장 후 뷰로 포워드
        req.setAttribute("vo", vo);
        req.getRequestDispatcher("/view/QNABoard/View.jsp").forward(req, resp);
    }
}