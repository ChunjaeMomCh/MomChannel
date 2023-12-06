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
        // 게시물 정보 불러오기
        String postNo = req.getParameter("postNo");

        HttpSession session = req.getSession();
        MemberVO mvo = (MemberVO) session.getAttribute("loginMember");
        System.out.println(mvo);
        if(mvo == null){
            JSFunction.alertLocation(resp, "로그인 후 이용할 수 있습니다.",
                    "../view.do?postNo="+postNo);
        }

        // 댓글 폼값을 DTO에 저장
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