package controller.post.comment;


import dao.CommentDAO;
import dao.PostDAO;
import dao.QNABoardDAO;
import utils.JSFunction;
import vo.CommentVO;
import vo.MemberVO;
import vo.PostVO;
import vo.QNABoardVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/view/post/comment/delete.do")
public class DeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String commentNo = req.getParameter("commentNo");
        CommentDAO cdao = new CommentDAO();
        CommentVO cvo = cdao.selectComment(commentNo);
        String memId = cvo.getMemId();
        int postNo = cvo.getPostNo();

        // post 작성자 id 불러오기
        PostDAO pdao = new PostDAO();
        PostVO pvo = pdao.viewPost(String.valueOf(postNo));

        HttpSession session = req.getSession();
        String loginId = (String)session.getAttribute("memId");
        if(loginId == null || loginId.equals("")){
            JSFunction.alertLocation(resp, "로그인 후 이용할 수 있습니다.",
                    "../view.do?postNo="+postNo);
        }


        if (memId.equals(loginId) || loginId.equals(pvo.getMemId())){
            cdao.deleteComment(commentNo);  // 게시물 삭제
            JSFunction.alertLocation(resp, "삭제되었습니다.", "../view.do?postNo="+postNo);
        }
        else {
            JSFunction.alertBack(resp, "이 글의 작성자가 아닙니다.");
        }

    }

}
