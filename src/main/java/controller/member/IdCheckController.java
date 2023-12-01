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

@WebServlet("/member/idcheck.do")
public class IdCheckController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        MemberDAO dao = new MemberDAO();
        String memId = req.getParameter("memId");

        HttpSession session = req.getSession();

        session.setAttribute("memId",memId);

//        MemberVO vo = null;
//        if (memId != null ) {
//            // 쿼리스트링으로 전달받은 매개변수 중 검색어가 있다면 map에 저장
//            map.put("memId", memId);
//        }
        boolean check = dao.idCheck(memId);
        if (check){
            JSFunction.idCheck(resp, "이미 있는 아이디 입니다.");

        }
        else {
            JSFunction.idCheck(resp, "사용 가능한 아이디 입니다.");
        }
    }
}
