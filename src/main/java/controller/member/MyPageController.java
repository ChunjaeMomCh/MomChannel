package controller.member;

import dao.MemberDAO;
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
import java.util.Arrays;
import java.util.List;

@WebServlet("/member/myinfo.do")
public class MyPageController extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 게시물 불러오기
        MemberDAO dao = new MemberDAO();
        HttpSession session = req.getSession();
        if (session.getAttribute("loginMember") == null) { // session 영역에 UserId라는 속성값이 있는지 확인. 없으면 로그인 안한것.
            JSFunction.alertLocation(resp, "로그인 후 이용해주십시오.",
//                    "../member/login.do");
                    "../view/Login/loginForm.jsp");
        }
        String memId = (String) session.getAttribute("memId");
        System.out.println(memId);
        MemberVO mvo = dao.selectMember(memId);

        String ext = null, fileName =  mvo.getMemImg();
        if(fileName!=null) {
            ext = fileName.substring(fileName.lastIndexOf(".")+1);
        }
        String[] mimeStr = {"png","jpg","gif"};
        List<String> mimeList = Arrays.asList(mimeStr);
        boolean isImage = false;
        if(mimeList.contains(ext)) {
            isImage = true;
        }

        // 게시물(vo) 저장 후 뷰로 포워드
        req.setAttribute("mvo", mvo);
        System.out.println(mvo.getMemName());
        System.out.println(mvo.getMemPhone());
        req.setAttribute("isImage", isImage);
        req.getRequestDispatcher("/view/member/myPage.jsp").forward(req, resp);
    }
}
