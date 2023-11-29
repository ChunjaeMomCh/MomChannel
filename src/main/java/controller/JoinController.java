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

@WebServlet("/controller/join.do")
public class JoinController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // form 입력값 받아오기
        MemberVO vo = new MemberVO();
        vo.setMem_id(req.getParameter("mem_id"));
        vo.setMem_name(req.getParameter("mem_name"));
        vo.setMem_region(req.getParameter("mem_region"));
        vo.setMem_addr(req.getParameter("mem_addr"));    // 상세 주소
        vo.setMem_child_grade(req.getParameter("mem_child_grade"));
        vo.setMem_email(req.getParameter("mem_email1")+"@"+req.getParameter("mem_email2"));
        vo.setMem_phone(req.getParameter("mem_phone"));

        // form 입력값 중 비밀번호는 암호화 처리
        String noEncPass = req.getParameter("mem_pwd");
        String encPass = Encrypt.getEncrypt(noEncPass);
        vo.setMem_pw(encPass);

        // DAO를 통해 DB에 회원정보 저장
        MemberDAO dao = new MemberDAO();
        int result = dao.memJoin(vo);
        if (result == 1) {
            resp.sendRedirect("../view/LoginForm.jsp");
        }
        else {
            JSFunction.alertLocation(resp, "회원가입에 실패했습니다.", "../view/JoinForm.jsp");
        }
    }
}
