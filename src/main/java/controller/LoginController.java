package controller;

import dao.MemberDAO;
import utils.Encrypt;
import utils.JSFunction;
import vo.MemberVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/controller/login.do")
public class LoginController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 로그인 페이지에서 값 받아오기
        String userId = req.getParameter("mem_id");
        // 비밀번호는 암호화 처리후 저장
        String unEncrypt = req.getParameter("mem_pwd");
        String userPwd = Encrypt.getEncrypt(unEncrypt);

        // DB 처리할 값을 map에 저장
        Map<String, String> map = new HashMap<>();
        map.put("mem_id", userId);
        map.put("mem_pwd", userPwd);

        // DB 처리(메소드 호출)를 위해 dao 객체 생성
        MemberDAO dao = new MemberDAO();
        MemberVO vo = dao.memLogin(map);

        System.out.println("로그인 시도 결과2: " + vo);

        // 성공 or 실패
        if (vo != null) {
            req.getSession().setAttribute("loggedInUser", vo);
            req.getRequestDispatcher("/view/Main.jsp").forward(req, resp);
        }
        else {
            JSFunction.alertLocation(resp, "로그인에 실패하였습니다.",
                    "../view/LoginForm.jsp");
        }
    }
}
