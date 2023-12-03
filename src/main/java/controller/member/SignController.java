package controller.member;

import dao.ChannelDAO;
import dao.MemberDAO;
import dao.QNABoardDAO;
import utils.Encrypt;
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

@WebServlet("/member/sign.do")
public class SignController extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        // 2. 파일 업로드 외 처리 =============================
        // 폼값을 DTO에 저장
//        Encrypt en = new Encrypt();
        MemberVO mvo= new MemberVO();
        String addr = null;

        //암호화해서 저장(sha256+salt)
        Encrypt en = new Encrypt();

        String memId = (String) session.getAttribute("memId");
        if (req.getParameter("roadAddr")==null){
            addr = req.getParameter("postCode").concat("/").concat(req.getParameter("roadAddr")).concat("/").concat(req.getParameter("detailAddr"));
        }else {
            addr = req.getParameter("postCode").concat("/").concat(req.getParameter("jibunAddr")).concat("/").concat(req.getParameter("detailAddr"));
        }
        mvo.setMemId(memId);
        mvo.setMemName(req.getParameter("memName"));
        mvo.setMemPw(en.getEncrypt(req.getParameter("memPw")));
        mvo.setMemRegion(req.getParameter("memRegion"));
        mvo.setMemAddr(addr);
        mvo.setMemChildGrade(Integer.parseInt(req.getParameter("memChildGrade")));
        mvo.setMemPhone(req.getParameter("memPhone"));
        mvo.setMemEmail(req.getParameter("memEmail"));

        // DAO를 통해 DB에 게시 내용 저장
        MemberDAO dao = new MemberDAO();
        int result = dao.insertMember(mvo);

        ChannelDAO cdao = new ChannelDAO();

        // 성공 or 실패?
        if (result == 1) {  // 글쓰기 성공
//            resp.sendRedirect("../view/Login/loginForm.jsp");
//            req.getRequestDispatcher("/view/Login/loginForm.jsp").forward(req, resp);
            int chResult = cdao.insertChannel(memId);
            if (chResult==1){
                JSFunction.alertLocation(resp, "회원가입에 성공했습니다.",
                        "../view/Login/loginForm.jsp");
            }
            else {
                JSFunction.alertBack(resp, "채널 생성에 실패했습니다.");
            }
        }
        else {  // 글쓰기 실패
            JSFunction.alertBack(resp, "회원가입에 실패했습니다.");
        }
    }
}
