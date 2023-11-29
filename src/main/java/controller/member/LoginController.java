package controller.member;


import dao.MemberDAO;
import utils.JSFunction;
import vo.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static java.lang.System.out;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        MemberDAO dao = new MemberDAO();
        String memId = req.getParameter("memId");
        String memPw = req.getParameter("memPw");
        out.println(memId);
        out.println(memPw);
        MemberVO vo = null;
        if (memId != null && memPw != null) {
            // 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
            out.println(memId);
            map.put("memId", memId);
            map.put("memPw", memPw);
        }
        boolean check = dao.memCheck(memId,memPw);
        out.println(check);
        if (check){
            vo = dao.getMember(memId);
            HttpSession session = req.getSession();
            if(session.isNew() || session.getAttribute("loginMember")==null) {
                session.setAttribute("loginMember", vo);
                session.setAttribute("memId",memId);
                    if(session.isNew())
                        out.println("Session 생성 후, 로그인 완료");
                    else out.println("로그인을 완료하였습니다.");
                resp.sendRedirect("../index.jsp");
            }

        }
        else {
            JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
        }
//        req.getRequestDispatcher("/view/QNABoard/qnaList.jsp").forward(req, resp);
    }
}
