package controller.post;

import dao.PostDAO;
import utils.JSFunction;
import vo.MemberVO;
import vo.PostVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import static java.lang.System.out;

@WebServlet("/view/post/delete.do")
public class DeleteController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        MemberVO mvo = new MemberVO();
        HttpSession session = req.getSession();
        mvo = (MemberVO) session.getAttribute("loginMember");  // 로그인 정보를 받아온다.

        String postNo = req.getParameter("postNo");  // 게시물 번호

        PostDAO dao = new PostDAO();
        PostVO pvo = dao.viewPost(postNo);
        String memId = pvo.getMemId();
        req.setAttribute("pvo", pvo);

        if (memId.equals(mvo.getMemId())) {  // 삭제하려는 글의 게시자임을 확인한 경우

            dao.deletePost(postNo);  // 게시물 삭제
            JSFunction.alertLocation(resp, "삭제되었습니다.", "./list.do");

        } else {
            // 작성자가 아닌 사람이 삭제를 시도한 경우
            JSFunction.alertBack(resp, "이 글의 작성자가 아닙니다.");
        }

    }  // doGet()

}  // class
