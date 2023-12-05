package controller.post.comment;

import dao.CommentDAO;
import dao.QNABoardDAO;
import utils.JSFunction;
import vo.CommentVO;
import vo.MemberVO;
import vo.QNABoardVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException; 


@WebServlet("/view/post/comment/write.do")
public class WriteController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        MemberVO mvo= new MemberVO();
        HttpSession session = req.getSession();
        String postNo = req.getParameter("postNo");
        mvo = (MemberVO) session.getAttribute("loginMember");
        System.out.println(mvo);

        // 2. 파일 업로드 외 처리 =============================
        // 폼값을 DTO에 저장
//        Encrypt en = new Encrypt();
        CommentVO cvo = new CommentVO();
        cvo.setMemId(mvo.getMemId());
        cvo.setPostNo(Integer.parseInt(postNo));
        cvo.setCommentTxt(req.getParameter("commentTxt"));

        CommentDAO dao = new CommentDAO();
        int result = dao.insertWrite(cvo);

        // 성공 or 실패?
        if (result == 1) {  // 글쓰기 성공
            resp.sendRedirect("../view.do?postNo="+postNo);
        }
        else {  // 글쓰기 실패
            JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.",
                    "../view.do?postNo="+postNo);
        }
    }
}